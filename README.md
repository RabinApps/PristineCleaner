# Pristine Cleaner

Pristine Cleaner is a desktop file cleaning utility built with Flutter.

It provides a modern sidebar-driven interface to:

- inspect disk usage,
- scan for removable clutter,
- select files/folders/apps to remove,
- move selected items to Trash/Recycle Bin.

Supported desktop targets:

- macOS
- Linux
- Windows

## What Is Implemented

### Home

- Reads disk capacity, used space, and free space.
- Shows usage percentage and progress indicators.
- Refresh action re-queries system disk information.

### Cleanup

- Scans common cache/temp/log locations.
- Returns itemized results with size totals.
- Supports select/deselect, rescan, and clean actions.

### Clutter

- Two scan modes:
  - Large Files (default threshold: 50 MB)
  - Downloads folder contents
- Supports item selection and cleanup flow.

### Space View

- Scans top folders in the user home directory.
- Computes folder sizes and displays storage distribution.
- Supports selection and cleanup.

### Applications

- Scans installed application directories by platform.
- Returns apps/folders sorted by size.
- Supports selection and cleanup.

### Shell and Navigation

- Animated section switching.
- Sidebar with main sections and placeholder bottom items (`My Tools`, `My Activity`).

## Scan Targets By Platform

### Cleanup scan paths

- macOS:
  - `~/Library/Caches`
  - `~/Library/Logs`
  - `/Library/Logs`
- Linux:
  - `~/.cache`
  - `/tmp`
- Windows:
  - `%TEMP%`
  - `%LOCALAPPDATA%\\Temp`

### Applications scan paths

- macOS: `/Applications` (`*.app` bundles)
- Linux: `/opt`
- Windows:
  - `C:\\Program Files`
  - `C:\\Program Files (x86)`

### Clutter scan roots

- Large Files: user home directory (`$HOME` or `%USERPROFILE%`)
- Downloads: `~/Downloads` or `%USERPROFILE%\\Downloads`

## Tech Stack

- Flutter (desktop)
- Dart
- `flutter_riverpod` for state management
- `go_router` for navigation/routing
- `window_manager` for custom desktop window behavior
- `file_picker`, `path_provider`, `intl`, `image`
- Fastforge (`distribute_options.yaml`) for desktop packaging
- GitHub Actions + GitHub Releases for release artifact publishing

## Requirements

- Flutter SDK compatible with `sdk: ^3.11.5`
- Desktop toolchains installed for your target OS:
  - Xcode + Cocoa tools (macOS)
  - Visual Studio Build Tools (Windows)
  - GTK/CMake toolchain (Linux)

## Getting Started

1. Install dependencies:

```bash
flutter pub get
```

2. Run on your current desktop platform:

```bash
flutter run
```

3. Run on a specific desktop device:

```bash
flutter run -d macos
flutter run -d windows
flutter run -d linux
```

## App Icon Generation

The desktop app icon is generated with [`icons_launcher`](https://pub.dev/packages/icons_launcher) using the source image at `assets/images/PristineCleanerIcon.png`.

1. Fetch dependencies if needed:

```bash
flutter pub get
```

2. Generate the launcher icons from `pubspec.yaml`:

```bash
dart run icons_launcher:create --path pubspec.yaml
```

This updates the platform-specific icon assets for the desktop targets configured in the package:

- macOS: `macos/Runner/Assets.xcassets/AppIcon.appiconset`
- Linux: `snap/gui/`
- Windows: `windows/runner/resources/app_icon.ico`

## Build Commands

```bash
flutter build macos
flutter build windows
flutter build linux
```

## Update Translations

```bash
dart run build_runner build
```

## Release and Distribution

Desktop release packaging is configured in `distribute_options.yaml` and automated by `.github/workflows/release-desktop.yml`.

### CI release flow

- Triggered by pushing tags that match `v*`.
- Can also run manually via `workflow_dispatch` with an optional `release_tag` input.
- Builds desktop artifacts with Fastforge for:
  - macOS: DMG
  - Windows: EXE and MSIX
  - Linux x86_64: DEB and RPM
- Uploads generated files from `dist/` to GitHub Releases

### Required GitHub repository secrets

- `R2_ACCOUNT_ID`
- `R2_ACCESS_KEY_ID`
- `R2_SECRET_ACCESS_KEY`
- `R2_BUCKET`

### Local packaging command (without upload)

```bash
dart pub global activate fastforge 0.6.6
fastforge release --name desktop-macos --skip-clean
fastforge release --name desktop-windows --skip-clean
fastforge release --name desktop-linux-x64 --skip-clean
```

Artifacts are written to `dist/`.

## Behavior and Safety Notes

- Clean actions use OS-native trash flows when possible:
  - macOS: AppleScript/Finder delete
  - Linux: `gio trash` (fallback: `gvfs-trash`)
  - Windows: PowerShell + Recycle Bin API
- If trash move fails, code falls back to permanent delete for that item.
- File-system errors during scanning/deletion are caught to keep UI responsive.

## Current Limitations

- Very large recursive scans can be time-consuming on slow disks.
- CI release matrix currently builds Linux `x86_64` artifacts only (ARM64 definitions exist in `distribute_options.yaml` but are not included in the workflow matrix).
- Need to code sign macos in the future https://federicoterzi.com/blog/automatic-code-signing-and-notarization-for-macos-apps-using-github-actions/

## Configuration Notes

- App display name/title: `PristineCleaner`
- Bundle/Application identifiers currently set to:
  - macOS bundle ID: `com.rabinapps.pristinecleaner`
  - Linux application ID: `com.rabinapps.pristinecleaner`
  - Windows metadata namespace: `com.rabinapps.pristinecleaner`

## Useful Flutter Commands

```bash
flutter doctor
flutter analyze
flutter test
```

## Patrol E2E Tests (macOS)

This project includes a Patrol end-to-end smoke test at `patrol_test/app_test.dart`.

1. Install Patrol CLI:

```bash
dart pub global activate patrol_cli
```

2. Ensure Dart global executables are on your shell `PATH` (zsh example):

```bash
export PATH="$PATH:$HOME/.pub-cache/bin"
```

3. Verify environment readiness:

```bash
patrol doctor
```

4. Run Patrol E2E on macOS:

```bash
patrol test -d macos --target patrol_test/app_test.dart
```
