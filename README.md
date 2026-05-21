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

### Smart Care

- Reads disk capacity, used space, and free space.
- Shows usage percentage and progress indicators.
- Refresh action re-queries system disk information.

### Cleanup

- Scans common cache/temp/log locations.
- Returns itemized results with size totals.
- Supports select/deselect, rescan, and clean actions.

### My Clutter

- Two scan modes:
  - Large Files (default threshold: 50 MB)
  - Downloads folder contents
- Supports item selection and cleanup flow.

### Space Lens

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

### My Clutter scan roots

- Large Files: user home directory (`$HOME` or `%USERPROFILE%`)
- Downloads: `~/Downloads` or `%USERPROFILE%\\Downloads`

## Project Structure

```text
lib/
	app.dart                     # MaterialApp setup
	main.dart                    # app bootstrap + desktop window config
	core/
		models/                    # file/scan/nav data models
		services/                  # disk scan + trash/delete services
		theme/                     # app and section theme definitions
		utils/                     # formatting helpers
	features/
		smart_care/
		cleanup/
		my_clutter/
		space_lens/
		applications/
		shell/                     # sidebar + section host screen
		shared/                    # shared view model logic
	shared/widgets/              # reusable UI widgets (lists, buttons, layouts)
```

## Tech Stack

- Flutter (desktop)
- Dart
- `flutter_riverpod` for state management
- `window_manager` for custom desktop window behavior
- `file_picker`, `path_provider`, `intl`

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

## Build Commands

```bash
flutter build macos
flutter build windows
flutter build linux
```

## Behavior and Safety Notes

- Clean actions use OS-native trash flows when possible:
  - macOS: AppleScript/Finder delete
  - Linux: `gio trash` (fallback: `gvfs-trash`)
  - Windows: PowerShell + Recycle Bin API
- If trash move fails, code falls back to permanent delete for that item.
- File-system errors during scanning/deletion are caught to keep UI responsive.

## Current Limitations

- No Android/iOS targets in this workspace.
- No automated integration tests for scan/clean flows yet.
- Some sections are intentionally placeholders (`My Tools`, `My Activity`).
- Very large recursive scans can be time-consuming on slow disks.

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

## License

No license file is currently included in this repository.
