///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$app$en app = Translations$app$en.internal(_root);
	late final Translations$language$en language = Translations$language$en.internal(_root);
	late final Translations$navigation$en navigation = Translations$navigation$en.internal(_root);
	late final Translations$settings$en settings = Translations$settings$en.internal(_root);
	late final Translations$sections$en sections = Translations$sections$en.internal(_root);
	late final Translations$progress$en progress = Translations$progress$en.internal(_root);
	late final Translations$errors$en errors = Translations$errors$en.internal(_root);
	late final Translations$buttons$en buttons = Translations$buttons$en.internal(_root);
	late final Translations$tooltips$en tooltips = Translations$tooltips$en.internal(_root);
	late final Translations$dialogs$en dialogs = Translations$dialogs$en.internal(_root);
	late final Translations$removal$en removal = Translations$removal$en.internal(_root);
	late final Translations$done$en done = Translations$done$en.internal(_root);
	late final Translations$donate$en donate = Translations$donate$en.internal(_root);
	late final Translations$cleanupManager$en cleanupManager = Translations$cleanupManager$en.internal(_root);
	late final Translations$projectDirectory$en projectDirectory = Translations$projectDirectory$en.internal(_root);
	late final Translations$searchAndSort$en searchAndSort = Translations$searchAndSort$en.internal(_root);
	late final Translations$spaceView$en spaceView = Translations$spaceView$en.internal(_root);
	late final Translations$home$en home = Translations$home$en.internal(_root);
	late final Translations$myToolsPage$en myToolsPage = Translations$myToolsPage$en.internal(_root);
	late final Translations$myToolsMessages$en myToolsMessages = Translations$myToolsMessages$en.internal(_root);
	late final Translations$myToolsCatalog$en myToolsCatalog = Translations$myToolsCatalog$en.internal(_root);
	late final Translations$cleanupCategories$en cleanupCategories = Translations$cleanupCategories$en.internal(_root);
	late final Translations$myClutterDashboard$en myClutterDashboard = Translations$myClutterDashboard$en.internal(_root);
	late final Translations$scanResults$en scanResults = Translations$scanResults$en.internal(_root);
	late final Translations$spaceViewStart$en spaceViewStart = Translations$spaceViewStart$en.internal(_root);
	late final Translations$shell$en shell = Translations$shell$en.internal(_root);
	late final Translations$myToolsService$en myToolsService = Translations$myToolsService$en.internal(_root);
}

// Path: app
class Translations$app$en {
	Translations$app$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'PristineCleaner'
	String get title => 'PristineCleaner';
}

// Path: language
class Translations$language$en {
	Translations$language$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Language'
	String get label => 'Language';

	/// en: 'English'
	String get english => 'English';

	/// en: 'Spanish'
	String get spanish => 'Spanish';

	/// en: 'Italian'
	String get italian => 'Italian';

	/// en: 'French'
	String get french => 'French';

	/// en: 'Hebrew'
	String get hebrew => 'Hebrew';

	/// en: 'Greek'
	String get greek => 'Greek';

	/// en: 'Portuguese'
	String get portuguese => 'Portuguese';

	/// en: 'Mandarin'
	String get mandarin => 'Mandarin';
}

// Path: navigation
class Translations$navigation$en {
	Translations$navigation$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'Cleanup'
	String get cleanup => 'Cleanup';

	/// en: 'Clutter'
	String get myClutter => 'Clutter';

	/// en: 'Space View'
	String get spaceView => 'Space View';

	/// en: 'Applications'
	String get applications => 'Applications';

	/// en: 'Tools'
	String get myTools => 'Tools';

	/// en: 'Donate'
	String get donate => 'Donate';

	/// en: 'Settings'
	String get settings => 'Settings';
}

// Path: settings
class Translations$settings$en {
	Translations$settings$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	/// en: 'Tune PristineCleaner to fit the way you like to work.'
	String get subtitle => 'Tune PristineCleaner to fit the way you like to work.';

	/// en: 'Language'
	String get sectionLanguage => 'Language';

	/// en: 'Updates'
	String get sectionUpdates => 'Updates';

	/// en: 'Behavior'
	String get sectionBehavior => 'Behavior';

	/// en: 'Check for updates on launch'
	String get autoCheckUpdates => 'Check for updates on launch';

	/// en: 'Automatically look for new versions when the app starts.'
	String get autoCheckUpdatesSub => 'Automatically look for new versions when the app starts.';

	/// en: 'Check for updates'
	String get checkForUpdates => 'Check for updates';

	/// en: 'Launch at login'
	String get launchAtLogin => 'Launch at login';

	/// en: 'Open PristineCleaner automatically when you sign in.'
	String get launchAtLoginSub => 'Open PristineCleaner automatically when you sign in.';

	/// en: 'Confirm before removing'
	String get confirmBeforeRemoving => 'Confirm before removing';

	/// en: 'Show a confirmation dialog before files are removed.'
	String get confirmBeforeRemovingSub => 'Show a confirmation dialog before files are removed.';
}

// Path: sections
class Translations$sections$en {
	Translations$sections$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$sections$home$en home = Translations$sections$home$en.internal(_root);
	late final Translations$sections$cleanup$en cleanup = Translations$sections$cleanup$en.internal(_root);
	late final Translations$sections$myClutter$en myClutter = Translations$sections$myClutter$en.internal(_root);
	late final Translations$sections$spaceView$en spaceView = Translations$sections$spaceView$en.internal(_root);
	late final Translations$sections$applications$en applications = Translations$sections$applications$en.internal(_root);
	late final Translations$sections$myTools$en myTools = Translations$sections$myTools$en.internal(_root);
}

// Path: progress
class Translations$progress$en {
	Translations$progress$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Counting files...'
	String get countingFiles => 'Counting files...';

	/// en: 'Counting applications...'
	String get countingApplications => 'Counting applications...';

	/// en: 'Counting folders...'
	String get countingFolders => 'Counting folders...';
}

// Path: errors
class Translations$errors$en {
	Translations$errors$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '{count} item(s) failed to remove.'
	String get itemsFailedToRemove => '{count} item(s) failed to remove.';
}

// Path: buttons
class Translations$buttons$en {
	Translations$buttons$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Scan'
	String get scan => 'Scan';

	/// en: 'Stop'
	String get stop => 'Stop';

	/// en: 'Done'
	String get done => 'Done';

	/// en: 'Clean'
	String get clean => 'Clean';

	/// en: 'Clean Up'
	String get cleanUp => 'Clean Up';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Refresh'
	String get refresh => 'Refresh';

	/// en: 'Rescan'
	String get rescan => 'Rescan';

	/// en: 'Start Over'
	String get startOver => 'Start Over';

	/// en: 'Select All'
	String get selectAll => 'Select All';

	/// en: 'Clear Selection'
	String get clearSelection => 'Clear Selection';

	/// en: 'Keep scanning'
	String get keepScanning => 'Keep scanning';

	/// en: 'Keep removing'
	String get keepRemoving => 'Keep removing';
}

// Path: tooltips
class Translations$tooltips$en {
	Translations$tooltips$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Open in Finder'
	String get openInFinder => 'Open in Finder';
}

// Path: dialogs
class Translations$dialogs$en {
	Translations$dialogs$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Stop scanning?'
	String get stopScanningTitle => 'Stop scanning?';

	/// en: 'This will cancel the current scan and discard any partial progress.'
	String get stopScanningMessage => 'This will cancel the current scan and discard any partial progress.';

	/// en: 'Confirm Exit'
	String get exitConfirmationTitle => 'Confirm Exit';

	/// en: 'A scan is currently running. Are you sure you want to quit?'
	String get exitConfirmationMessage => 'A scan is currently running. Are you sure you want to quit?';

	/// en: 'Wait'
	String get exitConfirmationWait => 'Wait';

	/// en: 'Quit Anyway'
	String get exitConfirmationQuit => 'Quit Anyway';

	/// en: 'Stop removal?'
	String get stopRemovalTitle => 'Stop removal?';

	/// en: 'The current file will finish, then remaining files will be skipped.'
	String get stopRemovalMessage => 'The current file will finish, then remaining files will be skipped.';

	/// en: 'Remove selected items?'
	String get confirmRemovalTitle => 'Remove selected items?';

	/// en: '{count} item(s) will be moved to Trash.'
	String get confirmRemovalMessage => '{count} item(s) will be moved to Trash.';

	/// en: '{count} item(s) will be permanently deleted. This cannot be undone.'
	String get confirmRemovalMessagePermanent => '{count} item(s) will be permanently deleted. This cannot be undone.';

	/// en: 'Cancel'
	String get confirmRemovalCancel => 'Cancel';

	/// en: 'Remove'
	String get confirmRemovalConfirm => 'Remove';
}

// Path: removal
class Translations$removal$en {
	Translations$removal$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Removal progress'
	String get barrierLabel => 'Removal progress';

	/// en: 'Preparing...'
	String get preparing => 'Preparing...';

	/// en: 'Removing from {title}'
	String get removingFrom => 'Removing from {title}';

	/// en: 'Stopping after the current file...'
	String get stoppingAfterCurrentFile => 'Stopping after the current file...';

	/// en: 'Please keep this window open while removal runs.'
	String get keepWindowOpen => 'Please keep this window open while removal runs.';

	/// en: '{processed} of {total} processed'
	String get processedSummary => '{processed} of {total} processed';

	/// en: '{deleted} deleted • {bytes} freed'
	String get deletedFreed => '{deleted} deleted • {bytes} freed';

	/// en: 'Current: {name}'
	String get currentItem => 'Current: {name}';

	/// en: 'Stopping...'
	String get stopping => 'Stopping...';

	/// en: 'Removal failed'
	String get removalFailed => 'Removal failed';

	/// en: 'Something went wrong while removing selected files.'
	String get removalFailedDetails => 'Something went wrong while removing selected files.';

	/// en: 'Removal stopped'
	String get removalStopped => 'Removal stopped';

	/// en: 'Removal complete'
	String get removalComplete => 'Removal complete';

	/// en: '{title} deleted {count} item(s)'
	String get deletedSummary => '{title} deleted {count} item(s)';

	/// en: '{bytes} freed'
	String get freedSummary => '{bytes} freed';

	/// en: '{count} item(s) failed to remove.'
	String get failedToRemoveSummary => '{count} item(s) failed to remove.';

	/// en: 'Deleted files'
	String get deletedFiles => 'Deleted files';

	/// en: 'No files were deleted.'
	String get noFilesDeleted => 'No files were deleted.';
}

// Path: done
class Translations$done$en {
	Translations$done$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'All cleaned!'
	String get allCleanedTitle => 'All cleaned!';

	/// en: 'Selected files have been moved to Trash.'
	String get movedToTrashMessage => 'Selected files have been moved to Trash.';

	/// en: 'Applications removed!'
	String get applicationsRemovedTitle => 'Applications removed!';

	/// en: 'Selected apps have been moved to Trash.'
	String get appsMovedToTrashMessage => 'Selected apps have been moved to Trash.';
}

// Path: donate
class Translations$donate$en {
	Translations$donate$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Support PristineCleaner'
	String get title => 'Support PristineCleaner';

	/// en: 'If PristineCleaner helps you keep your system clean, you can support development with a small donation.'
	String get subtitle => 'If PristineCleaner helps you keep your system clean, you can support development with a small donation.';

	/// en: 'Buy Me a Coffee'
	String get buyMeACoffee => 'Buy Me a Coffee';

	/// en: 'Donate with PayPal'
	String get paypalDonate => 'Donate with PayPal';

	/// en: 'Unable to open the donation link.'
	String get openLinkFailed => 'Unable to open the donation link.';
}

// Path: cleanupManager
class Translations$cleanupManager$en {
	Translations$cleanupManager$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cleanup Manager'
	String get title => 'Cleanup Manager';

	/// en: 'System Junk'
	String get systemJunkHeader => 'System Junk';

	/// en: 'Redundant files that clog up device storage and impede optimal performance.'
	String get systemJunkDescription => 'Redundant files that clog up device storage and impede optimal performance.';

	/// en: 'Select'
	String get selectLabel => 'Select';

	/// en: 'All'
	String get selectAllOption => 'All';

	/// en: 'None'
	String get selectNoneOption => 'None';

	/// en: 'No items'
	String get noItems => 'No items';

	/// en: 'No items found'
	String get noItemsFound => 'No items found';

	/// en: '{count} items selected'
	String get itemsSelected => '{count} items selected';
}

// Path: projectDirectory
class Translations$projectDirectory$en {
	Translations$projectDirectory$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Choose Folder...'
	String get chooseFolder => 'Choose Folder...';

	/// en: 'Choose project directory'
	String get chooseProjectDirectory => 'Choose project directory';

	/// en: 'Choose parent folder'
	String get chooseParentFolder => 'Choose parent folder';

	/// en: 'No folder'
	String get noFolder => 'No folder';
}

// Path: searchAndSort
class Translations$searchAndSort$en {
	Translations$searchAndSort$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Search...'
	String get searchHint => 'Search...';

	/// en: 'Sort by'
	String get sortBy => 'Sort by';

	/// en: 'Size'
	String get size => 'Size';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Ascending'
	String get ascending => 'Ascending';

	/// en: 'Descending'
	String get descending => 'Descending';
}

// Path: spaceView
class Translations$spaceView$en {
	Translations$spaceView$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No folders found for this level'
	String get noFoldersFound => 'No folders found for this level';

	/// en: 'No bubbles to render'
	String get noBubblesToRender => 'No bubbles to render';

	/// en: 'Other items'
	String get otherItems => 'Other items';
}

// Path: home
class Translations$home$en {
	Translations$home$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Refresh'
	String get refresh => 'Refresh';

	/// en: 'Unable to read disk info'
	String get unableToReadDiskInfo => 'Unable to read disk info';

	/// en: 'Total Storage'
	String get totalStorage => 'Total Storage';

	/// en: 'Used'
	String get used => 'Used';

	/// en: 'Available'
	String get available => 'Available';

	/// en: '{percent}% used'
	String get percentUsed => '{percent}% used';

	/// en: 'CPU Usage'
	String get cpuUsage => 'CPU Usage';

	/// en: 'RAM Usage'
	String get ramUsage => 'RAM Usage';

	/// en: '{percent}% RAM used'
	String get memoryPercentUsed => '{percent}% RAM used';

	/// en: 'Unable to read system info'
	String get unableToReadSystemInfo => 'Unable to read system info';
}

// Path: myToolsPage
class Translations$myToolsPage$en {
	Translations$myToolsPage$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tools'
	String get title => 'Tools';

	/// en: 'Your go-to tools for keeping your Mac clean, safe and running smoothly.'
	String get subtitle => 'Your go-to tools for keeping your Mac clean, safe and running smoothly.';

	/// en: 'Back to tools'
	String get backToTools => 'Back to tools';
}

// Path: myToolsMessages
class Translations$myToolsMessages$en {
	Translations$myToolsMessages$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '{count} item(s) • {size}'
	String get itemsWithSize => '{count} item(s) • {size}';

	/// en: 'scan was cancelled.'
	String get scanCancelled => 'scan was cancelled.';

	/// en: 'Select at least one item to clean.'
	String get selectAtLeastOne => 'Select at least one item to clean.';

	/// en: 'Failed to clean {count} item(s).'
	String get failedToClean => 'Failed to clean {count} item(s).';

	/// en: 'Everything selected was cleaned.'
	String get everythingSelectedCleaned => 'Everything selected was cleaned.';

	/// en: 'Cleanup updated.'
	String get cleanupUpdated => 'Cleanup updated.';

	/// en: 'Cleaned {count} item(s).'
	String get cleanedCount => 'Cleaned {count} item(s).';

	/// en: 'Stopped. '
	String get stoppedPrefix => 'Stopped. ';

	/// en: 'Removed {count} item(s).'
	String get removedCount => 'Removed {count} item(s).';

	/// en: ' {count} failed.'
	String get failedCountShort => ' {count} failed.';

	/// en: 'Scan complete.'
	String get scanComplete => 'Scan complete.';

	/// en: 'Something went wrong.'
	String get somethingWentWrong => 'Something went wrong.';

	late final Translations$myToolsMessages$fallback$en fallback = Translations$myToolsMessages$fallback$en.internal(_root);
}

// Path: myToolsCatalog
class Translations$myToolsCatalog$en {
	Translations$myToolsCatalog$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$myToolsCatalog$appLeftovers$en appLeftovers = Translations$myToolsCatalog$appLeftovers$en.internal(_root);
	late final Translations$myToolsCatalog$backgroundItems$en backgroundItems = Translations$myToolsCatalog$backgroundItems$en.internal(_root);
	late final Translations$myToolsCatalog$downloads$en downloads = Translations$myToolsCatalog$downloads$en.internal(_root);
	late final Translations$myToolsCatalog$largeOld$en largeOld = Translations$myToolsCatalog$largeOld$en.internal(_root);
	late final Translations$myToolsCatalog$similarImages$en similarImages = Translations$myToolsCatalog$similarImages$en.internal(_root);
	late final Translations$myToolsCatalog$trashBins$en trashBins = Translations$myToolsCatalog$trashBins$en.internal(_root);
	late final Translations$myToolsCatalog$duplicateFinder$en duplicateFinder = Translations$myToolsCatalog$duplicateFinder$en.internal(_root);
	late final Translations$myToolsCatalog$applicationPermissions$en applicationPermissions = Translations$myToolsCatalog$applicationPermissions$en.internal(_root);
	late final Translations$myToolsCatalog$systemJunk$en systemJunk = Translations$myToolsCatalog$systemJunk$en.internal(_root);
	late final Translations$myToolsCatalog$timeMachineSnapshot$en timeMachineSnapshot = Translations$myToolsCatalog$timeMachineSnapshot$en.internal(_root);
	late final Translations$myToolsCatalog$loginItems$en loginItems = Translations$myToolsCatalog$loginItems$en.internal(_root);
	late final Translations$myToolsCatalog$mailAttachments$en mailAttachments = Translations$myToolsCatalog$mailAttachments$en.internal(_root);
	late final Translations$myToolsCatalog$malwareFinder$en malwareFinder = Translations$myToolsCatalog$malwareFinder$en.internal(_root);
	late final Translations$myToolsCatalog$uninstaller$en uninstaller = Translations$myToolsCatalog$uninstaller$en.internal(_root);
}

// Path: cleanupCategories
class Translations$cleanupCategories$en {
	Translations$cleanupCategories$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$cleanupCategories$userCache$en userCache = Translations$cleanupCategories$userCache$en.internal(_root);
	late final Translations$cleanupCategories$userLogs$en userLogs = Translations$cleanupCategories$userLogs$en.internal(_root);
	late final Translations$cleanupCategories$languageFiles$en languageFiles = Translations$cleanupCategories$languageFiles$en.internal(_root);
	late final Translations$cleanupCategories$systemLogs$en systemLogs = Translations$cleanupCategories$systemLogs$en.internal(_root);
	late final Translations$cleanupCategories$brokenLoginItems$en brokenLoginItems = Translations$cleanupCategories$brokenLoginItems$en.internal(_root);
}

// Path: myClutterDashboard
class Translations$myClutterDashboard$en {
	Translations$myClutterDashboard$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Back to Categories'
	String get backToCategories => 'Back to Categories';

	/// en: 'You have {count} files to sort through.'
	String get filesToSort => 'You have {count} files to sort through.';

	/// en: 'Use quick recommendations or review them by hand.'
	String get quickRecommendations => 'Use quick recommendations or review them by hand.';

	/// en: 'Review All Files'
	String get reviewAllFiles => 'Review All Files';

	/// en: '{count} Fresh Duplicates Found'
	String get freshDuplicatesFound => '{count} Fresh Duplicates Found';

	/// en: 'No duplicates found in this scan.'
	String get noDuplicates => 'No duplicates found in this scan.';

	/// en: 'Remove {bytes} of duplicate files.'
	String get removeDuplicateBytes => 'Remove {bytes} of duplicate files.';

	/// en: '{count} Large Similar Images Found'
	String get largeSimilarImagesFound => '{count} Large Similar Images Found';

	/// en: 'No similar image groups found.'
	String get noSimilarGroups => 'No similar image groups found.';

	/// en: 'There are {bytes} of nearly identical images.'
	String get nearlyIdenticalImages => 'There are {bytes} of nearly identical images.';

	/// en: '{bytes} of Large Files Found'
	String get largeFilesFound => '{bytes} of Large Files Found';

	/// en: 'No large files found.'
	String get noLargeFiles => 'No large files found.';

	/// en: '{count} large files are ready for review.'
	String get largeFilesReady => '{count} large files are ready for review.';

	/// en: 'Review'
	String get review => 'Review';
}

// Path: scanResults
class Translations$scanResults$en {
	Translations$scanResults$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '{count} items • {size}'
	String get itemsSummary => '{count} items  •  {size}';

	/// en: 'Scanned in {ms}ms'
	String get scannedInMs => 'Scanned in {ms}ms';

	/// en: 'Deselect All'
	String get deselectAll => 'Deselect All';

	/// en: 'Select All'
	String get selectAll => 'Select All';

	/// en: 'No items match your search'
	String get noItemsMatchSearch => 'No items match your search';

	/// en: 'No items found'
	String get noItemsFound => 'No items found';

	/// en: '{count} items selected'
	String get itemsSelected => '{count} items selected';

	/// en: 'Rescan'
	String get rescan => 'Rescan';
}

// Path: spaceViewStart
class Translations$spaceViewStart$en {
	Translations$spaceViewStart$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Pick a parent folder, then scan to map what is taking up the most space.'
	String get subtitle => 'Pick a parent folder, then scan to map what is taking up the most space.';

	/// en: 'Default root path is your main hard drive'
	String get defaultRootPath => 'Default root path is your main hard drive';

	/// en: 'Explore folder sizes through interactive bubbles'
	String get exploreBubbles => 'Explore folder sizes through interactive bubbles';

	/// en: 'Click folders to drill down and inspect deeper'
	String get clickToDrillDown => 'Click folders to drill down and inspect deeper';
}

// Path: shell
class Translations$shell$en {
	Translations$shell$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Coming soon'
	String get comingSoon => 'Coming soon';
}

// Path: myToolsService
class Translations$myToolsService$en {
	Translations$myToolsService$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Snapshot {id}'
	String get snapshotName => 'Snapshot {id}';

	/// en: 'Time Machine'
	String get timeMachineGroup => 'Time Machine';

	/// en: 'Time Machine snapshots are only available on macOS.'
	String get timeMachineMacOnly => 'Time Machine snapshots are only available on macOS.';
}

// Path: sections.home
class Translations$sections$home$en {
	Translations$sections$home$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Home'
	String get title => 'Home';

	/// en: 'See your computer's vital signs at a glance\nand catch issues before they grow.'
	String get subtitle => 'See your computer\'s vital signs at a glance\nand catch issues before they grow.';

	late final Translations$sections$home$features$en features = Translations$sections$home$features$en.internal(_root);
}

// Path: sections.cleanup
class Translations$sections$cleanup$en {
	Translations$sections$cleanup$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Junk Cleanup'
	String get title => 'Junk Cleanup';

	/// en: 'Sweep away digital residue to restore\nspeed, stability, and valuable free space.'
	String get subtitle => 'Sweep away digital residue to restore\nspeed, stability, and valuable free space.';

	late final Translations$sections$cleanup$features$en features = Translations$sections$cleanup$features$en.internal(_root);
}

// Path: sections.myClutter
class Translations$sections$myClutter$en {
	Translations$sections$myClutter$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Clutter'
	String get title => 'Clutter';

	/// en: 'Turn chaotic folders into clear decisions\nwith guided cleanup in minutes.'
	String get subtitle => 'Turn chaotic folders into clear decisions\nwith guided cleanup in minutes.';

	late final Translations$sections$myClutter$features$en features = Translations$sections$myClutter$features$en.internal(_root);
}

// Path: sections.spaceView
class Translations$sections$spaceView$en {
	Translations$sections$spaceView$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Space View'
	String get title => 'Space View';

	/// en: 'Map your disk visually to pinpoint\nwhat matters most and free space faster.'
	String get subtitle => 'Map your disk visually to pinpoint\nwhat matters most and free space faster.';

	late final Translations$sections$spaceView$features$en features = Translations$sections$spaceView$features$en.internal(_root);
}

// Path: sections.applications
class Translations$sections$applications$en {
	Translations$sections$applications$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Applications'
	String get title => 'Applications';

	/// en: 'Master your app footprint.\nUninstall cleanly and remove forgotten leftovers.'
	String get subtitle => 'Master your app footprint.\nUninstall cleanly and remove forgotten leftovers.';

	late final Translations$sections$applications$features$en features = Translations$sections$applications$features$en.internal(_root);
}

// Path: sections.myTools
class Translations$sections$myTools$en {
	Translations$sections$myTools$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tools'
	String get title => 'Tools';

	/// en: 'Your go-to toolkit for system care and maintenance.'
	String get subtitle => 'Your go-to toolkit for system care and maintenance.';

	late final Translations$sections$myTools$features$en features = Translations$sections$myTools$features$en.internal(_root);
}

// Path: myToolsMessages.fallback
class Translations$myToolsMessages$fallback$en {
	Translations$myToolsMessages$fallback$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Downloads are tidy.'
	String get downloadsTidy => 'Downloads are tidy.';

	/// en: 'No oversized stale files were found.'
	String get noOversizedStale => 'No oversized stale files were found.';

	/// en: 'No recent duplicates found.'
	String get noRecentDuplicates => 'No recent duplicates found.';

	/// en: 'No similar large images found.'
	String get noSimilarLargeImages => 'No similar large images found.';

	/// en: 'No removable app leftovers found.'
	String get noAppLeftovers => 'No removable app leftovers found.';

	/// en: 'No stale applications were found.'
	String get noStaleApps => 'No stale applications were found.';

	/// en: 'Applications that may need review were found.'
	String get appsNeedReview => 'Applications that may need review were found.';

	/// en: 'No cleanup candidates in system junk.'
	String get noSystemJunkCandidates => 'No cleanup candidates in system junk.';

	/// en: 'No broken startup/background entries found.'
	String get noBrokenStartup => 'No broken startup/background entries found.';

	/// en: 'No background items were found.'
	String get noBackgroundItems => 'No background items were found.';

	/// en: 'No privacy traces found in known locations.'
	String get noPrivacyTraces => 'No privacy traces found in known locations.';

	/// en: 'Trash is already empty.'
	String get trashAlreadyEmpty => 'Trash is already empty.';

	/// en: 'No permission cache files were found.'
	String get noPermissionCache => 'No permission cache files were found.';

	/// en: 'No local Time Machine snapshots were found.'
	String get noTimeMachineSnapshots => 'No local Time Machine snapshots were found.';

	/// en: 'No maintenance candidates were found.'
	String get noMaintenanceCandidates => 'No maintenance candidates were found.';

	/// en: 'No removable mail attachments were found.'
	String get noMailAttachments => 'No removable mail attachments were found.';

	/// en: 'No suspicious files were detected.'
	String get noSuspiciousFiles => 'No suspicious files were detected.';
}

// Path: myToolsCatalog.appLeftovers
class Translations$myToolsCatalog$appLeftovers$en {
	Translations$myToolsCatalog$appLeftovers$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'App Leftovers'
	String get title => 'App Leftovers';

	/// en: 'Locate and remove app leftovers even if the main app is already gone.'
	String get description => 'Locate and remove app leftovers even if the main app is already gone.';
}

// Path: myToolsCatalog.backgroundItems
class Translations$myToolsCatalog$backgroundItems$en {
	Translations$myToolsCatalog$backgroundItems$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Background Items'
	String get title => 'Background Items';

	/// en: 'Manage background apps and processes running on your Mac.'
	String get description => 'Manage background apps and processes running on your Mac.';
}

// Path: myToolsCatalog.downloads
class Translations$myToolsCatalog$downloads$en {
	Translations$myToolsCatalog$downloads$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Downloads'
	String get title => 'Downloads';

	/// en: 'Review and clean one-time use files from Downloads to keep folders tidy.'
	String get description => 'Review and clean one-time use files from Downloads to keep folders tidy.';
}

// Path: myToolsCatalog.largeOld
class Translations$myToolsCatalog$largeOld$en {
	Translations$myToolsCatalog$largeOld$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Large and Old Files'
	String get title => 'Large and Old Files';

	/// en: 'Find and remove large, unused files that take up space on your Mac.'
	String get description => 'Find and remove large, unused files that take up space on your Mac.';
}

// Path: myToolsCatalog.similarImages
class Translations$myToolsCatalog$similarImages$en {
	Translations$myToolsCatalog$similarImages$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Similar Images'
	String get title => 'Similar Images';

	/// en: 'Review similar photos and keep only the best ones.'
	String get description => 'Review similar photos and keep only the best ones.';
}

// Path: myToolsCatalog.trashBins
class Translations$myToolsCatalog$trashBins$en {
	Translations$myToolsCatalog$trashBins$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Trash Bins'
	String get title => 'Trash Bins';

	/// en: 'Empty all of the available Trash Bins on your Mac.'
	String get description => 'Empty all of the available Trash Bins on your Mac.';
}

// Path: myToolsCatalog.duplicateFinder
class Translations$myToolsCatalog$duplicateFinder$en {
	Translations$myToolsCatalog$duplicateFinder$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Duplicate Finder'
	String get title => 'Duplicate Finder';

	/// en: 'Remove duplicate files stored in different locations on your Mac.'
	String get description => 'Remove duplicate files stored in different locations on your Mac.';
}

// Path: myToolsCatalog.applicationPermissions
class Translations$myToolsCatalog$applicationPermissions$en {
	Translations$myToolsCatalog$applicationPermissions$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Application Permissions'
	String get title => 'Application Permissions';

	/// en: 'Manage how apps access system features, devices, and functionality.'
	String get description => 'Manage how apps access system features, devices, and functionality.';
}

// Path: myToolsCatalog.systemJunk
class Translations$myToolsCatalog$systemJunk$en {
	Translations$myToolsCatalog$systemJunk$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'System Junk'
	String get title => 'System Junk';

	/// en: 'Remove redundant files that clog up device storage and impede optimal performance.'
	String get description => 'Remove redundant files that clog up device storage and impede optimal performance.';
}

// Path: myToolsCatalog.timeMachineSnapshot
class Translations$myToolsCatalog$timeMachineSnapshot$en {
	Translations$myToolsCatalog$timeMachineSnapshot$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Time Machine Snapshot'
	String get title => 'Time Machine Snapshot';

	/// en: 'Remove local Time Machine snapshots without affecting your backups.'
	String get description => 'Remove local Time Machine snapshots without affecting your backups.';
}

// Path: myToolsCatalog.loginItems
class Translations$myToolsCatalog$loginItems$en {
	Translations$myToolsCatalog$loginItems$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Login Items'
	String get title => 'Login Items';

	/// en: 'Manage apps that open automatically when you start your Mac.'
	String get description => 'Manage apps that open automatically when you start your Mac.';
}

// Path: myToolsCatalog.mailAttachments
class Translations$myToolsCatalog$mailAttachments$en {
	Translations$myToolsCatalog$mailAttachments$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Mail Attachments'
	String get title => 'Mail Attachments';

	/// en: 'Remove locally stored email attachments to free space while keeping modified files.'
	String get description => 'Remove locally stored email attachments to free space while keeping modified files.';
}

// Path: myToolsCatalog.malwareFinder
class Translations$myToolsCatalog$malwareFinder$en {
	Translations$myToolsCatalog$malwareFinder$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Malware Finder'
	String get title => 'Malware Finder';

	/// en: 'Identify and remove malicious items to keep your Mac secure.'
	String get description => 'Identify and remove malicious items to keep your Mac secure.';
}

// Path: myToolsCatalog.uninstaller
class Translations$myToolsCatalog$uninstaller$en {
	Translations$myToolsCatalog$uninstaller$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Uninstaller'
	String get title => 'Uninstaller';

	/// en: 'Correctly remove entire applications with all of the related files.'
	String get description => 'Correctly remove entire applications with all of the related files.';
}

// Path: cleanupCategories.userCache
class Translations$cleanupCategories$userCache$en {
	Translations$cleanupCategories$userCache$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'User Cache Files'
	String get name => 'User Cache Files';

	/// en: 'Originally intended to improve startup times, the cache files of your applications ultimately accumulate and result in improper functioning or an overall performance drop.'
	String get description => 'Originally intended to improve startup times, the cache files of your applications ultimately accumulate and result in improper functioning or an overall performance drop.';
}

// Path: cleanupCategories.userLogs
class Translations$cleanupCategories$userLogs$en {
	Translations$cleanupCategories$userLogs$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'User Log Files'
	String get name => 'User Log Files';

	/// en: 'Log files are created by macOS and its applications to record events and errors. Over time they can grow large and take up significant space.'
	String get description => 'Log files are created by macOS and its applications to record events and errors. Over time they can grow large and take up significant space.';
}

// Path: cleanupCategories.languageFiles
class Translations$cleanupCategories$languageFiles$en {
	Translations$cleanupCategories$languageFiles$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Language Files'
	String get name => 'Language Files';

	/// en: 'Unused localization resources bundled with apps. Removing languages you do not use frees up storage without affecting functionality.'
	String get description => 'Unused localization resources bundled with apps. Removing languages you do not use frees up storage without affecting functionality.';
}

// Path: cleanupCategories.systemLogs
class Translations$cleanupCategories$systemLogs$en {
	Translations$cleanupCategories$systemLogs$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'System Log Files'
	String get name => 'System Log Files';

	/// en: 'System-wide log files written by macOS services and daemons. These files are safe to remove as the system re-creates them when needed.'
	String get description => 'System-wide log files written by macOS services and daemons. These files are safe to remove as the system re-creates them when needed.';
}

// Path: cleanupCategories.brokenLoginItems
class Translations$cleanupCategories$brokenLoginItems$en {
	Translations$cleanupCategories$brokenLoginItems$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Broken Login Items'
	String get name => 'Broken Login Items';

	/// en: 'Login items that point to applications or files that no longer exist on your disk. Removing them speeds up login time.'
	String get description => 'Login items that point to applications or files that no longer exist on your disk. Removing them speeds up login time.';
}

// Path: sections.home.features
class Translations$sections$home$features$en {
	Translations$sections$home$features$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Live System Pulse'
	String get systemStatus => 'Live System Pulse';

	/// en: 'Storage Pressure'
	String get storageUsage => 'Storage Pressure';

	/// en: 'One-Tap Fixes'
	String get quickActions => 'One-Tap Fixes';
}

// Path: sections.cleanup.features
class Translations$sections$cleanup$features$en {
	Translations$sections$cleanup$features$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Residual System Junk'
	String get systemJunk => 'Residual System Junk';

	/// en: 'Bloated User Cache'
	String get userCache => 'Bloated User Cache';

	/// en: 'Stale Temp Files'
	String get tempFiles => 'Stale Temp Files';
}

// Path: sections.myClutter.features
class Translations$sections$myClutter$features$en {
	Translations$sections$myClutter$features$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Space-Hungry Files'
	String get largeFiles => 'Space-Hungry Files';

	/// en: 'Duplicate Clusters'
	String get duplicates => 'Duplicate Clusters';

	/// en: 'Near-Match Photo Sets'
	String get largeSimilarImages => 'Near-Match Photo Sets';
}

// Path: sections.spaceView.features
class Translations$sections$spaceView$features$en {
	Translations$sections$spaceView$features$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Interactive Storage Map'
	String get visualStorageMap => 'Interactive Storage Map';

	/// en: 'Heavy Folder Hotspots'
	String get largeFoldersOverview => 'Heavy Folder Hotspots';

	/// en: 'Hidden Space Drainers'
	String get hiddenFilesUncovered => 'Hidden Space Drainers';
}

// Path: sections.applications.features
class Translations$sections$applications$features$en {
	Translations$sections$applications$features$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Deep App Uninstaller'
	String get appUninstaller => 'Deep App Uninstaller';

	/// en: 'Heavyweight Apps'
	String get largeApps => 'Heavyweight Apps';

	/// en: 'Orphaned Support Files'
	String get fileLeftovers => 'Orphaned Support Files';
}

// Path: sections.myTools.features
class Translations$sections$myTools$features$en {
	Translations$sections$myTools$features$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Targeted Scanners'
	String get targetedScanners => 'Targeted Scanners';

	/// en: 'Quick Actions'
	String get quickActions => 'Quick Actions';

	/// en: 'Live Filtering'
	String get liveFiltering => 'Live Filtering';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'PristineCleaner',
			'language.label' => 'Language',
			'language.english' => 'English',
			'language.spanish' => 'Spanish',
			'language.italian' => 'Italian',
			'language.french' => 'French',
			'language.hebrew' => 'Hebrew',
			'language.greek' => 'Greek',
			'language.portuguese' => 'Portuguese',
			'language.mandarin' => 'Mandarin',
			'navigation.home' => 'Home',
			'navigation.cleanup' => 'Cleanup',
			'navigation.myClutter' => 'Clutter',
			'navigation.spaceView' => 'Space View',
			'navigation.applications' => 'Applications',
			'navigation.myTools' => 'Tools',
			'navigation.donate' => 'Donate',
			'navigation.settings' => 'Settings',
			'settings.title' => 'Settings',
			'settings.subtitle' => 'Tune PristineCleaner to fit the way you like to work.',
			'settings.sectionLanguage' => 'Language',
			'settings.sectionUpdates' => 'Updates',
			'settings.sectionBehavior' => 'Behavior',
			'settings.autoCheckUpdates' => 'Check for updates on launch',
			'settings.autoCheckUpdatesSub' => 'Automatically look for new versions when the app starts.',
			'settings.checkForUpdates' => 'Check for updates',
			'settings.launchAtLogin' => 'Launch at login',
			'settings.launchAtLoginSub' => 'Open PristineCleaner automatically when you sign in.',
			'settings.confirmBeforeRemoving' => 'Confirm before removing',
			'settings.confirmBeforeRemovingSub' => 'Show a confirmation dialog before files are removed.',
			'sections.home.title' => 'Home',
			'sections.home.subtitle' => 'See your computer\'s vital signs at a glance\nand catch issues before they grow.',
			'sections.home.features.systemStatus' => 'Live System Pulse',
			'sections.home.features.storageUsage' => 'Storage Pressure',
			'sections.home.features.quickActions' => 'One-Tap Fixes',
			'sections.cleanup.title' => 'Junk Cleanup',
			'sections.cleanup.subtitle' => 'Sweep away digital residue to restore\nspeed, stability, and valuable free space.',
			'sections.cleanup.features.systemJunk' => 'Residual System Junk',
			'sections.cleanup.features.userCache' => 'Bloated User Cache',
			'sections.cleanup.features.tempFiles' => 'Stale Temp Files',
			'sections.myClutter.title' => 'Clutter',
			'sections.myClutter.subtitle' => 'Turn chaotic folders into clear decisions\nwith guided cleanup in minutes.',
			'sections.myClutter.features.largeFiles' => 'Space-Hungry Files',
			'sections.myClutter.features.duplicates' => 'Duplicate Clusters',
			'sections.myClutter.features.largeSimilarImages' => 'Near-Match Photo Sets',
			'sections.spaceView.title' => 'Space View',
			'sections.spaceView.subtitle' => 'Map your disk visually to pinpoint\nwhat matters most and free space faster.',
			'sections.spaceView.features.visualStorageMap' => 'Interactive Storage Map',
			'sections.spaceView.features.largeFoldersOverview' => 'Heavy Folder Hotspots',
			'sections.spaceView.features.hiddenFilesUncovered' => 'Hidden Space Drainers',
			'sections.applications.title' => 'Applications',
			'sections.applications.subtitle' => 'Master your app footprint.\nUninstall cleanly and remove forgotten leftovers.',
			'sections.applications.features.appUninstaller' => 'Deep App Uninstaller',
			'sections.applications.features.largeApps' => 'Heavyweight Apps',
			'sections.applications.features.fileLeftovers' => 'Orphaned Support Files',
			'sections.myTools.title' => 'Tools',
			'sections.myTools.subtitle' => 'Your go-to toolkit for system care and maintenance.',
			'sections.myTools.features.targetedScanners' => 'Targeted Scanners',
			'sections.myTools.features.quickActions' => 'Quick Actions',
			'sections.myTools.features.liveFiltering' => 'Live Filtering',
			'progress.countingFiles' => 'Counting files...',
			'progress.countingApplications' => 'Counting applications...',
			'progress.countingFolders' => 'Counting folders...',
			'errors.itemsFailedToRemove' => '{count} item(s) failed to remove.',
			'buttons.scan' => 'Scan',
			'buttons.stop' => 'Stop',
			'buttons.done' => 'Done',
			'buttons.clean' => 'Clean',
			'buttons.cleanUp' => 'Clean Up',
			'buttons.close' => 'Close',
			'buttons.refresh' => 'Refresh',
			'buttons.rescan' => 'Rescan',
			'buttons.startOver' => 'Start Over',
			'buttons.selectAll' => 'Select All',
			'buttons.clearSelection' => 'Clear Selection',
			'buttons.keepScanning' => 'Keep scanning',
			'buttons.keepRemoving' => 'Keep removing',
			'tooltips.search' => 'Search',
			'tooltips.openInFinder' => 'Open in Finder',
			'dialogs.stopScanningTitle' => 'Stop scanning?',
			'dialogs.stopScanningMessage' => 'This will cancel the current scan and discard any partial progress.',
			'dialogs.exitConfirmationTitle' => 'Confirm Exit',
			'dialogs.exitConfirmationMessage' => 'A scan is currently running. Are you sure you want to quit?',
			'dialogs.exitConfirmationWait' => 'Wait',
			'dialogs.exitConfirmationQuit' => 'Quit Anyway',
			'dialogs.stopRemovalTitle' => 'Stop removal?',
			'dialogs.stopRemovalMessage' => 'The current file will finish, then remaining files will be skipped.',
			'dialogs.confirmRemovalTitle' => 'Remove selected items?',
			'dialogs.confirmRemovalMessage' => '{count} item(s) will be moved to Trash.',
			'dialogs.confirmRemovalMessagePermanent' => '{count} item(s) will be permanently deleted. This cannot be undone.',
			'dialogs.confirmRemovalCancel' => 'Cancel',
			'dialogs.confirmRemovalConfirm' => 'Remove',
			'removal.barrierLabel' => 'Removal progress',
			'removal.preparing' => 'Preparing...',
			'removal.removingFrom' => 'Removing from {title}',
			'removal.stoppingAfterCurrentFile' => 'Stopping after the current file...',
			'removal.keepWindowOpen' => 'Please keep this window open while removal runs.',
			'removal.processedSummary' => '{processed} of {total} processed',
			'removal.deletedFreed' => '{deleted} deleted • {bytes} freed',
			'removal.currentItem' => 'Current: {name}',
			'removal.stopping' => 'Stopping...',
			'removal.removalFailed' => 'Removal failed',
			'removal.removalFailedDetails' => 'Something went wrong while removing selected files.',
			'removal.removalStopped' => 'Removal stopped',
			'removal.removalComplete' => 'Removal complete',
			'removal.deletedSummary' => '{title} deleted {count} item(s)',
			'removal.freedSummary' => '{bytes} freed',
			'removal.failedToRemoveSummary' => '{count} item(s) failed to remove.',
			'removal.deletedFiles' => 'Deleted files',
			'removal.noFilesDeleted' => 'No files were deleted.',
			'done.allCleanedTitle' => 'All cleaned!',
			'done.movedToTrashMessage' => 'Selected files have been moved to Trash.',
			'done.applicationsRemovedTitle' => 'Applications removed!',
			'done.appsMovedToTrashMessage' => 'Selected apps have been moved to Trash.',
			'donate.title' => 'Support PristineCleaner',
			'donate.subtitle' => 'If PristineCleaner helps you keep your system clean, you can support development with a small donation.',
			'donate.buyMeACoffee' => 'Buy Me a Coffee',
			'donate.paypalDonate' => 'Donate with PayPal',
			'donate.openLinkFailed' => 'Unable to open the donation link.',
			'cleanupManager.title' => 'Cleanup Manager',
			'cleanupManager.systemJunkHeader' => 'System Junk',
			'cleanupManager.systemJunkDescription' => 'Redundant files that clog up device storage and impede optimal performance.',
			'cleanupManager.selectLabel' => 'Select',
			'cleanupManager.selectAllOption' => 'All',
			'cleanupManager.selectNoneOption' => 'None',
			'cleanupManager.noItems' => 'No items',
			'cleanupManager.noItemsFound' => 'No items found',
			'cleanupManager.itemsSelected' => '{count} items selected',
			'projectDirectory.chooseFolder' => 'Choose Folder...',
			'projectDirectory.chooseProjectDirectory' => 'Choose project directory',
			'projectDirectory.chooseParentFolder' => 'Choose parent folder',
			'projectDirectory.noFolder' => 'No folder',
			'searchAndSort.searchHint' => 'Search...',
			'searchAndSort.sortBy' => 'Sort by',
			'searchAndSort.size' => 'Size',
			'searchAndSort.name' => 'Name',
			'searchAndSort.ascending' => 'Ascending',
			'searchAndSort.descending' => 'Descending',
			'spaceView.noFoldersFound' => 'No folders found for this level',
			'spaceView.noBubblesToRender' => 'No bubbles to render',
			'spaceView.otherItems' => 'Other items',
			'home.refresh' => 'Refresh',
			'home.unableToReadDiskInfo' => 'Unable to read disk info',
			'home.totalStorage' => 'Total Storage',
			'home.used' => 'Used',
			'home.available' => 'Available',
			'home.percentUsed' => '{percent}% used',
			'home.cpuUsage' => 'CPU Usage',
			'home.ramUsage' => 'RAM Usage',
			'home.memoryPercentUsed' => '{percent}% RAM used',
			'home.unableToReadSystemInfo' => 'Unable to read system info',
			'myToolsPage.title' => 'Tools',
			'myToolsPage.subtitle' => 'Your go-to tools for keeping your Mac clean, safe and running smoothly.',
			'myToolsPage.backToTools' => 'Back to tools',
			'myToolsMessages.itemsWithSize' => '{count} item(s) • {size}',
			'myToolsMessages.scanCancelled' => 'scan was cancelled.',
			'myToolsMessages.selectAtLeastOne' => 'Select at least one item to clean.',
			'myToolsMessages.failedToClean' => 'Failed to clean {count} item(s).',
			'myToolsMessages.everythingSelectedCleaned' => 'Everything selected was cleaned.',
			'myToolsMessages.cleanupUpdated' => 'Cleanup updated.',
			'myToolsMessages.cleanedCount' => 'Cleaned {count} item(s).',
			'myToolsMessages.stoppedPrefix' => 'Stopped. ',
			'myToolsMessages.removedCount' => 'Removed {count} item(s).',
			'myToolsMessages.failedCountShort' => ' {count} failed.',
			'myToolsMessages.scanComplete' => 'Scan complete.',
			'myToolsMessages.somethingWentWrong' => 'Something went wrong.',
			'myToolsMessages.fallback.downloadsTidy' => 'Downloads are tidy.',
			'myToolsMessages.fallback.noOversizedStale' => 'No oversized stale files were found.',
			'myToolsMessages.fallback.noRecentDuplicates' => 'No recent duplicates found.',
			'myToolsMessages.fallback.noSimilarLargeImages' => 'No similar large images found.',
			'myToolsMessages.fallback.noAppLeftovers' => 'No removable app leftovers found.',
			'myToolsMessages.fallback.noStaleApps' => 'No stale applications were found.',
			'myToolsMessages.fallback.appsNeedReview' => 'Applications that may need review were found.',
			'myToolsMessages.fallback.noSystemJunkCandidates' => 'No cleanup candidates in system junk.',
			'myToolsMessages.fallback.noBrokenStartup' => 'No broken startup/background entries found.',
			'myToolsMessages.fallback.noBackgroundItems' => 'No background items were found.',
			'myToolsMessages.fallback.noPrivacyTraces' => 'No privacy traces found in known locations.',
			'myToolsMessages.fallback.trashAlreadyEmpty' => 'Trash is already empty.',
			'myToolsMessages.fallback.noPermissionCache' => 'No permission cache files were found.',
			'myToolsMessages.fallback.noTimeMachineSnapshots' => 'No local Time Machine snapshots were found.',
			'myToolsMessages.fallback.noMaintenanceCandidates' => 'No maintenance candidates were found.',
			'myToolsMessages.fallback.noMailAttachments' => 'No removable mail attachments were found.',
			'myToolsMessages.fallback.noSuspiciousFiles' => 'No suspicious files were detected.',
			'myToolsCatalog.appLeftovers.title' => 'App Leftovers',
			'myToolsCatalog.appLeftovers.description' => 'Locate and remove app leftovers even if the main app is already gone.',
			'myToolsCatalog.backgroundItems.title' => 'Background Items',
			'myToolsCatalog.backgroundItems.description' => 'Manage background apps and processes running on your Mac.',
			'myToolsCatalog.downloads.title' => 'Downloads',
			'myToolsCatalog.downloads.description' => 'Review and clean one-time use files from Downloads to keep folders tidy.',
			'myToolsCatalog.largeOld.title' => 'Large and Old Files',
			'myToolsCatalog.largeOld.description' => 'Find and remove large, unused files that take up space on your Mac.',
			'myToolsCatalog.similarImages.title' => 'Similar Images',
			'myToolsCatalog.similarImages.description' => 'Review similar photos and keep only the best ones.',
			'myToolsCatalog.trashBins.title' => 'Trash Bins',
			'myToolsCatalog.trashBins.description' => 'Empty all of the available Trash Bins on your Mac.',
			'myToolsCatalog.duplicateFinder.title' => 'Duplicate Finder',
			'myToolsCatalog.duplicateFinder.description' => 'Remove duplicate files stored in different locations on your Mac.',
			'myToolsCatalog.applicationPermissions.title' => 'Application Permissions',
			'myToolsCatalog.applicationPermissions.description' => 'Manage how apps access system features, devices, and functionality.',
			'myToolsCatalog.systemJunk.title' => 'System Junk',
			'myToolsCatalog.systemJunk.description' => 'Remove redundant files that clog up device storage and impede optimal performance.',
			'myToolsCatalog.timeMachineSnapshot.title' => 'Time Machine Snapshot',
			'myToolsCatalog.timeMachineSnapshot.description' => 'Remove local Time Machine snapshots without affecting your backups.',
			'myToolsCatalog.loginItems.title' => 'Login Items',
			'myToolsCatalog.loginItems.description' => 'Manage apps that open automatically when you start your Mac.',
			'myToolsCatalog.mailAttachments.title' => 'Mail Attachments',
			'myToolsCatalog.mailAttachments.description' => 'Remove locally stored email attachments to free space while keeping modified files.',
			'myToolsCatalog.malwareFinder.title' => 'Malware Finder',
			'myToolsCatalog.malwareFinder.description' => 'Identify and remove malicious items to keep your Mac secure.',
			'myToolsCatalog.uninstaller.title' => 'Uninstaller',
			'myToolsCatalog.uninstaller.description' => 'Correctly remove entire applications with all of the related files.',
			'cleanupCategories.userCache.name' => 'User Cache Files',
			'cleanupCategories.userCache.description' => 'Originally intended to improve startup times, the cache files of your applications ultimately accumulate and result in improper functioning or an overall performance drop.',
			'cleanupCategories.userLogs.name' => 'User Log Files',
			'cleanupCategories.userLogs.description' => 'Log files are created by macOS and its applications to record events and errors. Over time they can grow large and take up significant space.',
			'cleanupCategories.languageFiles.name' => 'Language Files',
			'cleanupCategories.languageFiles.description' => 'Unused localization resources bundled with apps. Removing languages you do not use frees up storage without affecting functionality.',
			'cleanupCategories.systemLogs.name' => 'System Log Files',
			'cleanupCategories.systemLogs.description' => 'System-wide log files written by macOS services and daemons. These files are safe to remove as the system re-creates them when needed.',
			'cleanupCategories.brokenLoginItems.name' => 'Broken Login Items',
			'cleanupCategories.brokenLoginItems.description' => 'Login items that point to applications or files that no longer exist on your disk. Removing them speeds up login time.',
			'myClutterDashboard.backToCategories' => 'Back to Categories',
			'myClutterDashboard.filesToSort' => 'You have {count} files to sort through.',
			'myClutterDashboard.quickRecommendations' => 'Use quick recommendations or review them by hand.',
			'myClutterDashboard.reviewAllFiles' => 'Review All Files',
			'myClutterDashboard.freshDuplicatesFound' => '{count} Fresh Duplicates Found',
			'myClutterDashboard.noDuplicates' => 'No duplicates found in this scan.',
			'myClutterDashboard.removeDuplicateBytes' => 'Remove {bytes} of duplicate files.',
			'myClutterDashboard.largeSimilarImagesFound' => '{count} Large Similar Images Found',
			'myClutterDashboard.noSimilarGroups' => 'No similar image groups found.',
			'myClutterDashboard.nearlyIdenticalImages' => 'There are {bytes} of nearly identical images.',
			'myClutterDashboard.largeFilesFound' => '{bytes} of Large Files Found',
			'myClutterDashboard.noLargeFiles' => 'No large files found.',
			'myClutterDashboard.largeFilesReady' => '{count} large files are ready for review.',
			'myClutterDashboard.review' => 'Review',
			'scanResults.itemsSummary' => '{count} items  •  {size}',
			'scanResults.scannedInMs' => 'Scanned in {ms}ms',
			'scanResults.deselectAll' => 'Deselect All',
			'scanResults.selectAll' => 'Select All',
			'scanResults.noItemsMatchSearch' => 'No items match your search',
			'scanResults.noItemsFound' => 'No items found',
			'scanResults.itemsSelected' => '{count} items selected',
			'scanResults.rescan' => 'Rescan',
			'spaceViewStart.subtitle' => 'Pick a parent folder, then scan to map what is taking up the most space.',
			'spaceViewStart.defaultRootPath' => 'Default root path is your main hard drive',
			'spaceViewStart.exploreBubbles' => 'Explore folder sizes through interactive bubbles',
			'spaceViewStart.clickToDrillDown' => 'Click folders to drill down and inspect deeper',
			'shell.comingSoon' => 'Coming soon',
			'myToolsService.snapshotName' => 'Snapshot {id}',
			'myToolsService.timeMachineGroup' => 'Time Machine',
			'myToolsService.timeMachineMacOnly' => 'Time Machine snapshots are only available on macOS.',
			_ => null,
		};
	}
}
