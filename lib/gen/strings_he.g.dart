///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsHe with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsHe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.he,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <he>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsHe _root = this; // ignore: unused_field

	@override 
	TranslationsHe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHe(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppHe app = _TranslationsAppHe._(_root);
	@override late final _TranslationsLanguageHe language = _TranslationsLanguageHe._(_root);
	@override late final _TranslationsNavigationHe navigation = _TranslationsNavigationHe._(_root);
	@override late final _TranslationsSectionsHe sections = _TranslationsSectionsHe._(_root);
	@override late final _TranslationsProgressHe progress = _TranslationsProgressHe._(_root);
	@override late final _TranslationsErrorsHe errors = _TranslationsErrorsHe._(_root);
	@override late final _TranslationsButtonsHe buttons = _TranslationsButtonsHe._(_root);
	@override late final _TranslationsTooltipsHe tooltips = _TranslationsTooltipsHe._(_root);
	@override late final _TranslationsDialogsHe dialogs = _TranslationsDialogsHe._(_root);
	@override late final _TranslationsRemovalHe removal = _TranslationsRemovalHe._(_root);
	@override late final _TranslationsDoneHe done = _TranslationsDoneHe._(_root);
	@override late final _TranslationsCleanupManagerHe cleanupManager = _TranslationsCleanupManagerHe._(_root);
	@override late final _TranslationsProjectDirectoryHe projectDirectory = _TranslationsProjectDirectoryHe._(_root);
	@override late final _TranslationsSearchAndSortHe searchAndSort = _TranslationsSearchAndSortHe._(_root);
	@override late final _TranslationsSpaceViewHe spaceView = _TranslationsSpaceViewHe._(_root);
	@override late final _TranslationsHomeHe home = _TranslationsHomeHe._(_root);
	@override late final _TranslationsMyToolsPageHe myToolsPage = _TranslationsMyToolsPageHe._(_root);
	@override late final _TranslationsMyToolsMessagesHe myToolsMessages = _TranslationsMyToolsMessagesHe._(_root);
	@override late final _TranslationsMyToolsCatalogHe myToolsCatalog = _TranslationsMyToolsCatalogHe._(_root);
	@override late final _TranslationsCleanupCategoriesHe cleanupCategories = _TranslationsCleanupCategoriesHe._(_root);
	@override late final _TranslationsMyClutterDashboardHe myClutterDashboard = _TranslationsMyClutterDashboardHe._(_root);
	@override late final _TranslationsScanResultsHe scanResults = _TranslationsScanResultsHe._(_root);
	@override late final _TranslationsSpaceViewStartHe spaceViewStart = _TranslationsSpaceViewStartHe._(_root);
	@override late final _TranslationsShellHe shell = _TranslationsShellHe._(_root);
	@override late final _TranslationsMyToolsServiceHe myToolsService = _TranslationsMyToolsServiceHe._(_root);
}

// Path: app
class _TranslationsAppHe implements TranslationsAppEn {
	_TranslationsAppHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'PristineCleaner';
}

// Path: language
class _TranslationsLanguageHe implements TranslationsLanguageEn {
	_TranslationsLanguageHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get label => 'שָׂפָה';
	@override String get english => 'אַנגְלִית';
	@override String get spanish => 'סְפָרַדִית';
	@override String get italian => 'אִיטַלְקִית';
	@override String get french => 'צָרְפָתִית';
	@override String get hebrew => 'עִברִית';
	@override String get greek => 'יוונית';
	@override String get portuguese => 'פורטוגזית';
	@override String get mandarin => 'מַנדָרִין';
}

// Path: navigation
class _TranslationsNavigationHe implements TranslationsNavigationEn {
	_TranslationsNavigationHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get home => 'בַּיִת';
	@override String get cleanup => 'ניקיון';
	@override String get myClutter => 'הבלגן שלי';
	@override String get spaceView => 'תצוגת חלל';
	@override String get applications => 'יישומים';
	@override String get myTools => 'הכלים שלי';
	@override String get myActivity => 'הפעילות שלי';
}

// Path: sections
class _TranslationsSectionsHe implements TranslationsSectionsEn {
	_TranslationsSectionsHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSectionsHomeHe home = _TranslationsSectionsHomeHe._(_root);
	@override late final _TranslationsSectionsCleanupHe cleanup = _TranslationsSectionsCleanupHe._(_root);
	@override late final _TranslationsSectionsMyClutterHe myClutter = _TranslationsSectionsMyClutterHe._(_root);
	@override late final _TranslationsSectionsSpaceViewHe spaceView = _TranslationsSectionsSpaceViewHe._(_root);
	@override late final _TranslationsSectionsApplicationsHe applications = _TranslationsSectionsApplicationsHe._(_root);
	@override late final _TranslationsSectionsMyToolsHe myTools = _TranslationsSectionsMyToolsHe._(_root);
}

// Path: progress
class _TranslationsProgressHe implements TranslationsProgressEn {
	_TranslationsProgressHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get countingFiles => 'סופר קבצים...';
	@override String get countingApplications => 'סופר יישומים...';
	@override String get countingFolders => 'סופר תיקיות...';
}

// Path: errors
class _TranslationsErrorsHe implements TranslationsErrorsEn {
	_TranslationsErrorsHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get itemsFailedToRemove => '{count} פריטים נכשלו בהסרה.';
}

// Path: buttons
class _TranslationsButtonsHe implements TranslationsButtonsEn {
	_TranslationsButtonsHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get scan => 'לִסְרוֹק';
	@override String get stop => 'לְהַפְסִיק';
	@override String get done => 'נַעֲשָׂה';
	@override String get clean => 'לְנַקוֹת';
	@override String get cleanUp => 'לנקות';
	@override String get close => 'לִסְגוֹר';
	@override String get refresh => 'לְרַעֲנֵן';
	@override String get rescan => 'סרוק מחדש';
	@override String get startOver => 'התחל מחדש';
	@override String get selectAll => 'בחר הכל';
	@override String get clearSelection => 'נקה בחירה';
	@override String get keepScanning => 'המשך לסרוק';
	@override String get keepRemoving => 'תמשיך להסיר';
}

// Path: tooltips
class _TranslationsTooltipsHe implements TranslationsTooltipsEn {
	_TranslationsTooltipsHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get search => 'לְחַפֵּשׂ';
	@override String get openInFinder => 'פתח ב-Finder';
}

// Path: dialogs
class _TranslationsDialogsHe implements TranslationsDialogsEn {
	_TranslationsDialogsHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get stopScanningTitle => 'להפסיק לסרוק?';
	@override String get stopScanningMessage => 'פעולה זו תבטל את הסריקה הנוכחית ותבטל כל התקדמות חלקית.';
	@override String get stopRemovalTitle => 'להפסיק את ההסרה?';
	@override String get stopRemovalMessage => 'הקובץ הנוכחי יסתיים, ואז ידלגו על הקבצים הנותרים.';
}

// Path: removal
class _TranslationsRemovalHe implements TranslationsRemovalEn {
	_TranslationsRemovalHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get barrierLabel => 'התקדמות ההסרה';
	@override String get preparing => 'עֲרִיכָה...';
	@override String get removingFrom => 'מסיר מ{title}';
	@override String get stoppingAfterCurrentFile => 'מפסיק אחרי הקובץ הנוכחי...';
	@override String get keepWindowOpen => 'אנא השאר חלון זה פתוח בזמן שההסרה פועלת.';
	@override String get processedSummary => '{processed} מתוך {total} עובד';
	@override String get deletedFreed => '{deleted} נמחק • {bytes} שוחרר';
	@override String get currentItem => 'נוכחי: {name}';
	@override String get stopping => 'סְתִימָה...';
	@override String get removalFailed => 'ההסרה נכשלה';
	@override String get removalFailedDetails => 'משהו השתבש במהלך הסרת הקבצים שנבחרו.';
	@override String get removalStopped => 'ההסרה הופסקה';
	@override String get removalComplete => 'ההסרה הושלמה';
	@override String get deletedSummary => '{title} נמחקו {count} פריטים';
	@override String get freedSummary => '{bytes} משוחרר';
	@override String get failedToRemoveSummary => '{count} פריטים נכשלו בהסרה.';
	@override String get deletedFiles => 'קבצים שנמחקו';
	@override String get noFilesDeleted => 'לא נמחקו קבצים.';
}

// Path: done
class _TranslationsDoneHe implements TranslationsDoneEn {
	_TranslationsDoneHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get allCleanedTitle => 'הכל ניקה!';
	@override String get movedToTrashMessage => 'הקבצים שנבחרו הועברו לאשפה.';
	@override String get applicationsRemovedTitle => 'אפליקציות הוסרו!';
	@override String get appsMovedToTrashMessage => 'אפליקציות נבחרות הועברו לאשפה.';
}

// Path: cleanupManager
class _TranslationsCleanupManagerHe implements TranslationsCleanupManagerEn {
	_TranslationsCleanupManagerHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'מנהל ניקיון';
	@override String get systemJunkHeader => 'זבל מערכת';
	@override String get systemJunkDescription => 'קבצים מיותרים שסותמים את אחסון המכשיר ופוגעים בביצועים אופטימליים.';
	@override String get selectLabel => 'לִבחוֹר';
	@override String get selectAllOption => 'כֹּל';
	@override String get selectNoneOption => 'אַף לֹא אֶחָד';
	@override String get noItems => 'אין פריטים';
	@override String get noItemsFound => 'לא נמצאו פריטים';
	@override String get itemsSelected => 'נבחרו {count} פריטים';
}

// Path: projectDirectory
class _TranslationsProjectDirectoryHe implements TranslationsProjectDirectoryEn {
	_TranslationsProjectDirectoryHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get chooseFolder => 'בחר תיקייה...';
	@override String get chooseProjectDirectory => 'בחר את ספריית הפרויקט';
	@override String get chooseParentFolder => 'בחר תיקיית אב';
	@override String get noFolder => 'אין תיקיה';
}

// Path: searchAndSort
class _TranslationsSearchAndSortHe implements TranslationsSearchAndSortEn {
	_TranslationsSearchAndSortHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get searchHint => 'לְחַפֵּשׂ...';
	@override String get sortBy => 'מיין לפי';
	@override String get size => 'גוֹדֶל';
	@override String get name => 'שֵׁם';
	@override String get ascending => 'עוֹלֶה';
	@override String get descending => 'יורד';
}

// Path: spaceView
class _TranslationsSpaceViewHe implements TranslationsSpaceViewEn {
	_TranslationsSpaceViewHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get noFoldersFound => 'לא נמצאו תיקיות לרמה זו';
	@override String get noBubblesToRender => 'אין בועות לעיבוד';
	@override String get otherItems => 'פריטים אחרים';
}

// Path: home
class _TranslationsHomeHe implements TranslationsHomeEn {
	_TranslationsHomeHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get refresh => 'לְרַעֲנֵן';
	@override String get unableToReadDiskInfo => 'לא ניתן לקרוא מידע על הדיסק';
	@override String get totalStorage => 'אחסון כולל';
	@override String get used => 'מְשׁוּמָשׁ';
	@override String get available => 'זָמִין';
	@override String get percentUsed => '{percent}% בשימוש';
	@override String get cpuUsage => 'שימוש במעבד';
	@override String get ramUsage => 'שימוש בזיכרון RAM';
	@override String get memoryPercentUsed => '{percent}% RAM בשימוש';
	@override String get unableToReadSystemInfo => 'לא ניתן לקרוא את פרטי המערכת';
}

// Path: myToolsPage
class _TranslationsMyToolsPageHe implements TranslationsMyToolsPageEn {
	_TranslationsMyToolsPageHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הכלים שלי';
	@override String get subtitle => 'הכלים שלך לשמירה על ה-Mac שלך נקי, בטוח ופועל בצורה חלקה.';
	@override String get backToTools => 'חזרה לכלים';
}

// Path: myToolsMessages
class _TranslationsMyToolsMessagesHe implements TranslationsMyToolsMessagesEn {
	_TranslationsMyToolsMessagesHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get itemsWithSize => '{count} פריטים • {size}';
	@override String get scanCancelled => 'הסריקה בוטלה.';
	@override String get selectAtLeastOne => 'בחר לפחות פריט אחד לניקוי.';
	@override String get failedToClean => 'נכשל ניקוי {count} פריטים.';
	@override String get everythingSelectedCleaned => 'כל מה שנבחר נוקה.';
	@override String get cleanupUpdated => 'הניקוי עודכן.';
	@override String get cleanedCount => 'ניקה {count} פריט(ים).';
	@override String get stoppedPrefix => 'נֶעצָר.';
	@override String get removedCount => 'הוסרו {count} פריטים.';
	@override String get failedCountShort => '{count} נכשל.';
	@override String get scanComplete => 'הסריקה הושלמה.';
	@override String get somethingWentWrong => 'משהו השתבש.';
	@override late final _TranslationsMyToolsMessagesFallbackHe fallback = _TranslationsMyToolsMessagesFallbackHe._(_root);
}

// Path: myToolsCatalog
class _TranslationsMyToolsCatalogHe implements TranslationsMyToolsCatalogEn {
	_TranslationsMyToolsCatalogHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMyToolsCatalogAppLeftoversHe appLeftovers = _TranslationsMyToolsCatalogAppLeftoversHe._(_root);
	@override late final _TranslationsMyToolsCatalogBackgroundItemsHe backgroundItems = _TranslationsMyToolsCatalogBackgroundItemsHe._(_root);
	@override late final _TranslationsMyToolsCatalogDownloadsHe downloads = _TranslationsMyToolsCatalogDownloadsHe._(_root);
	@override late final _TranslationsMyToolsCatalogLargeOldHe largeOld = _TranslationsMyToolsCatalogLargeOldHe._(_root);
	@override late final _TranslationsMyToolsCatalogAppUpdaterHe appUpdater = _TranslationsMyToolsCatalogAppUpdaterHe._(_root);
	@override late final _TranslationsMyToolsCatalogSimilarImagesHe similarImages = _TranslationsMyToolsCatalogSimilarImagesHe._(_root);
	@override late final _TranslationsMyToolsCatalogPrivacyItemsHe privacyItems = _TranslationsMyToolsCatalogPrivacyItemsHe._(_root);
	@override late final _TranslationsMyToolsCatalogTrashBinsHe trashBins = _TranslationsMyToolsCatalogTrashBinsHe._(_root);
	@override late final _TranslationsMyToolsCatalogDuplicateFinderHe duplicateFinder = _TranslationsMyToolsCatalogDuplicateFinderHe._(_root);
	@override late final _TranslationsMyToolsCatalogApplicationPermissionsHe applicationPermissions = _TranslationsMyToolsCatalogApplicationPermissionsHe._(_root);
	@override late final _TranslationsMyToolsCatalogSystemJunkHe systemJunk = _TranslationsMyToolsCatalogSystemJunkHe._(_root);
	@override late final _TranslationsMyToolsCatalogTimeMachineSnapshotHe timeMachineSnapshot = _TranslationsMyToolsCatalogTimeMachineSnapshotHe._(_root);
	@override late final _TranslationsMyToolsCatalogMaintenanceTasksHe maintenanceTasks = _TranslationsMyToolsCatalogMaintenanceTasksHe._(_root);
	@override late final _TranslationsMyToolsCatalogLoginItemsHe loginItems = _TranslationsMyToolsCatalogLoginItemsHe._(_root);
	@override late final _TranslationsMyToolsCatalogMailAttachmentsHe mailAttachments = _TranslationsMyToolsCatalogMailAttachmentsHe._(_root);
	@override late final _TranslationsMyToolsCatalogMalwareFinderHe malwareFinder = _TranslationsMyToolsCatalogMalwareFinderHe._(_root);
	@override late final _TranslationsMyToolsCatalogUninstallerHe uninstaller = _TranslationsMyToolsCatalogUninstallerHe._(_root);
}

// Path: cleanupCategories
class _TranslationsCleanupCategoriesHe implements TranslationsCleanupCategoriesEn {
	_TranslationsCleanupCategoriesHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsCleanupCategoriesUserCacheHe userCache = _TranslationsCleanupCategoriesUserCacheHe._(_root);
	@override late final _TranslationsCleanupCategoriesUserLogsHe userLogs = _TranslationsCleanupCategoriesUserLogsHe._(_root);
	@override late final _TranslationsCleanupCategoriesLanguageFilesHe languageFiles = _TranslationsCleanupCategoriesLanguageFilesHe._(_root);
	@override late final _TranslationsCleanupCategoriesSystemLogsHe systemLogs = _TranslationsCleanupCategoriesSystemLogsHe._(_root);
	@override late final _TranslationsCleanupCategoriesBrokenLoginItemsHe brokenLoginItems = _TranslationsCleanupCategoriesBrokenLoginItemsHe._(_root);
}

// Path: myClutterDashboard
class _TranslationsMyClutterDashboardHe implements TranslationsMyClutterDashboardEn {
	_TranslationsMyClutterDashboardHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get backToCategories => 'חזרה לקטגוריות';
	@override String get filesToSort => 'יש לך {count} קבצים למיין.';
	@override String get quickRecommendations => 'השתמש בהמלצות מהירות או עיין בהן ביד.';
	@override String get reviewAllFiles => 'סקור את כל הקבצים';
	@override String get freshDuplicatesFound => '{count} נמצאו כפילויות טריות';
	@override String get noDuplicates => 'לא נמצאו כפילויות בסריקה זו.';
	@override String get removeDuplicateBytes => 'הסר {bytes} של קבצים כפולים.';
	@override String get largeSimilarImagesFound => '{count} נמצאו תמונות דומות גדולות';
	@override String get noSimilarGroups => 'לא נמצאו קבוצות תמונות דומות.';
	@override String get nearlyIdenticalImages => 'יש {bytes} של תמונות כמעט זהות.';
	@override String get largeFilesFound => 'נמצאו {bytes} של קבצים גדולים';
	@override String get noLargeFiles => 'לא נמצאו קבצים גדולים.';
	@override String get largeFilesReady => '{count} קבצים גדולים מוכנים לבדיקה.';
	@override String get review => 'סְקִירָה';
}

// Path: scanResults
class _TranslationsScanResultsHe implements TranslationsScanResultsEn {
	_TranslationsScanResultsHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get itemsSummary => '{count} פריטים • {size}';
	@override String get scannedInMs => 'נסרק תוך {ms}ms';
	@override String get deselectAll => 'בטל את הבחירה בהכל';
	@override String get selectAll => 'בחר הכל';
	@override String get noItemsMatchSearch => 'אין פריטים שתואמים לחיפוש שלך';
	@override String get noItemsFound => 'לא נמצאו פריטים';
	@override String get itemsSelected => 'נבחרו {count} פריטים';
	@override String get rescan => 'סרוק מחדש';
}

// Path: spaceViewStart
class _TranslationsSpaceViewStartHe implements TranslationsSpaceViewStartEn {
	_TranslationsSpaceViewStartHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get subtitle => 'בחר תיקיית אב ולאחר מכן סרוק כדי למפות את מה שתופס הכי הרבה מקום.';
	@override String get defaultRootPath => 'נתיב שורש ברירת המחדל הוא הכונן הקשיח הראשי שלך';
	@override String get exploreBubbles => 'חקור גדלי תיקיות באמצעות בועות אינטראקטיביות';
	@override String get clickToDrillDown => 'לחץ על תיקיות כדי להתעמק ולבדוק לעומק';
}

// Path: shell
class _TranslationsShellHe implements TranslationsShellEn {
	_TranslationsShellHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get comingSoon => 'בקרוב';
}

// Path: myToolsService
class _TranslationsMyToolsServiceHe implements TranslationsMyToolsServiceEn {
	_TranslationsMyToolsServiceHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get snapshotName => 'תמונת מצב {id}';
	@override String get timeMachineGroup => 'מכונת זמן';
	@override String get timeMachineMacOnly => 'צילומי מצב של Time Machine זמינים רק ב-macOS.';
}

// Path: sections.home
class _TranslationsSectionsHomeHe implements TranslationsSectionsHomeEn {
	_TranslationsSectionsHomeHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'בַּיִת';
	@override String get subtitle => 'קבל סקירת בריאות מלאה\nעל המערכת שלך בלחיצה אחת.';
	@override late final _TranslationsSectionsHomeFeaturesHe features = _TranslationsSectionsHomeFeaturesHe._(_root);
}

// Path: sections.cleanup
class _TranslationsSectionsCleanupHe implements TranslationsSectionsCleanupEn {
	_TranslationsSectionsCleanupHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'ניקוי זבל';
	@override String get subtitle => 'נקה את המערכת שלך כדי להשיג\n ביצועים מקסימליים ולהשיב עוד מקום פנוי.';
	@override late final _TranslationsSectionsCleanupFeaturesHe features = _TranslationsSectionsCleanupFeaturesHe._(_root);
}

// Path: sections.myClutter
class _TranslationsSectionsMyClutterHe implements TranslationsSectionsMyClutterEn {
	_TranslationsSectionsMyClutterHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הבלגן שלי';
	@override String get subtitle => 'מיין את הקבצים שלך וצמצם\n את הבלגן בכמה קליקים בלבד.';
	@override late final _TranslationsSectionsMyClutterFeaturesHe features = _TranslationsSectionsMyClutterFeaturesHe._(_root);
}

// Path: sections.spaceView
class _TranslationsSectionsSpaceViewHe implements TranslationsSectionsSpaceViewEn {
	_TranslationsSectionsSpaceViewHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'תצוגת חלל';
	@override String get subtitle => 'דמיין מה תופס הכי הרבה שטח בדיסק ונקה במהירות.';
	@override late final _TranslationsSectionsSpaceViewFeaturesHe features = _TranslationsSectionsSpaceViewFeaturesHe._(_root);
}

// Path: sections.applications
class _TranslationsSectionsApplicationsHe implements TranslationsSectionsApplicationsEn {
	_TranslationsSectionsApplicationsHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'יישומים';
	@override String get subtitle => 'קח שליטה על האפליקציות שלך.\nהסר את ההתקנה או הסר שאריות ישנות.';
	@override late final _TranslationsSectionsApplicationsFeaturesHe features = _TranslationsSectionsApplicationsFeaturesHe._(_root);
}

// Path: sections.myTools
class _TranslationsSectionsMyToolsHe implements TranslationsSectionsMyToolsEn {
	_TranslationsSectionsMyToolsHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הכלים שלי';
	@override String get subtitle => 'ערכת הכלים שלך לטיפול ותחזוקה של המערכת.';
	@override late final _TranslationsSectionsMyToolsFeaturesHe features = _TranslationsSectionsMyToolsFeaturesHe._(_root);
}

// Path: myToolsMessages.fallback
class _TranslationsMyToolsMessagesFallbackHe implements TranslationsMyToolsMessagesFallbackEn {
	_TranslationsMyToolsMessagesFallbackHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get downloadsTidy => 'ההורדות מסודרות.';
	@override String get noOversizedStale => 'לא נמצאו קבצים מיושנים גדולים מדי.';
	@override String get noRecentDuplicates => 'לא נמצאו כפילויות אחרונות.';
	@override String get noSimilarLargeImages => 'לא נמצאו תמונות גדולות דומות.';
	@override String get noAppLeftovers => 'לא נמצאו שאריות אפליקציה שניתנות להסרה.';
	@override String get noStaleApps => 'לא נמצאו יישומים מיושנים.';
	@override String get appsNeedReview => 'נמצאו יישומים שעשויים להזדקק לבדיקה.';
	@override String get noSystemJunkCandidates => 'אין מועמדים לניקוי בזבל של המערכת.';
	@override String get noBrokenStartup => 'לא נמצאו ערכי הפעלה/רקע שבורים.';
	@override String get noBackgroundItems => 'לא נמצאו פריטי רקע.';
	@override String get noPrivacyTraces => 'לא נמצאו עקבות פרטיות במיקומים ידועים.';
	@override String get trashAlreadyEmpty => 'האשפה כבר ריקה.';
	@override String get noPermissionCache => 'לא נמצאו קבצי מטמון הרשאות.';
	@override String get noTimeMachineSnapshots => 'לא נמצאו צילומי מצב מקומיים של Time Machine.';
	@override String get noMaintenanceCandidates => 'לא נמצאו מועמדים לתחזוקה.';
	@override String get noMailAttachments => 'לא נמצאו קבצי דואר ניתנים להסרה.';
	@override String get noSuspiciousFiles => 'לא זוהו קבצים חשודים.';
}

// Path: myToolsCatalog.appLeftovers
class _TranslationsMyToolsCatalogAppLeftoversHe implements TranslationsMyToolsCatalogAppLeftoversEn {
	_TranslationsMyToolsCatalogAppLeftoversHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'שאריות אפליקציה';
	@override String get description => 'אתר והסר שאריות אפליקציה גם אם האפליקציה הראשית כבר נעלמה.';
}

// Path: myToolsCatalog.backgroundItems
class _TranslationsMyToolsCatalogBackgroundItemsHe implements TranslationsMyToolsCatalogBackgroundItemsEn {
	_TranslationsMyToolsCatalogBackgroundItemsHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'פריטי רקע';
	@override String get description => 'נהל אפליקציות ותהליכים ברקע הפועלים ב-Mac שלך.';
}

// Path: myToolsCatalog.downloads
class _TranslationsMyToolsCatalogDownloadsHe implements TranslationsMyToolsCatalogDownloadsEn {
	_TranslationsMyToolsCatalogDownloadsHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הורדות';
	@override String get description => 'סקור ונקה קבצי שימוש חד פעמי מהורדות כדי לשמור על תיקיות מסודרות.';
}

// Path: myToolsCatalog.largeOld
class _TranslationsMyToolsCatalogLargeOldHe implements TranslationsMyToolsCatalogLargeOldEn {
	_TranslationsMyToolsCatalogLargeOldHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'קבצים גדולים וישנים';
	@override String get description => 'מצא והסר קבצים גדולים שאינם בשימוש שתופסים מקום ב-Mac שלך.';
}

// Path: myToolsCatalog.appUpdater
class _TranslationsMyToolsCatalogAppUpdaterHe implements TranslationsMyToolsCatalogAppUpdaterEn {
	_TranslationsMyToolsCatalogAppUpdaterHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'עדכון אפליקציות';
	@override String get description => 'שים לב לגרסאות העדכניות והאמינות ביותר של היישומים שלך.';
}

// Path: myToolsCatalog.similarImages
class _TranslationsMyToolsCatalogSimilarImagesHe implements TranslationsMyToolsCatalogSimilarImagesEn {
	_TranslationsMyToolsCatalogSimilarImagesHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'תמונות דומות';
	@override String get description => 'סקור תמונות דומות ושמור רק את הטובות ביותר.';
}

// Path: myToolsCatalog.privacyItems
class _TranslationsMyToolsCatalogPrivacyItemsHe implements TranslationsMyToolsCatalogPrivacyItemsEn {
	_TranslationsMyToolsCatalogPrivacyItemsHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'פריטי פרטיות';
	@override String get description => 'הסר היסטוריית גלישה ועקבות פעילות כדי להגן על הפרטיות שלך.';
}

// Path: myToolsCatalog.trashBins
class _TranslationsMyToolsCatalogTrashBinsHe implements TranslationsMyToolsCatalogTrashBinsEn {
	_TranslationsMyToolsCatalogTrashBinsHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'פחי אשפה';
	@override String get description => 'רוקן את כל פחי האשפה הזמינים ב-Mac שלך.';
}

// Path: myToolsCatalog.duplicateFinder
class _TranslationsMyToolsCatalogDuplicateFinderHe implements TranslationsMyToolsCatalogDuplicateFinderEn {
	_TranslationsMyToolsCatalogDuplicateFinderHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'כפיל Finder';
	@override String get description => 'הסר קבצים כפולים המאוחסנים במיקומים שונים ב-Mac שלך.';
}

// Path: myToolsCatalog.applicationPermissions
class _TranslationsMyToolsCatalogApplicationPermissionsHe implements TranslationsMyToolsCatalogApplicationPermissionsEn {
	_TranslationsMyToolsCatalogApplicationPermissionsHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הרשאות אפליקציה';
	@override String get description => 'נהל כיצד יישומים ניגשים לתכונות המערכת, התקנים ופונקציונליות.';
}

// Path: myToolsCatalog.systemJunk
class _TranslationsMyToolsCatalogSystemJunkHe implements TranslationsMyToolsCatalogSystemJunkEn {
	_TranslationsMyToolsCatalogSystemJunkHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'זבל מערכת';
	@override String get description => 'הסר קבצים מיותרים שסותמים את אחסון המכשיר ופוגעים בביצועים אופטימליים.';
}

// Path: myToolsCatalog.timeMachineSnapshot
class _TranslationsMyToolsCatalogTimeMachineSnapshotHe implements TranslationsMyToolsCatalogTimeMachineSnapshotEn {
	_TranslationsMyToolsCatalogTimeMachineSnapshotHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'תמונת מצב של מכונת זמן';
	@override String get description => 'הסר תמונות מקומיות של Time Machine מבלי להשפיע על הגיבויים שלך.';
}

// Path: myToolsCatalog.maintenanceTasks
class _TranslationsMyToolsCatalogMaintenanceTasksHe implements TranslationsMyToolsCatalogMaintenanceTasksEn {
	_TranslationsMyToolsCatalogMaintenanceTasksHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'משימות תחזוקה';
	@override String get description => 'הפעל קבוצה של משימות תחזוקה מומלצות כדי להביא את ה-Mac שלך למקסימום.';
}

// Path: myToolsCatalog.loginItems
class _TranslationsMyToolsCatalogLoginItemsHe implements TranslationsMyToolsCatalogLoginItemsEn {
	_TranslationsMyToolsCatalogLoginItemsHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'פריטי כניסה';
	@override String get description => 'נהל אפליקציות שנפתחות אוטומטית כשאתה מפעיל את ה-Mac שלך.';
}

// Path: myToolsCatalog.mailAttachments
class _TranslationsMyToolsCatalogMailAttachmentsHe implements TranslationsMyToolsCatalogMailAttachmentsEn {
	_TranslationsMyToolsCatalogMailAttachmentsHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'קבצים מצורפים לדואר';
	@override String get description => 'הסר קבצים מצורפים לאימייל המאוחסנים מקומית כדי לפנות מקום תוך שמירה על קבצים ששונו.';
}

// Path: myToolsCatalog.malwareFinder
class _TranslationsMyToolsCatalogMalwareFinderHe implements TranslationsMyToolsCatalogMalwareFinderEn {
	_TranslationsMyToolsCatalogMalwareFinderHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'מאתר תוכנות זדוניות';
	@override String get description => 'זהה והסר פריטים זדוניים כדי לשמור על אבטחת ה-Mac שלך.';
}

// Path: myToolsCatalog.uninstaller
class _TranslationsMyToolsCatalogUninstallerHe implements TranslationsMyToolsCatalogUninstallerEn {
	_TranslationsMyToolsCatalogUninstallerHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'מסיר התקנה';
	@override String get description => 'הסר כהלכה יישומים שלמים עם כל הקבצים הקשורים.';
}

// Path: cleanupCategories.userCache
class _TranslationsCleanupCategoriesUserCacheHe implements TranslationsCleanupCategoriesUserCacheEn {
	_TranslationsCleanupCategoriesUserCacheHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get name => 'קבצי מטמון משתמש';
	@override String get description => 'במקור נועדו לשפר את זמני האתחול, קבצי המטמון של היישומים שלך מצטברים בסופו של דבר וגורמים לתפקוד לא תקין או לירידה כללית בביצועים.';
}

// Path: cleanupCategories.userLogs
class _TranslationsCleanupCategoriesUserLogsHe implements TranslationsCleanupCategoriesUserLogsEn {
	_TranslationsCleanupCategoriesUserLogsHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get name => 'קבצי יומן משתמש';
	@override String get description => 'קובצי יומן נוצרים על ידי macOS והיישומים שלה כדי להקליט אירועים ושגיאות. עם הזמן הם יכולים לגדול ולתפוס מקום משמעותי.';
}

// Path: cleanupCategories.languageFiles
class _TranslationsCleanupCategoriesLanguageFilesHe implements TranslationsCleanupCategoriesLanguageFilesEn {
	_TranslationsCleanupCategoriesLanguageFilesHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get name => 'קבצי שפה';
	@override String get description => 'משאבי לוקליזציה שאינם בשימוש המצורפים לאפליקציות. הסרת שפות שאינך משתמש בהן מפנה שטח אחסון מבלי להשפיע על הפונקציונליות.';
}

// Path: cleanupCategories.systemLogs
class _TranslationsCleanupCategoriesSystemLogsHe implements TranslationsCleanupCategoriesSystemLogsEn {
	_TranslationsCleanupCategoriesSystemLogsHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get name => 'קבצי יומן מערכת';
	@override String get description => 'קובצי יומן כלל המערכת שנכתבו על ידי שירותי macOS ודמונים. קבצים אלה בטוחים להסרה מכיוון שהמערכת יוצרת אותם מחדש בעת הצורך.';
}

// Path: cleanupCategories.brokenLoginItems
class _TranslationsCleanupCategoriesBrokenLoginItemsHe implements TranslationsCleanupCategoriesBrokenLoginItemsEn {
	_TranslationsCleanupCategoriesBrokenLoginItemsHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get name => 'פריטי כניסה שבורים';
	@override String get description => 'פריטי כניסה המצביעים על יישומים או קבצים שאינם קיימים עוד בדיסק שלך. הסרתם מזרזת את זמן הכניסה.';
}

// Path: sections.home.features
class _TranslationsSectionsHomeFeaturesHe implements TranslationsSectionsHomeFeaturesEn {
	_TranslationsSectionsHomeFeaturesHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get systemStatus => 'מצב מערכת';
	@override String get storageUsage => 'שימוש באחסון';
	@override String get quickActions => 'פעולות מהירות';
}

// Path: sections.cleanup.features
class _TranslationsSectionsCleanupFeaturesHe implements TranslationsSectionsCleanupFeaturesEn {
	_TranslationsSectionsCleanupFeaturesHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get systemJunk => 'זבל מערכת';
	@override String get userCache => 'מטמון משתמש';
	@override String get tempFiles => 'קבצי זמני';
}

// Path: sections.myClutter.features
class _TranslationsSectionsMyClutterFeaturesHe implements TranslationsSectionsMyClutterFeaturesEn {
	_TranslationsSectionsMyClutterFeaturesHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get largeFiles => 'קבצים גדולים';
	@override String get duplicates => 'כפילויות';
	@override String get largeSimilarImages => 'תמונות דומות גדולות';
}

// Path: sections.spaceView.features
class _TranslationsSectionsSpaceViewFeaturesHe implements TranslationsSectionsSpaceViewFeaturesEn {
	_TranslationsSectionsSpaceViewFeaturesHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get visualStorageMap => 'מפת אחסון ויזואלית';
	@override String get largeFoldersOverview => 'סקירה כללית של תיקיות גדולות';
	@override String get hiddenFilesUncovered => 'קבצים נסתרים נחשפו';
}

// Path: sections.applications.features
class _TranslationsSectionsApplicationsFeaturesHe implements TranslationsSectionsApplicationsFeaturesEn {
	_TranslationsSectionsApplicationsFeaturesHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get appUninstaller => 'מסיר התקנה של אפליקציה';
	@override String get largeApps => 'אפליקציות גדולות';
	@override String get fileLeftovers => 'קובץ שאריות';
}

// Path: sections.myTools.features
class _TranslationsSectionsMyToolsFeaturesHe implements TranslationsSectionsMyToolsFeaturesEn {
	_TranslationsSectionsMyToolsFeaturesHe._(this._root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get targetedScanners => 'סורקים ממוקדים';
	@override String get quickActions => 'פעולות מהירות';
	@override String get liveFiltering => 'סינון חי';
}

/// The flat map containing all translations for locale <he>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsHe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'PristineCleaner',
			'language.label' => 'שָׂפָה',
			'language.english' => 'אַנגְלִית',
			'language.spanish' => 'סְפָרַדִית',
			'language.italian' => 'אִיטַלְקִית',
			'language.french' => 'צָרְפָתִית',
			'language.hebrew' => 'עִברִית',
			'language.greek' => 'יוונית',
			'language.portuguese' => 'פורטוגזית',
			'language.mandarin' => 'מַנדָרִין',
			'navigation.home' => 'בַּיִת',
			'navigation.cleanup' => 'ניקיון',
			'navigation.myClutter' => 'הבלגן שלי',
			'navigation.spaceView' => 'תצוגת חלל',
			'navigation.applications' => 'יישומים',
			'navigation.myTools' => 'הכלים שלי',
			'navigation.myActivity' => 'הפעילות שלי',
			'sections.home.title' => 'בַּיִת',
			'sections.home.subtitle' => 'קבל סקירת בריאות מלאה\nעל המערכת שלך בלחיצה אחת.',
			'sections.home.features.systemStatus' => 'מצב מערכת',
			'sections.home.features.storageUsage' => 'שימוש באחסון',
			'sections.home.features.quickActions' => 'פעולות מהירות',
			'sections.cleanup.title' => 'ניקוי זבל',
			'sections.cleanup.subtitle' => 'נקה את המערכת שלך כדי להשיג\n ביצועים מקסימליים ולהשיב עוד מקום פנוי.',
			'sections.cleanup.features.systemJunk' => 'זבל מערכת',
			'sections.cleanup.features.userCache' => 'מטמון משתמש',
			'sections.cleanup.features.tempFiles' => 'קבצי זמני',
			'sections.myClutter.title' => 'הבלגן שלי',
			'sections.myClutter.subtitle' => 'מיין את הקבצים שלך וצמצם\n את הבלגן בכמה קליקים בלבד.',
			'sections.myClutter.features.largeFiles' => 'קבצים גדולים',
			'sections.myClutter.features.duplicates' => 'כפילויות',
			'sections.myClutter.features.largeSimilarImages' => 'תמונות דומות גדולות',
			'sections.spaceView.title' => 'תצוגת חלל',
			'sections.spaceView.subtitle' => 'דמיין מה תופס הכי הרבה שטח בדיסק ונקה במהירות.',
			'sections.spaceView.features.visualStorageMap' => 'מפת אחסון ויזואלית',
			'sections.spaceView.features.largeFoldersOverview' => 'סקירה כללית של תיקיות גדולות',
			'sections.spaceView.features.hiddenFilesUncovered' => 'קבצים נסתרים נחשפו',
			'sections.applications.title' => 'יישומים',
			'sections.applications.subtitle' => 'קח שליטה על האפליקציות שלך.\nהסר את ההתקנה או הסר שאריות ישנות.',
			'sections.applications.features.appUninstaller' => 'מסיר התקנה של אפליקציה',
			'sections.applications.features.largeApps' => 'אפליקציות גדולות',
			'sections.applications.features.fileLeftovers' => 'קובץ שאריות',
			'sections.myTools.title' => 'הכלים שלי',
			'sections.myTools.subtitle' => 'ערכת הכלים שלך לטיפול ותחזוקה של המערכת.',
			'sections.myTools.features.targetedScanners' => 'סורקים ממוקדים',
			'sections.myTools.features.quickActions' => 'פעולות מהירות',
			'sections.myTools.features.liveFiltering' => 'סינון חי',
			'progress.countingFiles' => 'סופר קבצים...',
			'progress.countingApplications' => 'סופר יישומים...',
			'progress.countingFolders' => 'סופר תיקיות...',
			'errors.itemsFailedToRemove' => '{count} פריטים נכשלו בהסרה.',
			'buttons.scan' => 'לִסְרוֹק',
			'buttons.stop' => 'לְהַפְסִיק',
			'buttons.done' => 'נַעֲשָׂה',
			'buttons.clean' => 'לְנַקוֹת',
			'buttons.cleanUp' => 'לנקות',
			'buttons.close' => 'לִסְגוֹר',
			'buttons.refresh' => 'לְרַעֲנֵן',
			'buttons.rescan' => 'סרוק מחדש',
			'buttons.startOver' => 'התחל מחדש',
			'buttons.selectAll' => 'בחר הכל',
			'buttons.clearSelection' => 'נקה בחירה',
			'buttons.keepScanning' => 'המשך לסרוק',
			'buttons.keepRemoving' => 'תמשיך להסיר',
			'tooltips.search' => 'לְחַפֵּשׂ',
			'tooltips.openInFinder' => 'פתח ב-Finder',
			'dialogs.stopScanningTitle' => 'להפסיק לסרוק?',
			'dialogs.stopScanningMessage' => 'פעולה זו תבטל את הסריקה הנוכחית ותבטל כל התקדמות חלקית.',
			'dialogs.stopRemovalTitle' => 'להפסיק את ההסרה?',
			'dialogs.stopRemovalMessage' => 'הקובץ הנוכחי יסתיים, ואז ידלגו על הקבצים הנותרים.',
			'removal.barrierLabel' => 'התקדמות ההסרה',
			'removal.preparing' => 'עֲרִיכָה...',
			'removal.removingFrom' => 'מסיר מ{title}',
			'removal.stoppingAfterCurrentFile' => 'מפסיק אחרי הקובץ הנוכחי...',
			'removal.keepWindowOpen' => 'אנא השאר חלון זה פתוח בזמן שההסרה פועלת.',
			'removal.processedSummary' => '{processed} מתוך {total} עובד',
			'removal.deletedFreed' => '{deleted} נמחק • {bytes} שוחרר',
			'removal.currentItem' => 'נוכחי: {name}',
			'removal.stopping' => 'סְתִימָה...',
			'removal.removalFailed' => 'ההסרה נכשלה',
			'removal.removalFailedDetails' => 'משהו השתבש במהלך הסרת הקבצים שנבחרו.',
			'removal.removalStopped' => 'ההסרה הופסקה',
			'removal.removalComplete' => 'ההסרה הושלמה',
			'removal.deletedSummary' => '{title} נמחקו {count} פריטים',
			'removal.freedSummary' => '{bytes} משוחרר',
			'removal.failedToRemoveSummary' => '{count} פריטים נכשלו בהסרה.',
			'removal.deletedFiles' => 'קבצים שנמחקו',
			'removal.noFilesDeleted' => 'לא נמחקו קבצים.',
			'done.allCleanedTitle' => 'הכל ניקה!',
			'done.movedToTrashMessage' => 'הקבצים שנבחרו הועברו לאשפה.',
			'done.applicationsRemovedTitle' => 'אפליקציות הוסרו!',
			'done.appsMovedToTrashMessage' => 'אפליקציות נבחרות הועברו לאשפה.',
			'cleanupManager.title' => 'מנהל ניקיון',
			'cleanupManager.systemJunkHeader' => 'זבל מערכת',
			'cleanupManager.systemJunkDescription' => 'קבצים מיותרים שסותמים את אחסון המכשיר ופוגעים בביצועים אופטימליים.',
			'cleanupManager.selectLabel' => 'לִבחוֹר',
			'cleanupManager.selectAllOption' => 'כֹּל',
			'cleanupManager.selectNoneOption' => 'אַף לֹא אֶחָד',
			'cleanupManager.noItems' => 'אין פריטים',
			'cleanupManager.noItemsFound' => 'לא נמצאו פריטים',
			'cleanupManager.itemsSelected' => 'נבחרו {count} פריטים',
			'projectDirectory.chooseFolder' => 'בחר תיקייה...',
			'projectDirectory.chooseProjectDirectory' => 'בחר את ספריית הפרויקט',
			'projectDirectory.chooseParentFolder' => 'בחר תיקיית אב',
			'projectDirectory.noFolder' => 'אין תיקיה',
			'searchAndSort.searchHint' => 'לְחַפֵּשׂ...',
			'searchAndSort.sortBy' => 'מיין לפי',
			'searchAndSort.size' => 'גוֹדֶל',
			'searchAndSort.name' => 'שֵׁם',
			'searchAndSort.ascending' => 'עוֹלֶה',
			'searchAndSort.descending' => 'יורד',
			'spaceView.noFoldersFound' => 'לא נמצאו תיקיות לרמה זו',
			'spaceView.noBubblesToRender' => 'אין בועות לעיבוד',
			'spaceView.otherItems' => 'פריטים אחרים',
			'home.refresh' => 'לְרַעֲנֵן',
			'home.unableToReadDiskInfo' => 'לא ניתן לקרוא מידע על הדיסק',
			'home.totalStorage' => 'אחסון כולל',
			'home.used' => 'מְשׁוּמָשׁ',
			'home.available' => 'זָמִין',
			'home.percentUsed' => '{percent}% בשימוש',
			'home.cpuUsage' => 'שימוש במעבד',
			'home.ramUsage' => 'שימוש בזיכרון RAM',
			'home.memoryPercentUsed' => '{percent}% RAM בשימוש',
			'home.unableToReadSystemInfo' => 'לא ניתן לקרוא את פרטי המערכת',
			'myToolsPage.title' => 'הכלים שלי',
			'myToolsPage.subtitle' => 'הכלים שלך לשמירה על ה-Mac שלך נקי, בטוח ופועל בצורה חלקה.',
			'myToolsPage.backToTools' => 'חזרה לכלים',
			'myToolsMessages.itemsWithSize' => '{count} פריטים • {size}',
			'myToolsMessages.scanCancelled' => 'הסריקה בוטלה.',
			'myToolsMessages.selectAtLeastOne' => 'בחר לפחות פריט אחד לניקוי.',
			'myToolsMessages.failedToClean' => 'נכשל ניקוי {count} פריטים.',
			'myToolsMessages.everythingSelectedCleaned' => 'כל מה שנבחר נוקה.',
			'myToolsMessages.cleanupUpdated' => 'הניקוי עודכן.',
			'myToolsMessages.cleanedCount' => 'ניקה {count} פריט(ים).',
			'myToolsMessages.stoppedPrefix' => 'נֶעצָר.',
			'myToolsMessages.removedCount' => 'הוסרו {count} פריטים.',
			'myToolsMessages.failedCountShort' => '{count} נכשל.',
			'myToolsMessages.scanComplete' => 'הסריקה הושלמה.',
			'myToolsMessages.somethingWentWrong' => 'משהו השתבש.',
			'myToolsMessages.fallback.downloadsTidy' => 'ההורדות מסודרות.',
			'myToolsMessages.fallback.noOversizedStale' => 'לא נמצאו קבצים מיושנים גדולים מדי.',
			'myToolsMessages.fallback.noRecentDuplicates' => 'לא נמצאו כפילויות אחרונות.',
			'myToolsMessages.fallback.noSimilarLargeImages' => 'לא נמצאו תמונות גדולות דומות.',
			'myToolsMessages.fallback.noAppLeftovers' => 'לא נמצאו שאריות אפליקציה שניתנות להסרה.',
			'myToolsMessages.fallback.noStaleApps' => 'לא נמצאו יישומים מיושנים.',
			'myToolsMessages.fallback.appsNeedReview' => 'נמצאו יישומים שעשויים להזדקק לבדיקה.',
			'myToolsMessages.fallback.noSystemJunkCandidates' => 'אין מועמדים לניקוי בזבל של המערכת.',
			'myToolsMessages.fallback.noBrokenStartup' => 'לא נמצאו ערכי הפעלה/רקע שבורים.',
			'myToolsMessages.fallback.noBackgroundItems' => 'לא נמצאו פריטי רקע.',
			'myToolsMessages.fallback.noPrivacyTraces' => 'לא נמצאו עקבות פרטיות במיקומים ידועים.',
			'myToolsMessages.fallback.trashAlreadyEmpty' => 'האשפה כבר ריקה.',
			'myToolsMessages.fallback.noPermissionCache' => 'לא נמצאו קבצי מטמון הרשאות.',
			'myToolsMessages.fallback.noTimeMachineSnapshots' => 'לא נמצאו צילומי מצב מקומיים של Time Machine.',
			'myToolsMessages.fallback.noMaintenanceCandidates' => 'לא נמצאו מועמדים לתחזוקה.',
			'myToolsMessages.fallback.noMailAttachments' => 'לא נמצאו קבצי דואר ניתנים להסרה.',
			'myToolsMessages.fallback.noSuspiciousFiles' => 'לא זוהו קבצים חשודים.',
			'myToolsCatalog.appLeftovers.title' => 'שאריות אפליקציה',
			'myToolsCatalog.appLeftovers.description' => 'אתר והסר שאריות אפליקציה גם אם האפליקציה הראשית כבר נעלמה.',
			'myToolsCatalog.backgroundItems.title' => 'פריטי רקע',
			'myToolsCatalog.backgroundItems.description' => 'נהל אפליקציות ותהליכים ברקע הפועלים ב-Mac שלך.',
			'myToolsCatalog.downloads.title' => 'הורדות',
			'myToolsCatalog.downloads.description' => 'סקור ונקה קבצי שימוש חד פעמי מהורדות כדי לשמור על תיקיות מסודרות.',
			'myToolsCatalog.largeOld.title' => 'קבצים גדולים וישנים',
			'myToolsCatalog.largeOld.description' => 'מצא והסר קבצים גדולים שאינם בשימוש שתופסים מקום ב-Mac שלך.',
			'myToolsCatalog.appUpdater.title' => 'עדכון אפליקציות',
			'myToolsCatalog.appUpdater.description' => 'שים לב לגרסאות העדכניות והאמינות ביותר של היישומים שלך.',
			'myToolsCatalog.similarImages.title' => 'תמונות דומות',
			'myToolsCatalog.similarImages.description' => 'סקור תמונות דומות ושמור רק את הטובות ביותר.',
			'myToolsCatalog.privacyItems.title' => 'פריטי פרטיות',
			'myToolsCatalog.privacyItems.description' => 'הסר היסטוריית גלישה ועקבות פעילות כדי להגן על הפרטיות שלך.',
			'myToolsCatalog.trashBins.title' => 'פחי אשפה',
			'myToolsCatalog.trashBins.description' => 'רוקן את כל פחי האשפה הזמינים ב-Mac שלך.',
			'myToolsCatalog.duplicateFinder.title' => 'כפיל Finder',
			'myToolsCatalog.duplicateFinder.description' => 'הסר קבצים כפולים המאוחסנים במיקומים שונים ב-Mac שלך.',
			'myToolsCatalog.applicationPermissions.title' => 'הרשאות אפליקציה',
			'myToolsCatalog.applicationPermissions.description' => 'נהל כיצד יישומים ניגשים לתכונות המערכת, התקנים ופונקציונליות.',
			'myToolsCatalog.systemJunk.title' => 'זבל מערכת',
			'myToolsCatalog.systemJunk.description' => 'הסר קבצים מיותרים שסותמים את אחסון המכשיר ופוגעים בביצועים אופטימליים.',
			'myToolsCatalog.timeMachineSnapshot.title' => 'תמונת מצב של מכונת זמן',
			'myToolsCatalog.timeMachineSnapshot.description' => 'הסר תמונות מקומיות של Time Machine מבלי להשפיע על הגיבויים שלך.',
			'myToolsCatalog.maintenanceTasks.title' => 'משימות תחזוקה',
			'myToolsCatalog.maintenanceTasks.description' => 'הפעל קבוצה של משימות תחזוקה מומלצות כדי להביא את ה-Mac שלך למקסימום.',
			'myToolsCatalog.loginItems.title' => 'פריטי כניסה',
			'myToolsCatalog.loginItems.description' => 'נהל אפליקציות שנפתחות אוטומטית כשאתה מפעיל את ה-Mac שלך.',
			'myToolsCatalog.mailAttachments.title' => 'קבצים מצורפים לדואר',
			'myToolsCatalog.mailAttachments.description' => 'הסר קבצים מצורפים לאימייל המאוחסנים מקומית כדי לפנות מקום תוך שמירה על קבצים ששונו.',
			'myToolsCatalog.malwareFinder.title' => 'מאתר תוכנות זדוניות',
			'myToolsCatalog.malwareFinder.description' => 'זהה והסר פריטים זדוניים כדי לשמור על אבטחת ה-Mac שלך.',
			'myToolsCatalog.uninstaller.title' => 'מסיר התקנה',
			'myToolsCatalog.uninstaller.description' => 'הסר כהלכה יישומים שלמים עם כל הקבצים הקשורים.',
			'cleanupCategories.userCache.name' => 'קבצי מטמון משתמש',
			'cleanupCategories.userCache.description' => 'במקור נועדו לשפר את זמני האתחול, קבצי המטמון של היישומים שלך מצטברים בסופו של דבר וגורמים לתפקוד לא תקין או לירידה כללית בביצועים.',
			'cleanupCategories.userLogs.name' => 'קבצי יומן משתמש',
			'cleanupCategories.userLogs.description' => 'קובצי יומן נוצרים על ידי macOS והיישומים שלה כדי להקליט אירועים ושגיאות. עם הזמן הם יכולים לגדול ולתפוס מקום משמעותי.',
			'cleanupCategories.languageFiles.name' => 'קבצי שפה',
			'cleanupCategories.languageFiles.description' => 'משאבי לוקליזציה שאינם בשימוש המצורפים לאפליקציות. הסרת שפות שאינך משתמש בהן מפנה שטח אחסון מבלי להשפיע על הפונקציונליות.',
			'cleanupCategories.systemLogs.name' => 'קבצי יומן מערכת',
			'cleanupCategories.systemLogs.description' => 'קובצי יומן כלל המערכת שנכתבו על ידי שירותי macOS ודמונים. קבצים אלה בטוחים להסרה מכיוון שהמערכת יוצרת אותם מחדש בעת הצורך.',
			'cleanupCategories.brokenLoginItems.name' => 'פריטי כניסה שבורים',
			'cleanupCategories.brokenLoginItems.description' => 'פריטי כניסה המצביעים על יישומים או קבצים שאינם קיימים עוד בדיסק שלך. הסרתם מזרזת את זמן הכניסה.',
			'myClutterDashboard.backToCategories' => 'חזרה לקטגוריות',
			'myClutterDashboard.filesToSort' => 'יש לך {count} קבצים למיין.',
			'myClutterDashboard.quickRecommendations' => 'השתמש בהמלצות מהירות או עיין בהן ביד.',
			'myClutterDashboard.reviewAllFiles' => 'סקור את כל הקבצים',
			'myClutterDashboard.freshDuplicatesFound' => '{count} נמצאו כפילויות טריות',
			'myClutterDashboard.noDuplicates' => 'לא נמצאו כפילויות בסריקה זו.',
			'myClutterDashboard.removeDuplicateBytes' => 'הסר {bytes} של קבצים כפולים.',
			'myClutterDashboard.largeSimilarImagesFound' => '{count} נמצאו תמונות דומות גדולות',
			'myClutterDashboard.noSimilarGroups' => 'לא נמצאו קבוצות תמונות דומות.',
			'myClutterDashboard.nearlyIdenticalImages' => 'יש {bytes} של תמונות כמעט זהות.',
			'myClutterDashboard.largeFilesFound' => 'נמצאו {bytes} של קבצים גדולים',
			'myClutterDashboard.noLargeFiles' => 'לא נמצאו קבצים גדולים.',
			'myClutterDashboard.largeFilesReady' => '{count} קבצים גדולים מוכנים לבדיקה.',
			'myClutterDashboard.review' => 'סְקִירָה',
			'scanResults.itemsSummary' => '{count} פריטים • {size}',
			'scanResults.scannedInMs' => 'נסרק תוך {ms}ms',
			'scanResults.deselectAll' => 'בטל את הבחירה בהכל',
			'scanResults.selectAll' => 'בחר הכל',
			'scanResults.noItemsMatchSearch' => 'אין פריטים שתואמים לחיפוש שלך',
			'scanResults.noItemsFound' => 'לא נמצאו פריטים',
			'scanResults.itemsSelected' => 'נבחרו {count} פריטים',
			'scanResults.rescan' => 'סרוק מחדש',
			'spaceViewStart.subtitle' => 'בחר תיקיית אב ולאחר מכן סרוק כדי למפות את מה שתופס הכי הרבה מקום.',
			'spaceViewStart.defaultRootPath' => 'נתיב שורש ברירת המחדל הוא הכונן הקשיח הראשי שלך',
			'spaceViewStart.exploreBubbles' => 'חקור גדלי תיקיות באמצעות בועות אינטראקטיביות',
			'spaceViewStart.clickToDrillDown' => 'לחץ על תיקיות כדי להתעמק ולבדוק לעומק',
			'shell.comingSoon' => 'בקרוב',
			'myToolsService.snapshotName' => 'תמונת מצב {id}',
			'myToolsService.timeMachineGroup' => 'מכונת זמן',
			'myToolsService.timeMachineMacOnly' => 'צילומי מצב של Time Machine זמינים רק ב-macOS.',
			_ => null,
		};
	}
}
