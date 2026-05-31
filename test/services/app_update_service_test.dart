import 'package:flutter_test/flutter_test.dart';
import 'package:pristine_cleaner/services/app_update_service.dart';

void main() {
  group('AppUpdateService.normalizeTagToSemver', () {
    test('strips v prefix', () {
      expect(AppUpdateService.normalizeTagToSemver('v1.2.3'), '1.2.3');
    });

    test('accepts prerelease/build metadata', () {
      expect(
        AppUpdateService.normalizeTagToSemver('v1.2.3-beta.1+abc'),
        '1.2.3-beta.1+abc',
      );
    });

    test('rejects invalid tag names', () {
      expect(AppUpdateService.normalizeTagToSemver('release-1.2.3'), isNull);
      expect(AppUpdateService.normalizeTagToSemver(''), isNull);
    });
  });

  group('AppUpdateService.detectArchitecture', () {
    test('maps aarch64 alias to arm64', () {
      final arch = AppUpdateService.detectArchitecture(
        rawKernelArchitecture: 'aarch64',
        kernelArchitectureName: 'UNKNOWN',
      );

      expect(arch, CpuArchitecture.arm64);
    });

    test('maps amd64 alias to x86_64', () {
      final arch = AppUpdateService.detectArchitecture(
        rawKernelArchitecture: 'amd64',
        kernelArchitectureName: 'UNKNOWN',
      );

      expect(arch, CpuArchitecture.x86_64);
    });
  });

  group('AppUpdateService.resolveAssetForTarget', () {
    test('prefers Windows exe over msix', () {
      final asset = AppUpdateService.resolveAssetForTarget(
        target: const RuntimeTarget(
          platform: DesktopPlatform.windows,
          architecture: CpuArchitecture.x86_64,
        ),
        assets: const [
          GitHubReleaseAsset(
            name: 'PristineCleaner-windows-x86_64.msix',
            downloadUrl: 'https://example/msix',
          ),
          GitHubReleaseAsset(
            name: 'PristineCleaner-windows-x86_64.exe',
            downloadUrl: 'https://example/exe',
          ),
        ],
      );

      expect(asset?.downloadUrl, 'https://example/exe');
    });

    test('prefers Linux deb over rpm for x86_64', () {
      final asset = AppUpdateService.resolveAssetForTarget(
        target: const RuntimeTarget(
          platform: DesktopPlatform.linux,
          architecture: CpuArchitecture.x86_64,
        ),
        assets: const [
          GitHubReleaseAsset(
            name: 'pristine-cleaner-linux-x86_64.rpm',
            downloadUrl: 'https://example/rpm',
          ),
          GitHubReleaseAsset(
            name: 'pristine-cleaner-linux-x86_64.deb',
            downloadUrl: 'https://example/deb',
          ),
        ],
      );

      expect(asset?.downloadUrl, 'https://example/deb');
    });

    test('returns null for Linux arm64 when only x86_64 assets exist', () {
      final asset = AppUpdateService.resolveAssetForTarget(
        target: const RuntimeTarget(
          platform: DesktopPlatform.linux,
          architecture: CpuArchitecture.arm64,
        ),
        assets: const [
          GitHubReleaseAsset(
            name: 'pristine-cleaner-linux-x86_64.deb',
            downloadUrl: 'https://example/deb',
          ),
        ],
      );

      expect(asset, isNull);
    });

    test('accepts x86_64 Windows asset without explicit arch token', () {
      final asset = AppUpdateService.resolveAssetForTarget(
        target: const RuntimeTarget(
          platform: DesktopPlatform.windows,
          architecture: CpuArchitecture.x86_64,
        ),
        assets: const [
          GitHubReleaseAsset(
            name: 'PristineCleaner-windows.exe',
            downloadUrl: 'https://example/exe',
          ),
        ],
      );

      expect(asset?.downloadUrl, 'https://example/exe');
    });

    test('requires explicit arm64 token on Windows arm64', () {
      final asset = AppUpdateService.resolveAssetForTarget(
        target: const RuntimeTarget(
          platform: DesktopPlatform.windows,
          architecture: CpuArchitecture.arm64,
        ),
        assets: const [
          GitHubReleaseAsset(
            name: 'PristineCleaner-windows.exe',
            downloadUrl: 'https://example/exe',
          ),
        ],
      );

      expect(asset, isNull);
    });

    test('allows platform-neutral dmg on macOS x86_64', () {
      final asset = AppUpdateService.resolveAssetForTarget(
        target: const RuntimeTarget(
          platform: DesktopPlatform.macos,
          architecture: CpuArchitecture.x86_64,
        ),
        assets: const [
          GitHubReleaseAsset(
            name: 'PristineCleaner-1.0.1.dmg',
            downloadUrl: 'https://example/dmg',
          ),
        ],
      );

      expect(asset?.downloadUrl, 'https://example/dmg');
    });
  });
}
