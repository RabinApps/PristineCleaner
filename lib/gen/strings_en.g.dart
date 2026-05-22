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
	late final TranslationsAppEn app = TranslationsAppEn._(_root);
	late final TranslationsLanguageEn language = TranslationsLanguageEn._(_root);
	late final TranslationsNavigationEn navigation = TranslationsNavigationEn._(_root);
	late final TranslationsSectionsEn sections = TranslationsSectionsEn._(_root);
	late final TranslationsProgressEn progress = TranslationsProgressEn._(_root);
	late final TranslationsErrorsEn errors = TranslationsErrorsEn._(_root);
	late final TranslationsButtonsEn buttons = TranslationsButtonsEn._(_root);
	late final TranslationsTooltipsEn tooltips = TranslationsTooltipsEn._(_root);
	late final TranslationsDialogsEn dialogs = TranslationsDialogsEn._(_root);
	late final TranslationsRemovalEn removal = TranslationsRemovalEn._(_root);
	late final TranslationsDoneEn done = TranslationsDoneEn._(_root);
	late final TranslationsCleanupManagerEn cleanupManager = TranslationsCleanupManagerEn._(_root);
	late final TranslationsProjectDirectoryEn projectDirectory = TranslationsProjectDirectoryEn._(_root);
	late final TranslationsSearchAndSortEn searchAndSort = TranslationsSearchAndSortEn._(_root);
	late final TranslationsSpaceViewEn spaceView = TranslationsSpaceViewEn._(_root);
	late final TranslationsSmartCareEn smartCare = TranslationsSmartCareEn._(_root);
	late final TranslationsMyToolsPageEn myToolsPage = TranslationsMyToolsPageEn._(_root);
	late final TranslationsMyToolsMessagesEn myToolsMessages = TranslationsMyToolsMessagesEn._(_root);
	late final TranslationsMyToolsCatalogEn myToolsCatalog = TranslationsMyToolsCatalogEn._(_root);
	late final TranslationsCleanupCategoriesEn cleanupCategories = TranslationsCleanupCategoriesEn._(_root);
	late final TranslationsMyClutterDashboardEn myClutterDashboard = TranslationsMyClutterDashboardEn._(_root);
	late final TranslationsScanResultsEn scanResults = TranslationsScanResultsEn._(_root);
	late final TranslationsSpaceViewStartEn spaceViewStart = TranslationsSpaceViewStartEn._(_root);
	late final TranslationsShellEn shell = TranslationsShellEn._(_root);
	late final TranslationsMyToolsServiceEn myToolsService = TranslationsMyToolsServiceEn._(_root);
}

// Path: app
class TranslationsAppEn {
	TranslationsAppEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'PristineCleaner'
	String get title => 'PristineCleaner';
}

// Path: language
class TranslationsLanguageEn {
	TranslationsLanguageEn._(this._root);

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
class TranslationsNavigationEn {
	TranslationsNavigationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Smart Care'
	String get smartCare => 'Smart Care';

	/// en: 'Cleanup'
	String get cleanup => 'Cleanup';

	/// en: 'My Clutter'
	String get myClutter => 'My Clutter';

	/// en: 'Space View'
	String get spaceView => 'Space View';

	/// en: 'Applications'
	String get applications => 'Applications';

	/// en: 'My Tools'
	String get myTools => 'My Tools';

	/// en: 'My Activity'
	String get myActivity => 'My Activity';
}

// Path: sections
class TranslationsSectionsEn {
	TranslationsSectionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSectionsSmartCareEn smartCare = TranslationsSectionsSmartCareEn._(_root);
	late final TranslationsSectionsCleanupEn cleanup = TranslationsSectionsCleanupEn._(_root);
	late final TranslationsSectionsMyClutterEn myClutter = TranslationsSectionsMyClutterEn._(_root);
	late final TranslationsSectionsSpaceViewEn spaceView = TranslationsSectionsSpaceViewEn._(_root);
	late final TranslationsSectionsApplicationsEn applications = TranslationsSectionsApplicationsEn._(_root);
	late final TranslationsSectionsMyToolsEn myTools = TranslationsSectionsMyToolsEn._(_root);
}

// Path: progress
class TranslationsProgressEn {
	TranslationsProgressEn._(this._root);

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
class TranslationsErrorsEn {
	TranslationsErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '{count} item(s) failed to remove.'
	String get itemsFailedToRemove => '{count} item(s) failed to remove.';
}

// Path: buttons
class TranslationsButtonsEn {
	TranslationsButtonsEn._(this._root);

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
class TranslationsTooltipsEn {
	TranslationsTooltipsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Open in Finder'
	String get openInFinder => 'Open in Finder';
}

// Path: dialogs
class TranslationsDialogsEn {
	TranslationsDialogsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Stop scanning?'
	String get stopScanningTitle => 'Stop scanning?';

	/// en: 'This will cancel the current scan and discard any partial progress.'
	String get stopScanningMessage => 'This will cancel the current scan and discard any partial progress.';

	/// en: 'Stop removal?'
	String get stopRemovalTitle => 'Stop removal?';

	/// en: 'The current file will finish, then remaining files will be skipped.'
	String get stopRemovalMessage => 'The current file will finish, then remaining files will be skipped.';
}

// Path: removal
class TranslationsRemovalEn {
	TranslationsRemovalEn._(this._root);

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
class TranslationsDoneEn {
	TranslationsDoneEn._(this._root);

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

// Path: cleanupManager
class TranslationsCleanupManagerEn {
	TranslationsCleanupManagerEn._(this._root);

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
class TranslationsProjectDirectoryEn {
	TranslationsProjectDirectoryEn._(this._root);

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
class TranslationsSearchAndSortEn {
	TranslationsSearchAndSortEn._(this._root);

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
class TranslationsSpaceViewEn {
	TranslationsSpaceViewEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No folders found for this level'
	String get noFoldersFound => 'No folders found for this level';

	/// en: 'No bubbles to render'
	String get noBubblesToRender => 'No bubbles to render';

	/// en: 'Other items'
	String get otherItems => 'Other items';
}

// Path: smartCare
class TranslationsSmartCareEn {
	TranslationsSmartCareEn._(this._root);

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
}

// Path: myToolsPage
class TranslationsMyToolsPageEn {
	TranslationsMyToolsPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'My Tools'
	String get title => 'My Tools';

	/// en: 'Your go-to tools for keeping your Mac clean, safe and running smoothly.'
	String get subtitle => 'Your go-to tools for keeping your Mac clean, safe and running smoothly.';

	/// en: 'Back to tools'
	String get backToTools => 'Back to tools';
}

// Path: myToolsMessages
class TranslationsMyToolsMessagesEn {
	TranslationsMyToolsMessagesEn._(this._root);

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

	late final TranslationsMyToolsMessagesFallbackEn fallback = TranslationsMyToolsMessagesFallbackEn._(_root);
}

// Path: myToolsCatalog
class TranslationsMyToolsCatalogEn {
	TranslationsMyToolsCatalogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsMyToolsCatalogAppLeftoversEn appLeftovers = TranslationsMyToolsCatalogAppLeftoversEn._(_root);
	late final TranslationsMyToolsCatalogBackgroundItemsEn backgroundItems = TranslationsMyToolsCatalogBackgroundItemsEn._(_root);
	late final TranslationsMyToolsCatalogDownloadsEn downloads = TranslationsMyToolsCatalogDownloadsEn._(_root);
	late final TranslationsMyToolsCatalogLargeOldEn largeOld = TranslationsMyToolsCatalogLargeOldEn._(_root);
	late final TranslationsMyToolsCatalogAppUpdaterEn appUpdater = TranslationsMyToolsCatalogAppUpdaterEn._(_root);
	late final TranslationsMyToolsCatalogSimilarImagesEn similarImages = TranslationsMyToolsCatalogSimilarImagesEn._(_root);
	late final TranslationsMyToolsCatalogPrivacyItemsEn privacyItems = TranslationsMyToolsCatalogPrivacyItemsEn._(_root);
	late final TranslationsMyToolsCatalogTrashBinsEn trashBins = TranslationsMyToolsCatalogTrashBinsEn._(_root);
	late final TranslationsMyToolsCatalogDuplicateFinderEn duplicateFinder = TranslationsMyToolsCatalogDuplicateFinderEn._(_root);
	late final TranslationsMyToolsCatalogApplicationPermissionsEn applicationPermissions = TranslationsMyToolsCatalogApplicationPermissionsEn._(_root);
	late final TranslationsMyToolsCatalogSystemJunkEn systemJunk = TranslationsMyToolsCatalogSystemJunkEn._(_root);
	late final TranslationsMyToolsCatalogTimeMachineSnapshotEn timeMachineSnapshot = TranslationsMyToolsCatalogTimeMachineSnapshotEn._(_root);
	late final TranslationsMyToolsCatalogMaintenanceTasksEn maintenanceTasks = TranslationsMyToolsCatalogMaintenanceTasksEn._(_root);
	late final TranslationsMyToolsCatalogLoginItemsEn loginItems = TranslationsMyToolsCatalogLoginItemsEn._(_root);
	late final TranslationsMyToolsCatalogMailAttachmentsEn mailAttachments = TranslationsMyToolsCatalogMailAttachmentsEn._(_root);
	late final TranslationsMyToolsCatalogMalwareFinderEn malwareFinder = TranslationsMyToolsCatalogMalwareFinderEn._(_root);
	late final TranslationsMyToolsCatalogUninstallerEn uninstaller = TranslationsMyToolsCatalogUninstallerEn._(_root);
}

// Path: cleanupCategories
class TranslationsCleanupCategoriesEn {
	TranslationsCleanupCategoriesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsCleanupCategoriesUserCacheEn userCache = TranslationsCleanupCategoriesUserCacheEn._(_root);
	late final TranslationsCleanupCategoriesUserLogsEn userLogs = TranslationsCleanupCategoriesUserLogsEn._(_root);
	late final TranslationsCleanupCategoriesLanguageFilesEn languageFiles = TranslationsCleanupCategoriesLanguageFilesEn._(_root);
	late final TranslationsCleanupCategoriesSystemLogsEn systemLogs = TranslationsCleanupCategoriesSystemLogsEn._(_root);
	late final TranslationsCleanupCategoriesBrokenLoginItemsEn brokenLoginItems = TranslationsCleanupCategoriesBrokenLoginItemsEn._(_root);
}

// Path: myClutterDashboard
class TranslationsMyClutterDashboardEn {
	TranslationsMyClutterDashboardEn._(this._root);

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
class TranslationsScanResultsEn {
	TranslationsScanResultsEn._(this._root);

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
class TranslationsSpaceViewStartEn {
	TranslationsSpaceViewStartEn._(this._root);

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
class TranslationsShellEn {
	TranslationsShellEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Coming soon'
	String get comingSoon => 'Coming soon';
}

// Path: myToolsService
class TranslationsMyToolsServiceEn {
	TranslationsMyToolsServiceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Snapshot {id}'
	String get snapshotName => 'Snapshot {id}';

	/// en: 'Time Machine'
	String get timeMachineGroup => 'Time Machine';

	/// en: 'Time Machine snapshots are only available on macOS.'
	String get timeMachineMacOnly => 'Time Machine snapshots are only available on macOS.';
}

// Path: sections.smartCare
class TranslationsSectionsSmartCareEn {
	TranslationsSectionsSmartCareEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Smart Care'
	String get title => 'Smart Care';

	/// en: 'Get a complete health overview\nof your system in one click.'
	String get subtitle => 'Get a complete health overview\nof your system in one click.';

	late final TranslationsSectionsSmartCareFeaturesEn features = TranslationsSectionsSmartCareFeaturesEn._(_root);
}

// Path: sections.cleanup
class TranslationsSectionsCleanupEn {
	TranslationsSectionsCleanupEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Junk Cleanup'
	String get title => 'Junk Cleanup';

	/// en: 'Clean your system to achieve maximum\nperformance and reclaim more free space.'
	String get subtitle => 'Clean your system to achieve maximum\nperformance and reclaim more free space.';

	late final TranslationsSectionsCleanupFeaturesEn features = TranslationsSectionsCleanupFeaturesEn._(_root);
}

// Path: sections.myClutter
class TranslationsSectionsMyClutterEn {
	TranslationsSectionsMyClutterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'My Clutter'
	String get title => 'My Clutter';

	/// en: 'Sort through your files and reduce\nthe mess in just a few clicks.'
	String get subtitle => 'Sort through your files and reduce\nthe mess in just a few clicks.';

	late final TranslationsSectionsMyClutterFeaturesEn features = TranslationsSectionsMyClutterFeaturesEn._(_root);
}

// Path: sections.spaceView
class TranslationsSectionsSpaceViewEn {
	TranslationsSectionsSpaceViewEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Space View'
	String get title => 'Space View';

	/// en: 'Visualize what's taking up the most\ndisk space and clean up quickly.'
	String get subtitle => 'Visualize what\'s taking up the most\ndisk space and clean up quickly.';

	late final TranslationsSectionsSpaceViewFeaturesEn features = TranslationsSectionsSpaceViewFeaturesEn._(_root);
}

// Path: sections.applications
class TranslationsSectionsApplicationsEn {
	TranslationsSectionsApplicationsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Applications'
	String get title => 'Applications';

	/// en: 'Take control of your applications.\nUninstall or remove old leftovers.'
	String get subtitle => 'Take control of your applications.\nUninstall or remove old leftovers.';

	late final TranslationsSectionsApplicationsFeaturesEn features = TranslationsSectionsApplicationsFeaturesEn._(_root);
}

// Path: sections.myTools
class TranslationsSectionsMyToolsEn {
	TranslationsSectionsMyToolsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'My Tools'
	String get title => 'My Tools';

	/// en: 'Your go-to toolkit for system care and maintenance.'
	String get subtitle => 'Your go-to toolkit for system care and maintenance.';

	late final TranslationsSectionsMyToolsFeaturesEn features = TranslationsSectionsMyToolsFeaturesEn._(_root);
}

// Path: myToolsMessages.fallback
class TranslationsMyToolsMessagesFallbackEn {
	TranslationsMyToolsMessagesFallbackEn._(this._root);

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
class TranslationsMyToolsCatalogAppLeftoversEn {
	TranslationsMyToolsCatalogAppLeftoversEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'App Leftovers'
	String get title => 'App Leftovers';

	/// en: 'Locate and remove app leftovers even if the main app is already gone.'
	String get description => 'Locate and remove app leftovers even if the main app is already gone.';
}

// Path: myToolsCatalog.backgroundItems
class TranslationsMyToolsCatalogBackgroundItemsEn {
	TranslationsMyToolsCatalogBackgroundItemsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Background Items'
	String get title => 'Background Items';

	/// en: 'Manage background apps and processes running on your Mac.'
	String get description => 'Manage background apps and processes running on your Mac.';
}

// Path: myToolsCatalog.downloads
class TranslationsMyToolsCatalogDownloadsEn {
	TranslationsMyToolsCatalogDownloadsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Downloads'
	String get title => 'Downloads';

	/// en: 'Review and clean one-time use files from Downloads to keep folders tidy.'
	String get description => 'Review and clean one-time use files from Downloads to keep folders tidy.';
}

// Path: myToolsCatalog.largeOld
class TranslationsMyToolsCatalogLargeOldEn {
	TranslationsMyToolsCatalogLargeOldEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Large and Old Files'
	String get title => 'Large and Old Files';

	/// en: 'Find and remove large, unused files that take up space on your Mac.'
	String get description => 'Find and remove large, unused files that take up space on your Mac.';
}

// Path: myToolsCatalog.appUpdater
class TranslationsMyToolsCatalogAppUpdaterEn {
	TranslationsMyToolsCatalogAppUpdaterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'App Updater'
	String get title => 'App Updater';

	/// en: 'Keep an eye on the latest and most reliable versions of your applications.'
	String get description => 'Keep an eye on the latest and most reliable versions of your applications.';
}

// Path: myToolsCatalog.similarImages
class TranslationsMyToolsCatalogSimilarImagesEn {
	TranslationsMyToolsCatalogSimilarImagesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Similar Images'
	String get title => 'Similar Images';

	/// en: 'Review similar photos and keep only the best ones.'
	String get description => 'Review similar photos and keep only the best ones.';
}

// Path: myToolsCatalog.privacyItems
class TranslationsMyToolsCatalogPrivacyItemsEn {
	TranslationsMyToolsCatalogPrivacyItemsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Privacy Items'
	String get title => 'Privacy Items';

	/// en: 'Remove browsing history and activity traces to protect your privacy.'
	String get description => 'Remove browsing history and activity traces to protect your privacy.';
}

// Path: myToolsCatalog.trashBins
class TranslationsMyToolsCatalogTrashBinsEn {
	TranslationsMyToolsCatalogTrashBinsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Trash Bins'
	String get title => 'Trash Bins';

	/// en: 'Empty all of the available Trash Bins on your Mac.'
	String get description => 'Empty all of the available Trash Bins on your Mac.';
}

// Path: myToolsCatalog.duplicateFinder
class TranslationsMyToolsCatalogDuplicateFinderEn {
	TranslationsMyToolsCatalogDuplicateFinderEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Duplicate Finder'
	String get title => 'Duplicate Finder';

	/// en: 'Remove duplicate files stored in different locations on your Mac.'
	String get description => 'Remove duplicate files stored in different locations on your Mac.';
}

// Path: myToolsCatalog.applicationPermissions
class TranslationsMyToolsCatalogApplicationPermissionsEn {
	TranslationsMyToolsCatalogApplicationPermissionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Application Permissions'
	String get title => 'Application Permissions';

	/// en: 'Manage how apps access system features, devices, and functionality.'
	String get description => 'Manage how apps access system features, devices, and functionality.';
}

// Path: myToolsCatalog.systemJunk
class TranslationsMyToolsCatalogSystemJunkEn {
	TranslationsMyToolsCatalogSystemJunkEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'System Junk'
	String get title => 'System Junk';

	/// en: 'Remove redundant files that clog up device storage and impede optimal performance.'
	String get description => 'Remove redundant files that clog up device storage and impede optimal performance.';
}

// Path: myToolsCatalog.timeMachineSnapshot
class TranslationsMyToolsCatalogTimeMachineSnapshotEn {
	TranslationsMyToolsCatalogTimeMachineSnapshotEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Time Machine Snapshot'
	String get title => 'Time Machine Snapshot';

	/// en: 'Remove local Time Machine snapshots without affecting your backups.'
	String get description => 'Remove local Time Machine snapshots without affecting your backups.';
}

// Path: myToolsCatalog.maintenanceTasks
class TranslationsMyToolsCatalogMaintenanceTasksEn {
	TranslationsMyToolsCatalogMaintenanceTasksEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Maintenance Tasks'
	String get title => 'Maintenance Tasks';

	/// en: 'Run a set of recommended maintenance tasks to bring your Mac to its max.'
	String get description => 'Run a set of recommended maintenance tasks to bring your Mac to its max.';
}

// Path: myToolsCatalog.loginItems
class TranslationsMyToolsCatalogLoginItemsEn {
	TranslationsMyToolsCatalogLoginItemsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Login Items'
	String get title => 'Login Items';

	/// en: 'Manage apps that open automatically when you start your Mac.'
	String get description => 'Manage apps that open automatically when you start your Mac.';
}

// Path: myToolsCatalog.mailAttachments
class TranslationsMyToolsCatalogMailAttachmentsEn {
	TranslationsMyToolsCatalogMailAttachmentsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Mail Attachments'
	String get title => 'Mail Attachments';

	/// en: 'Remove locally stored email attachments to free space while keeping modified files.'
	String get description => 'Remove locally stored email attachments to free space while keeping modified files.';
}

// Path: myToolsCatalog.malwareFinder
class TranslationsMyToolsCatalogMalwareFinderEn {
	TranslationsMyToolsCatalogMalwareFinderEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Malware Finder'
	String get title => 'Malware Finder';

	/// en: 'Identify and remove malicious items to keep your Mac secure.'
	String get description => 'Identify and remove malicious items to keep your Mac secure.';
}

// Path: myToolsCatalog.uninstaller
class TranslationsMyToolsCatalogUninstallerEn {
	TranslationsMyToolsCatalogUninstallerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Uninstaller'
	String get title => 'Uninstaller';

	/// en: 'Correctly remove entire applications with all of the related files.'
	String get description => 'Correctly remove entire applications with all of the related files.';
}

// Path: cleanupCategories.userCache
class TranslationsCleanupCategoriesUserCacheEn {
	TranslationsCleanupCategoriesUserCacheEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'User Cache Files'
	String get name => 'User Cache Files';

	/// en: 'Originally intended to improve startup times, the cache files of your applications ultimately accumulate and result in improper functioning or an overall performance drop.'
	String get description => 'Originally intended to improve startup times, the cache files of your applications ultimately accumulate and result in improper functioning or an overall performance drop.';
}

// Path: cleanupCategories.userLogs
class TranslationsCleanupCategoriesUserLogsEn {
	TranslationsCleanupCategoriesUserLogsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'User Log Files'
	String get name => 'User Log Files';

	/// en: 'Log files are created by macOS and its applications to record events and errors. Over time they can grow large and take up significant space.'
	String get description => 'Log files are created by macOS and its applications to record events and errors. Over time they can grow large and take up significant space.';
}

// Path: cleanupCategories.languageFiles
class TranslationsCleanupCategoriesLanguageFilesEn {
	TranslationsCleanupCategoriesLanguageFilesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Language Files'
	String get name => 'Language Files';

	/// en: 'Unused localization resources bundled with apps. Removing languages you do not use frees up storage without affecting functionality.'
	String get description => 'Unused localization resources bundled with apps. Removing languages you do not use frees up storage without affecting functionality.';
}

// Path: cleanupCategories.systemLogs
class TranslationsCleanupCategoriesSystemLogsEn {
	TranslationsCleanupCategoriesSystemLogsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'System Log Files'
	String get name => 'System Log Files';

	/// en: 'System-wide log files written by macOS services and daemons. These files are safe to remove as the system re-creates them when needed.'
	String get description => 'System-wide log files written by macOS services and daemons. These files are safe to remove as the system re-creates them when needed.';
}

// Path: cleanupCategories.brokenLoginItems
class TranslationsCleanupCategoriesBrokenLoginItemsEn {
	TranslationsCleanupCategoriesBrokenLoginItemsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Broken Login Items'
	String get name => 'Broken Login Items';

	/// en: 'Login items that point to applications or files that no longer exist on your disk. Removing them speeds up login time.'
	String get description => 'Login items that point to applications or files that no longer exist on your disk. Removing them speeds up login time.';
}

// Path: sections.smartCare.features
class TranslationsSectionsSmartCareFeaturesEn {
	TranslationsSectionsSmartCareFeaturesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'System Status'
	String get systemStatus => 'System Status';

	/// en: 'Storage Usage'
	String get storageUsage => 'Storage Usage';

	/// en: 'Quick Actions'
	String get quickActions => 'Quick Actions';
}

// Path: sections.cleanup.features
class TranslationsSectionsCleanupFeaturesEn {
	TranslationsSectionsCleanupFeaturesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'System Junk'
	String get systemJunk => 'System Junk';

	/// en: 'User Cache'
	String get userCache => 'User Cache';

	/// en: 'Temp Files'
	String get tempFiles => 'Temp Files';
}

// Path: sections.myClutter.features
class TranslationsSectionsMyClutterFeaturesEn {
	TranslationsSectionsMyClutterFeaturesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Large Files'
	String get largeFiles => 'Large Files';

	/// en: 'Duplicates'
	String get duplicates => 'Duplicates';

	/// en: 'Large Similar Images'
	String get largeSimilarImages => 'Large Similar Images';
}

// Path: sections.spaceView.features
class TranslationsSectionsSpaceViewFeaturesEn {
	TranslationsSectionsSpaceViewFeaturesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Visual Storage Map'
	String get visualStorageMap => 'Visual Storage Map';

	/// en: 'Large Folders Overview'
	String get largeFoldersOverview => 'Large Folders Overview';

	/// en: 'Hidden Files Uncovered'
	String get hiddenFilesUncovered => 'Hidden Files Uncovered';
}

// Path: sections.applications.features
class TranslationsSectionsApplicationsFeaturesEn {
	TranslationsSectionsApplicationsFeaturesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'App Uninstaller'
	String get appUninstaller => 'App Uninstaller';

	/// en: 'Large Apps'
	String get largeApps => 'Large Apps';

	/// en: 'File Leftovers'
	String get fileLeftovers => 'File Leftovers';
}

// Path: sections.myTools.features
class TranslationsSectionsMyToolsFeaturesEn {
	TranslationsSectionsMyToolsFeaturesEn._(this._root);

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
			'navigation.smartCare' => 'Smart Care',
			'navigation.cleanup' => 'Cleanup',
			'navigation.myClutter' => 'My Clutter',
			'navigation.spaceView' => 'Space View',
			'navigation.applications' => 'Applications',
			'navigation.myTools' => 'My Tools',
			'navigation.myActivity' => 'My Activity',
			'sections.smartCare.title' => 'Smart Care',
			'sections.smartCare.subtitle' => 'Get a complete health overview\nof your system in one click.',
			'sections.smartCare.features.systemStatus' => 'System Status',
			'sections.smartCare.features.storageUsage' => 'Storage Usage',
			'sections.smartCare.features.quickActions' => 'Quick Actions',
			'sections.cleanup.title' => 'Junk Cleanup',
			'sections.cleanup.subtitle' => 'Clean your system to achieve maximum\nperformance and reclaim more free space.',
			'sections.cleanup.features.systemJunk' => 'System Junk',
			'sections.cleanup.features.userCache' => 'User Cache',
			'sections.cleanup.features.tempFiles' => 'Temp Files',
			'sections.myClutter.title' => 'My Clutter',
			'sections.myClutter.subtitle' => 'Sort through your files and reduce\nthe mess in just a few clicks.',
			'sections.myClutter.features.largeFiles' => 'Large Files',
			'sections.myClutter.features.duplicates' => 'Duplicates',
			'sections.myClutter.features.largeSimilarImages' => 'Large Similar Images',
			'sections.spaceView.title' => 'Space View',
			'sections.spaceView.subtitle' => 'Visualize what\'s taking up the most\ndisk space and clean up quickly.',
			'sections.spaceView.features.visualStorageMap' => 'Visual Storage Map',
			'sections.spaceView.features.largeFoldersOverview' => 'Large Folders Overview',
			'sections.spaceView.features.hiddenFilesUncovered' => 'Hidden Files Uncovered',
			'sections.applications.title' => 'Applications',
			'sections.applications.subtitle' => 'Take control of your applications.\nUninstall or remove old leftovers.',
			'sections.applications.features.appUninstaller' => 'App Uninstaller',
			'sections.applications.features.largeApps' => 'Large Apps',
			'sections.applications.features.fileLeftovers' => 'File Leftovers',
			'sections.myTools.title' => 'My Tools',
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
			'dialogs.stopRemovalTitle' => 'Stop removal?',
			'dialogs.stopRemovalMessage' => 'The current file will finish, then remaining files will be skipped.',
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
			'smartCare.refresh' => 'Refresh',
			'smartCare.unableToReadDiskInfo' => 'Unable to read disk info',
			'smartCare.totalStorage' => 'Total Storage',
			'smartCare.used' => 'Used',
			'smartCare.available' => 'Available',
			'smartCare.percentUsed' => '{percent}% used',
			'myToolsPage.title' => 'My Tools',
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
			'myToolsCatalog.appUpdater.title' => 'App Updater',
			'myToolsCatalog.appUpdater.description' => 'Keep an eye on the latest and most reliable versions of your applications.',
			'myToolsCatalog.similarImages.title' => 'Similar Images',
			'myToolsCatalog.similarImages.description' => 'Review similar photos and keep only the best ones.',
			'myToolsCatalog.privacyItems.title' => 'Privacy Items',
			'myToolsCatalog.privacyItems.description' => 'Remove browsing history and activity traces to protect your privacy.',
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
			'myToolsCatalog.maintenanceTasks.title' => 'Maintenance Tasks',
			'myToolsCatalog.maintenanceTasks.description' => 'Run a set of recommended maintenance tasks to bring your Mac to its max.',
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
