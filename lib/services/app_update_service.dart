import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:system_info2/system_info2.dart';

const String kUpdateRepoOwner = 'RabinApps';
const String kUpdateRepoName = 'PristineCleaner';

const Duration _releaseCacheTtl = Duration(minutes: 5);

class AppUpdateService {
  AppUpdateService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  GitHubRelease? _cachedLatestRelease;
  DateTime? _cachedLatestFetchedAt;

  Future<String> getLatestVersionForCurrentPlatform({
    required String currentVersion,
  }) async {
    final release = await fetchLatestRelease();
    final latestVersion = normalizeTagToSemver(release.tagName);
    if (latestVersion == null) {
      return currentVersion;
    }

    final target = detectRuntimeTarget();
    final selectedAsset = resolveAssetForTarget(
      assets: release.assets,
      target: target,
    );

    // No compatible installer for this host, keep updater in up-to-date state.
    if (selectedAsset == null) {
      return currentVersion;
    }

    return latestVersion;
  }

  Future<String?> getChangelog({required String latestVersion}) async {
    final release = await fetchReleaseForVersion(latestVersion);
    if (release.body.trim().isEmpty) {
      return null;
    }
    return release.body;
  }

  Future<String> getBinaryUrlForCurrentPlatform({
    required String? latestVersion,
  }) async {
    if (latestVersion == null || latestVersion.isEmpty) {
      throw StateError(
        'Missing latest version while resolving update binary URL.',
      );
    }

    final release = await fetchReleaseForVersion(latestVersion);
    final target = detectRuntimeTarget();
    final selectedAsset = resolveAssetForTarget(
      assets: release.assets,
      target: target,
    );

    if (selectedAsset == null) {
      throw StateError(
        'No compatible installer found for ${target.platform.name}/${target.architecture.name}.',
      );
    }

    return selectedAsset.downloadUrl;
  }

  Future<GitHubRelease> fetchLatestRelease() async {
    final now = DateTime.now();
    final cached = _cachedLatestRelease;
    final cachedAt = _cachedLatestFetchedAt;

    if (cached != null &&
        cachedAt != null &&
        now.difference(cachedAt) <= _releaseCacheTtl) {
      return cached;
    }

    final uri = Uri.https(
      'api.github.com',
      '/repos/$kUpdateRepoOwner/$kUpdateRepoName/releases/latest',
    );
    final release = await _fetchRelease(uri);

    _cachedLatestRelease = release;
    _cachedLatestFetchedAt = now;
    return release;
  }

  Future<GitHubRelease> fetchReleaseForVersion(String latestVersion) async {
    final normalizedVersion = latestVersion.trim();
    final tagName = normalizedVersion.startsWith('v')
        ? normalizedVersion
        : 'v$normalizedVersion';

    final cached = _cachedLatestRelease;
    if (cached != null && cached.tagName == tagName) {
      return cached;
    }

    final uri = Uri.https(
      'api.github.com',
      '/repos/$kUpdateRepoOwner/$kUpdateRepoName/releases/tags/$tagName',
    );
    return _fetchRelease(uri);
  }

  Future<GitHubRelease> _fetchRelease(Uri uri) async {
    final response = await _client.get(
      uri,
      headers: <String, String>{
        'Accept': 'application/vnd.github+json',
        'User-Agent': 'PristineCleaner-Updater',
      },
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw HttpException(
        'GitHub release request failed with status ${response.statusCode}',
      );
    }

    final dynamic decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Unexpected GitHub release response format.');
    }

    return GitHubRelease.fromJson(decoded);
  }

  static String? normalizeTagToSemver(String tagName) {
    final trimmed = tagName.trim();
    if (trimmed.isEmpty) {
      return null;
    }

    final candidate = trimmed.startsWith('v') ? trimmed.substring(1) : trimmed;
    final semverPattern = RegExp(
      r'^\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?(?:\+[0-9A-Za-z.-]+)?$',
    );
    if (!semverPattern.hasMatch(candidate)) {
      return null;
    }
    return candidate;
  }

  static RuntimeTarget detectRuntimeTarget() {
    final platform = switch (Platform.operatingSystem) {
      'macos' => DesktopPlatform.macos,
      'windows' => DesktopPlatform.windows,
      _ => DesktopPlatform.linux,
    };

    final architecture = detectArchitecture(
      rawKernelArchitecture: SysInfo.rawKernelArchitecture,
      kernelArchitectureName: SysInfo.kernelArchitecture.name,
    );

    return RuntimeTarget(platform: platform, architecture: architecture);
  }

  static CpuArchitecture detectArchitecture({
    required String rawKernelArchitecture,
    required String kernelArchitectureName,
  }) {
    final values = <String>[
      rawKernelArchitecture.toLowerCase(),
      kernelArchitectureName.toLowerCase(),
    ];

    for (final value in values) {
      if (value.contains('arm64') || value.contains('aarch64')) {
        return CpuArchitecture.arm64;
      }
      if (value.contains('x86_64') ||
          value.contains('amd64') ||
          value.contains('x64')) {
        return CpuArchitecture.x86_64;
      }
    }

    // Prefer x86_64 as a conservative default for legacy hosts.
    return CpuArchitecture.x86_64;
  }

  static GitHubReleaseAsset? resolveAssetForTarget({
    required List<GitHubReleaseAsset> assets,
    required RuntimeTarget target,
  }) {
    var targetAssets = assets
        .where((asset) => _matchesPlatform(asset.name, target.platform))
        .toList(growable: false);

    if (targetAssets.isEmpty) {
      targetAssets = assets
          .where((asset) => !_mentionsAnyPlatform(asset.name))
          .toList(growable: false);
      if (targetAssets.isEmpty) {
        return null;
      }
    }

    final extensionOrder = switch (target.platform) {
      DesktopPlatform.macos => const <String>['dmg'],
      DesktopPlatform.windows => const <String>['exe', 'msix'],
      DesktopPlatform.linux => const <String>['deb', 'rpm'],
    };

    for (final extension in extensionOrder) {
      final extensionMatches = targetAssets
          .where((asset) => _fileExtension(asset.name) == extension)
          .toList(growable: false);

      if (extensionMatches.isEmpty) {
        continue;
      }

      final exactArchMatches =
          extensionMatches
              .where(
                (asset) =>
                    _matchesArchitecture(asset.name, target.architecture),
              )
              .toList(growable: false)
            ..sort((a, b) => a.name.compareTo(b.name));

      if (exactArchMatches.isNotEmpty) {
        return exactArchMatches.first;
      }

      if (target.architecture == CpuArchitecture.x86_64) {
        final archlessMatches =
            extensionMatches
                .where((asset) => !_mentionsAnyArchitecture(asset.name))
                .toList(growable: false)
              ..sort((a, b) => a.name.compareTo(b.name));

        if (archlessMatches.isNotEmpty) {
          return archlessMatches.first;
        }
      }
    }

    return null;
  }

  static String _fileExtension(String fileName) {
    final dotIndex = fileName.lastIndexOf('.');
    if (dotIndex == -1 || dotIndex == fileName.length - 1) {
      return '';
    }
    return fileName.substring(dotIndex + 1).toLowerCase();
  }

  static bool _matchesPlatform(String fileName, DesktopPlatform platform) {
    final words = _normalizedWords(fileName);
    final aliases = switch (platform) {
      DesktopPlatform.macos => const <String>{'macos', 'darwin', 'osx', 'mac'},
      DesktopPlatform.windows => const <String>{
        'windows',
        'win',
        'win32',
        'win64',
      },
      DesktopPlatform.linux => const <String>{'linux'},
    };
    return words.any(aliases.contains);
  }

  static bool _mentionsAnyPlatform(String fileName) {
    final words = _normalizedWords(fileName);
    const platformWords = <String>{
      'macos',
      'darwin',
      'osx',
      'mac',
      'windows',
      'win',
      'win32',
      'win64',
      'linux',
    };
    return words.any(platformWords.contains);
  }

  static bool _matchesArchitecture(
    String fileName,
    CpuArchitecture architecture,
  ) {
    final words = _normalizedWords(fileName);
    final aliases = switch (architecture) {
      CpuArchitecture.x86_64 => const <String>{'x86_64', 'x64', 'amd64'},
      CpuArchitecture.arm64 => const <String>{'arm64', 'aarch64'},
    };
    return words.any(aliases.contains);
  }

  static bool _mentionsAnyArchitecture(String fileName) {
    final words = _normalizedWords(fileName);
    return words.contains('x86_64') ||
        words.contains('x64') ||
        words.contains('amd64') ||
        words.contains('arm64') ||
        words.contains('aarch64');
  }

  static Set<String> _normalizedWords(String value) {
    return value
        .toLowerCase()
        .split(RegExp(r'[^a-z0-9_]+'))
        .where((part) => part.isNotEmpty)
        .toSet();
  }
}

enum DesktopPlatform { macos, windows, linux }

enum CpuArchitecture { x86_64, arm64 }

class RuntimeTarget {
  const RuntimeTarget({required this.platform, required this.architecture});

  final DesktopPlatform platform;
  final CpuArchitecture architecture;
}

class GitHubRelease {
  const GitHubRelease({
    required this.tagName,
    required this.body,
    required this.assets,
  });

  final String tagName;
  final String body;
  final List<GitHubReleaseAsset> assets;

  factory GitHubRelease.fromJson(Map<String, dynamic> json) {
    final assetsJson = (json['assets'] as List<dynamic>? ?? const <dynamic>[])
        .whereType<Map<String, dynamic>>()
        .toList(growable: false);

    return GitHubRelease(
      tagName: (json['tag_name'] as String? ?? '').trim(),
      body: json['body'] as String? ?? '',
      assets: assetsJson
          .map(GitHubReleaseAsset.fromJson)
          .toList(growable: false),
    );
  }
}

class GitHubReleaseAsset {
  const GitHubReleaseAsset({required this.name, required this.downloadUrl});

  final String name;
  final String downloadUrl;

  factory GitHubReleaseAsset.fromJson(Map<String, dynamic> json) {
    return GitHubReleaseAsset(
      name: (json['name'] as String? ?? '').trim(),
      downloadUrl: (json['browser_download_url'] as String? ?? '').trim(),
    );
  }
}
