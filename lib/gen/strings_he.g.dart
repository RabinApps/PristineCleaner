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
class TranslationsHe extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsHe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.he,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <he>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsHe _root = this; // ignore: unused_field

	@override 
	TranslationsHe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHe(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$he app = _Translations$app$he._(_root);
	@override late final _Translations$language$he language = _Translations$language$he._(_root);
	@override late final _Translations$navigation$he navigation = _Translations$navigation$he._(_root);
	@override late final _Translations$settings$he settings = _Translations$settings$he._(_root);
	@override late final _Translations$sections$he sections = _Translations$sections$he._(_root);
	@override late final _Translations$progress$he progress = _Translations$progress$he._(_root);
	@override late final _Translations$errors$he errors = _Translations$errors$he._(_root);
	@override late final _Translations$buttons$he buttons = _Translations$buttons$he._(_root);
	@override late final _Translations$tooltips$he tooltips = _Translations$tooltips$he._(_root);
	@override late final _Translations$dialogs$he dialogs = _Translations$dialogs$he._(_root);
	@override late final _Translations$removal$he removal = _Translations$removal$he._(_root);
	@override late final _Translations$done$he done = _Translations$done$he._(_root);
	@override late final _Translations$donate$he donate = _Translations$donate$he._(_root);
	@override late final _Translations$cleanupManager$he cleanupManager = _Translations$cleanupManager$he._(_root);
	@override late final _Translations$projectDirectory$he projectDirectory = _Translations$projectDirectory$he._(_root);
	@override late final _Translations$searchAndSort$he searchAndSort = _Translations$searchAndSort$he._(_root);
	@override late final _Translations$spaceView$he spaceView = _Translations$spaceView$he._(_root);
	@override late final _Translations$home$he home = _Translations$home$he._(_root);
	@override late final _Translations$myToolsPage$he myToolsPage = _Translations$myToolsPage$he._(_root);
	@override late final _Translations$myToolsMessages$he myToolsMessages = _Translations$myToolsMessages$he._(_root);
	@override late final _Translations$myToolsCatalog$he myToolsCatalog = _Translations$myToolsCatalog$he._(_root);
	@override late final _Translations$cleanupCategories$he cleanupCategories = _Translations$cleanupCategories$he._(_root);
	@override late final _Translations$myClutterDashboard$he myClutterDashboard = _Translations$myClutterDashboard$he._(_root);
	@override late final _Translations$scanResults$he scanResults = _Translations$scanResults$he._(_root);
	@override late final _Translations$spaceViewStart$he spaceViewStart = _Translations$spaceViewStart$he._(_root);
	@override late final _Translations$shell$he shell = _Translations$shell$he._(_root);
	@override late final _Translations$myToolsService$he myToolsService = _Translations$myToolsService$he._(_root);
}

// Path: app
class _Translations$app$he extends Translations$app$en {
	_Translations$app$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'PristineCleaner';
}

// Path: language
class _Translations$language$he extends Translations$language$en {
	_Translations$language$he._(TranslationsHe root) : this._root = root, super.internal(root);

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
class _Translations$navigation$he extends Translations$navigation$en {
	_Translations$navigation$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get home => 'בַּיִת';
	@override String get cleanup => 'ניקיון';
	@override String get myClutter => 'הבלגן שלי';
	@override String get spaceView => 'תצוגת חלל';
	@override String get applications => 'יישומים';
	@override String get myTools => 'הכלים שלי';
	@override String get donate => 'תרומה';
	@override String get settings => 'הגדרות';
}

// Path: settings
class _Translations$settings$he extends Translations$settings$en {
	_Translations$settings$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הגדרות';
	@override String get subtitle => 'התאם את PristineCleaner לדרך העבודה שלך.';
	@override String get sectionLanguage => 'שפה';
	@override String get sectionUpdates => 'עדכונים';
	@override String get sectionBehavior => 'התנהגות';
	@override String get autoCheckUpdates => 'בדוק עדכונים בעת ההפעלה';
	@override String get autoCheckUpdatesSub => 'חפש גרסאות חדשות אוטומטית עם פתיחת האפליקציה.';
	@override String get checkForUpdates => 'בדוק עדכונים';
	@override String get launchAtLogin => 'הפעל בעת הכניסה';
	@override String get launchAtLoginSub => 'פתח את PristineCleaner אוטומטית בעת הכניסה למחשב.';
	@override String get confirmBeforeRemoving => 'אשר לפני הסרה';
	@override String get confirmBeforeRemovingSub => 'הצג חלון אישור לפני הסרת קבצים.';
}

// Path: sections
class _Translations$sections$he extends Translations$sections$en {
	_Translations$sections$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sections$home$he home = _Translations$sections$home$he._(_root);
	@override late final _Translations$sections$cleanup$he cleanup = _Translations$sections$cleanup$he._(_root);
	@override late final _Translations$sections$myClutter$he myClutter = _Translations$sections$myClutter$he._(_root);
	@override late final _Translations$sections$spaceView$he spaceView = _Translations$sections$spaceView$he._(_root);
	@override late final _Translations$sections$applications$he applications = _Translations$sections$applications$he._(_root);
	@override late final _Translations$sections$myTools$he myTools = _Translations$sections$myTools$he._(_root);
}

// Path: progress
class _Translations$progress$he extends Translations$progress$en {
	_Translations$progress$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get countingFiles => 'סופר קבצים...';
	@override String get countingApplications => 'סופר יישומים...';
	@override String get countingFolders => 'סופר תיקיות...';
}

// Path: errors
class _Translations$errors$he extends Translations$errors$en {
	_Translations$errors$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get itemsFailedToRemove => '{count} פריטים נכשלו בהסרה.';
}

// Path: buttons
class _Translations$buttons$he extends Translations$buttons$en {
	_Translations$buttons$he._(TranslationsHe root) : this._root = root, super.internal(root);

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
class _Translations$tooltips$he extends Translations$tooltips$en {
	_Translations$tooltips$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get search => 'לְחַפֵּשׂ';
	@override String get openInFinder => 'פתח ב-Finder';
}

// Path: dialogs
class _Translations$dialogs$he extends Translations$dialogs$en {
	_Translations$dialogs$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get stopScanningTitle => 'להפסיק לסרוק?';
	@override String get stopScanningMessage => 'פעולה זו תבטל את הסריקה הנוכחית ותבטל כל התקדמות חלקית.';
	@override String get exitConfirmationTitle => 'אשר יציאה';
	@override String get exitConfirmationMessage => 'סריקה מתבצעת כעת. האם אתה בטוח שברצונך לצאת?';
	@override String get exitConfirmationWait => 'המתן';
	@override String get exitConfirmationQuit => 'צא בכל מקרה';
	@override String get stopRemovalTitle => 'להפסיק את ההסרה?';
	@override String get stopRemovalMessage => 'הקובץ הנוכחי יסתיים, ואז ידלגו על הקבצים הנותרים.';
	@override String get confirmRemovalTitle => 'להסיר את הפריטים שנבחרו?';
	@override String get confirmRemovalMessage => '{count} פריטים יועברו לאשפה.';
	@override String get confirmRemovalMessagePermanent => '{count} פריטים יימחקו לצמיתות. לא ניתן לבטל פעולה זו.';
	@override String get confirmRemovalCancel => 'ביטול';
	@override String get confirmRemovalConfirm => 'הסר';
}

// Path: removal
class _Translations$removal$he extends Translations$removal$en {
	_Translations$removal$he._(TranslationsHe root) : this._root = root, super.internal(root);

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
class _Translations$done$he extends Translations$done$en {
	_Translations$done$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get allCleanedTitle => 'הכל ניקה!';
	@override String get movedToTrashMessage => 'הקבצים שנבחרו הועברו לאשפה.';
	@override String get applicationsRemovedTitle => 'אפליקציות הוסרו!';
	@override String get appsMovedToTrashMessage => 'אפליקציות נבחרות הועברו לאשפה.';
}

// Path: donate
class _Translations$donate$he extends Translations$donate$en {
	_Translations$donate$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'תמכו ב-PristineCleaner';
	@override String get subtitle => 'אם PristineCleaner עוזר לכם לשמור על המערכת נקיה, אפשר לתמוך בפיתוח עם תרומה קטנה.';
	@override String get buyMeACoffee => 'Buy Me a Coffee';
	@override String get paypalDonate => 'תרומה באמצעות PayPal';
	@override String get openLinkFailed => 'לא ניתן לפתוח את קישור התרומה.';
}

// Path: cleanupManager
class _Translations$cleanupManager$he extends Translations$cleanupManager$en {
	_Translations$cleanupManager$he._(TranslationsHe root) : this._root = root, super.internal(root);

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
class _Translations$projectDirectory$he extends Translations$projectDirectory$en {
	_Translations$projectDirectory$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get chooseFolder => 'בחר תיקייה...';
	@override String get chooseProjectDirectory => 'בחר את ספריית הפרויקט';
	@override String get chooseParentFolder => 'בחר תיקיית אב';
	@override String get noFolder => 'אין תיקיה';
}

// Path: searchAndSort
class _Translations$searchAndSort$he extends Translations$searchAndSort$en {
	_Translations$searchAndSort$he._(TranslationsHe root) : this._root = root, super.internal(root);

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
class _Translations$spaceView$he extends Translations$spaceView$en {
	_Translations$spaceView$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get noFoldersFound => 'לא נמצאו תיקיות לרמה זו';
	@override String get noBubblesToRender => 'אין בועות לעיבוד';
	@override String get otherItems => 'פריטים אחרים';
}

// Path: home
class _Translations$home$he extends Translations$home$en {
	_Translations$home$he._(TranslationsHe root) : this._root = root, super.internal(root);

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
class _Translations$myToolsPage$he extends Translations$myToolsPage$en {
	_Translations$myToolsPage$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הכלים שלי';
	@override String get subtitle => 'הכלים שלך לשמירה על ה-Mac שלך נקי, בטוח ופועל בצורה חלקה.';
	@override String get backToTools => 'חזרה לכלים';
}

// Path: myToolsMessages
class _Translations$myToolsMessages$he extends Translations$myToolsMessages$en {
	_Translations$myToolsMessages$he._(TranslationsHe root) : this._root = root, super.internal(root);

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
	@override late final _Translations$myToolsMessages$fallback$he fallback = _Translations$myToolsMessages$fallback$he._(_root);
}

// Path: myToolsCatalog
class _Translations$myToolsCatalog$he extends Translations$myToolsCatalog$en {
	_Translations$myToolsCatalog$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final _Translations$myToolsCatalog$appLeftovers$he appLeftovers = _Translations$myToolsCatalog$appLeftovers$he._(_root);
	@override late final _Translations$myToolsCatalog$backgroundItems$he backgroundItems = _Translations$myToolsCatalog$backgroundItems$he._(_root);
	@override late final _Translations$myToolsCatalog$downloads$he downloads = _Translations$myToolsCatalog$downloads$he._(_root);
	@override late final _Translations$myToolsCatalog$largeOld$he largeOld = _Translations$myToolsCatalog$largeOld$he._(_root);
	@override late final _Translations$myToolsCatalog$similarImages$he similarImages = _Translations$myToolsCatalog$similarImages$he._(_root);
	@override late final _Translations$myToolsCatalog$trashBins$he trashBins = _Translations$myToolsCatalog$trashBins$he._(_root);
	@override late final _Translations$myToolsCatalog$duplicateFinder$he duplicateFinder = _Translations$myToolsCatalog$duplicateFinder$he._(_root);
	@override late final _Translations$myToolsCatalog$applicationPermissions$he applicationPermissions = _Translations$myToolsCatalog$applicationPermissions$he._(_root);
	@override late final _Translations$myToolsCatalog$systemJunk$he systemJunk = _Translations$myToolsCatalog$systemJunk$he._(_root);
	@override late final _Translations$myToolsCatalog$timeMachineSnapshot$he timeMachineSnapshot = _Translations$myToolsCatalog$timeMachineSnapshot$he._(_root);
	@override late final _Translations$myToolsCatalog$loginItems$he loginItems = _Translations$myToolsCatalog$loginItems$he._(_root);
	@override late final _Translations$myToolsCatalog$mailAttachments$he mailAttachments = _Translations$myToolsCatalog$mailAttachments$he._(_root);
	@override late final _Translations$myToolsCatalog$malwareFinder$he malwareFinder = _Translations$myToolsCatalog$malwareFinder$he._(_root);
	@override late final _Translations$myToolsCatalog$uninstaller$he uninstaller = _Translations$myToolsCatalog$uninstaller$he._(_root);
}

// Path: cleanupCategories
class _Translations$cleanupCategories$he extends Translations$cleanupCategories$en {
	_Translations$cleanupCategories$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final _Translations$cleanupCategories$userCache$he userCache = _Translations$cleanupCategories$userCache$he._(_root);
	@override late final _Translations$cleanupCategories$userLogs$he userLogs = _Translations$cleanupCategories$userLogs$he._(_root);
	@override late final _Translations$cleanupCategories$languageFiles$he languageFiles = _Translations$cleanupCategories$languageFiles$he._(_root);
	@override late final _Translations$cleanupCategories$systemLogs$he systemLogs = _Translations$cleanupCategories$systemLogs$he._(_root);
	@override late final _Translations$cleanupCategories$brokenLoginItems$he brokenLoginItems = _Translations$cleanupCategories$brokenLoginItems$he._(_root);
}

// Path: myClutterDashboard
class _Translations$myClutterDashboard$he extends Translations$myClutterDashboard$en {
	_Translations$myClutterDashboard$he._(TranslationsHe root) : this._root = root, super.internal(root);

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
class _Translations$scanResults$he extends Translations$scanResults$en {
	_Translations$scanResults$he._(TranslationsHe root) : this._root = root, super.internal(root);

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
class _Translations$spaceViewStart$he extends Translations$spaceViewStart$en {
	_Translations$spaceViewStart$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get subtitle => 'בחר תיקיית אב ולאחר מכן סרוק כדי למפות את מה שתופס הכי הרבה מקום.';
	@override String get defaultRootPath => 'נתיב שורש ברירת המחדל הוא הכונן הקשיח הראשי שלך';
	@override String get exploreBubbles => 'חקור גדלי תיקיות באמצעות בועות אינטראקטיביות';
	@override String get clickToDrillDown => 'לחץ על תיקיות כדי להתעמק ולבדוק לעומק';
}

// Path: shell
class _Translations$shell$he extends Translations$shell$en {
	_Translations$shell$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get comingSoon => 'בקרוב';
}

// Path: myToolsService
class _Translations$myToolsService$he extends Translations$myToolsService$en {
	_Translations$myToolsService$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get snapshotName => 'תמונת מצב {id}';
	@override String get timeMachineGroup => 'מכונת זמן';
	@override String get timeMachineMacOnly => 'צילומי מצב של Time Machine זמינים רק ב-macOS.';
}

// Path: sections.home
class _Translations$sections$home$he extends Translations$sections$home$en {
	_Translations$sections$home$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'בַּיִת';
	@override String get subtitle => 'ראה את הסימנים החיוניים של המחשב שלך במבט חטוף\nותפוס בעיות לפני שהם גדלים.';
	@override late final _Translations$sections$home$features$he features = _Translations$sections$home$features$he._(_root);
}

// Path: sections.cleanup
class _Translations$sections$cleanup$he extends Translations$sections$cleanup$en {
	_Translations$sections$cleanup$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'ניקוי זבל';
	@override String get subtitle => 'לטאטא שאריות דיגיטליות כדי לשחזר\nמהירות, יציבות ושטח פנוי יקר.';
	@override late final _Translations$sections$cleanup$features$he features = _Translations$sections$cleanup$features$he._(_root);
}

// Path: sections.myClutter
class _Translations$sections$myClutter$he extends Translations$sections$myClutter$en {
	_Translations$sections$myClutter$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הבלגן שלי';
	@override String get subtitle => 'הפוך תיקיות כאוטיות להחלטות ברורות\nעם ניקוי מודרך תוך דקות.';
	@override late final _Translations$sections$myClutter$features$he features = _Translations$sections$myClutter$features$he._(_root);
}

// Path: sections.spaceView
class _Translations$sections$spaceView$he extends Translations$sections$spaceView$en {
	_Translations$sections$spaceView$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'תצוגת חלל';
	@override String get subtitle => 'מפה את הדיסק שלך באופן ויזואלי כדי לזהות את\nהחשוב ביותר ולפנות מקום מהר יותר.';
	@override late final _Translations$sections$spaceView$features$he features = _Translations$sections$spaceView$features$he._(_root);
}

// Path: sections.applications
class _Translations$sections$applications$he extends Translations$sections$applications$en {
	_Translations$sections$applications$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'יישומים';
	@override String get subtitle => 'השתלט על טביעת הרגל של האפליקציה שלך.\nהסר את ההתקנה בצורה נקייה והסר שאריות שנשכחו.';
	@override late final _Translations$sections$applications$features$he features = _Translations$sections$applications$features$he._(_root);
}

// Path: sections.myTools
class _Translations$sections$myTools$he extends Translations$sections$myTools$en {
	_Translations$sections$myTools$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הכלים שלי';
	@override String get subtitle => 'ערכת הכלים שלך לטיפול ותחזוקה של המערכת.';
	@override late final _Translations$sections$myTools$features$he features = _Translations$sections$myTools$features$he._(_root);
}

// Path: myToolsMessages.fallback
class _Translations$myToolsMessages$fallback$he extends Translations$myToolsMessages$fallback$en {
	_Translations$myToolsMessages$fallback$he._(TranslationsHe root) : this._root = root, super.internal(root);

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
class _Translations$myToolsCatalog$appLeftovers$he extends Translations$myToolsCatalog$appLeftovers$en {
	_Translations$myToolsCatalog$appLeftovers$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'שאריות אפליקציה';
	@override String get description => 'אתר והסר שאריות אפליקציה גם אם האפליקציה הראשית כבר נעלמה.';
}

// Path: myToolsCatalog.backgroundItems
class _Translations$myToolsCatalog$backgroundItems$he extends Translations$myToolsCatalog$backgroundItems$en {
	_Translations$myToolsCatalog$backgroundItems$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'פריטי רקע';
	@override String get description => 'נהל אפליקציות ותהליכים ברקע הפועלים ב-Mac שלך.';
}

// Path: myToolsCatalog.downloads
class _Translations$myToolsCatalog$downloads$he extends Translations$myToolsCatalog$downloads$en {
	_Translations$myToolsCatalog$downloads$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הורדות';
	@override String get description => 'סקור ונקה קבצי שימוש חד פעמי מהורדות כדי לשמור על תיקיות מסודרות.';
}

// Path: myToolsCatalog.largeOld
class _Translations$myToolsCatalog$largeOld$he extends Translations$myToolsCatalog$largeOld$en {
	_Translations$myToolsCatalog$largeOld$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'קבצים גדולים וישנים';
	@override String get description => 'מצא והסר קבצים גדולים שאינם בשימוש שתופסים מקום ב-Mac שלך.';
}

// Path: myToolsCatalog.similarImages
class _Translations$myToolsCatalog$similarImages$he extends Translations$myToolsCatalog$similarImages$en {
	_Translations$myToolsCatalog$similarImages$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'תמונות דומות';
	@override String get description => 'סקור תמונות דומות ושמור רק את הטובות ביותר.';
}

// Path: myToolsCatalog.trashBins
class _Translations$myToolsCatalog$trashBins$he extends Translations$myToolsCatalog$trashBins$en {
	_Translations$myToolsCatalog$trashBins$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'פחי אשפה';
	@override String get description => 'רוקן את כל פחי האשפה הזמינים ב-Mac שלך.';
}

// Path: myToolsCatalog.duplicateFinder
class _Translations$myToolsCatalog$duplicateFinder$he extends Translations$myToolsCatalog$duplicateFinder$en {
	_Translations$myToolsCatalog$duplicateFinder$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'כפיל Finder';
	@override String get description => 'הסר קבצים כפולים המאוחסנים במיקומים שונים ב-Mac שלך.';
}

// Path: myToolsCatalog.applicationPermissions
class _Translations$myToolsCatalog$applicationPermissions$he extends Translations$myToolsCatalog$applicationPermissions$en {
	_Translations$myToolsCatalog$applicationPermissions$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הרשאות אפליקציה';
	@override String get description => 'נהל כיצד יישומים ניגשים לתכונות המערכת, התקנים ופונקציונליות.';
}

// Path: myToolsCatalog.systemJunk
class _Translations$myToolsCatalog$systemJunk$he extends Translations$myToolsCatalog$systemJunk$en {
	_Translations$myToolsCatalog$systemJunk$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'זבל מערכת';
	@override String get description => 'הסר קבצים מיותרים שסותמים את אחסון המכשיר ופוגעים בביצועים אופטימליים.';
}

// Path: myToolsCatalog.timeMachineSnapshot
class _Translations$myToolsCatalog$timeMachineSnapshot$he extends Translations$myToolsCatalog$timeMachineSnapshot$en {
	_Translations$myToolsCatalog$timeMachineSnapshot$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'תמונת מצב של מכונת זמן';
	@override String get description => 'הסר תמונות מקומיות של Time Machine מבלי להשפיע על הגיבויים שלך.';
}

// Path: myToolsCatalog.loginItems
class _Translations$myToolsCatalog$loginItems$he extends Translations$myToolsCatalog$loginItems$en {
	_Translations$myToolsCatalog$loginItems$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'פריטי כניסה';
	@override String get description => 'נהל אפליקציות שנפתחות אוטומטית כשאתה מפעיל את ה-Mac שלך.';
}

// Path: myToolsCatalog.mailAttachments
class _Translations$myToolsCatalog$mailAttachments$he extends Translations$myToolsCatalog$mailAttachments$en {
	_Translations$myToolsCatalog$mailAttachments$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'קבצים מצורפים לדואר';
	@override String get description => 'הסר קבצים מצורפים לאימייל המאוחסנים מקומית כדי לפנות מקום תוך שמירה על קבצים ששונו.';
}

// Path: myToolsCatalog.malwareFinder
class _Translations$myToolsCatalog$malwareFinder$he extends Translations$myToolsCatalog$malwareFinder$en {
	_Translations$myToolsCatalog$malwareFinder$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'מאתר תוכנות זדוניות';
	@override String get description => 'זהה והסר פריטים זדוניים כדי לשמור על אבטחת ה-Mac שלך.';
}

// Path: myToolsCatalog.uninstaller
class _Translations$myToolsCatalog$uninstaller$he extends Translations$myToolsCatalog$uninstaller$en {
	_Translations$myToolsCatalog$uninstaller$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'מסיר התקנה';
	@override String get description => 'הסר כהלכה יישומים שלמים עם כל הקבצים הקשורים.';
}

// Path: cleanupCategories.userCache
class _Translations$cleanupCategories$userCache$he extends Translations$cleanupCategories$userCache$en {
	_Translations$cleanupCategories$userCache$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get name => 'קבצי מטמון משתמש';
	@override String get description => 'במקור נועדו לשפר את זמני האתחול, קבצי המטמון של היישומים שלך מצטברים בסופו של דבר וגורמים לתפקוד לא תקין או לירידה כללית בביצועים.';
}

// Path: cleanupCategories.userLogs
class _Translations$cleanupCategories$userLogs$he extends Translations$cleanupCategories$userLogs$en {
	_Translations$cleanupCategories$userLogs$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get name => 'קבצי יומן משתמש';
	@override String get description => 'קובצי יומן נוצרים על ידי macOS והיישומים שלה כדי להקליט אירועים ושגיאות. עם הזמן הם יכולים לגדול ולתפוס מקום משמעותי.';
}

// Path: cleanupCategories.languageFiles
class _Translations$cleanupCategories$languageFiles$he extends Translations$cleanupCategories$languageFiles$en {
	_Translations$cleanupCategories$languageFiles$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get name => 'קבצי שפה';
	@override String get description => 'משאבי לוקליזציה שאינם בשימוש המצורפים לאפליקציות. הסרת שפות שאינך משתמש בהן מפנה שטח אחסון מבלי להשפיע על הפונקציונליות.';
}

// Path: cleanupCategories.systemLogs
class _Translations$cleanupCategories$systemLogs$he extends Translations$cleanupCategories$systemLogs$en {
	_Translations$cleanupCategories$systemLogs$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get name => 'קבצי יומן מערכת';
	@override String get description => 'קובצי יומן כלל המערכת שנכתבו על ידי שירותי macOS ודמונים. קבצים אלה בטוחים להסרה מכיוון שהמערכת יוצרת אותם מחדש בעת הצורך.';
}

// Path: cleanupCategories.brokenLoginItems
class _Translations$cleanupCategories$brokenLoginItems$he extends Translations$cleanupCategories$brokenLoginItems$en {
	_Translations$cleanupCategories$brokenLoginItems$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get name => 'פריטי כניסה שבורים';
	@override String get description => 'פריטי כניסה המצביעים על יישומים או קבצים שאינם קיימים עוד בדיסק שלך. הסרתם מזרזת את זמן הכניסה.';
}

// Path: sections.home.features
class _Translations$sections$home$features$he extends Translations$sections$home$features$en {
	_Translations$sections$home$features$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get systemStatus => 'דופק מערכת חי';
	@override String get storageUsage => 'לחץ אחסון';
	@override String get quickActions => 'תיקונים בלחיצה אחת';
}

// Path: sections.cleanup.features
class _Translations$sections$cleanup$features$he extends Translations$sections$cleanup$features$en {
	_Translations$sections$cleanup$features$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get systemJunk => 'זבל מערכת שיורי';
	@override String get userCache => 'מטמון משתמש נפוח';
	@override String get tempFiles => 'קבצי טמפ\' מעופשים';
}

// Path: sections.myClutter.features
class _Translations$sections$myClutter$features$he extends Translations$sections$myClutter$features$en {
	_Translations$sections$myClutter$features$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get largeFiles => 'קבצים רעבים לחלל';
	@override String get duplicates => 'שכפול אשכולות';
	@override String get largeSimilarImages => 'ערכות תמונות של Near-Match';
}

// Path: sections.spaceView.features
class _Translations$sections$spaceView$features$he extends Translations$sections$spaceView$features$en {
	_Translations$sections$spaceView$features$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get visualStorageMap => 'מפת אחסון אינטראקטיבית';
	@override String get largeFoldersOverview => 'נקודות חמות של תיקיות כבדות';
	@override String get hiddenFilesUncovered => 'מנקזי שטח נסתרים';
}

// Path: sections.applications.features
class _Translations$sections$applications$features$he extends Translations$sections$applications$features$en {
	_Translations$sections$applications$features$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get appUninstaller => 'מסיר אפליקציות עמוק';
	@override String get largeApps => 'אפליקציות במשקל כבד';
	@override String get fileLeftovers => 'קבצי תמיכה מיותמים';
}

// Path: sections.myTools.features
class _Translations$sections$myTools$features$he extends Translations$sections$myTools$features$en {
	_Translations$sections$myTools$features$he._(TranslationsHe root) : this._root = root, super.internal(root);

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
			'navigation.donate' => 'תרומה',
			'navigation.settings' => 'הגדרות',
			'settings.title' => 'הגדרות',
			'settings.subtitle' => 'התאם את PristineCleaner לדרך העבודה שלך.',
			'settings.sectionLanguage' => 'שפה',
			'settings.sectionUpdates' => 'עדכונים',
			'settings.sectionBehavior' => 'התנהגות',
			'settings.autoCheckUpdates' => 'בדוק עדכונים בעת ההפעלה',
			'settings.autoCheckUpdatesSub' => 'חפש גרסאות חדשות אוטומטית עם פתיחת האפליקציה.',
			'settings.checkForUpdates' => 'בדוק עדכונים',
			'settings.launchAtLogin' => 'הפעל בעת הכניסה',
			'settings.launchAtLoginSub' => 'פתח את PristineCleaner אוטומטית בעת הכניסה למחשב.',
			'settings.confirmBeforeRemoving' => 'אשר לפני הסרה',
			'settings.confirmBeforeRemovingSub' => 'הצג חלון אישור לפני הסרת קבצים.',
			'sections.home.title' => 'בַּיִת',
			'sections.home.subtitle' => 'ראה את הסימנים החיוניים של המחשב שלך במבט חטוף\nותפוס בעיות לפני שהם גדלים.',
			'sections.home.features.systemStatus' => 'דופק מערכת חי',
			'sections.home.features.storageUsage' => 'לחץ אחסון',
			'sections.home.features.quickActions' => 'תיקונים בלחיצה אחת',
			'sections.cleanup.title' => 'ניקוי זבל',
			'sections.cleanup.subtitle' => 'לטאטא שאריות דיגיטליות כדי לשחזר\nמהירות, יציבות ושטח פנוי יקר.',
			'sections.cleanup.features.systemJunk' => 'זבל מערכת שיורי',
			'sections.cleanup.features.userCache' => 'מטמון משתמש נפוח',
			'sections.cleanup.features.tempFiles' => 'קבצי טמפ\' מעופשים',
			'sections.myClutter.title' => 'הבלגן שלי',
			'sections.myClutter.subtitle' => 'הפוך תיקיות כאוטיות להחלטות ברורות\nעם ניקוי מודרך תוך דקות.',
			'sections.myClutter.features.largeFiles' => 'קבצים רעבים לחלל',
			'sections.myClutter.features.duplicates' => 'שכפול אשכולות',
			'sections.myClutter.features.largeSimilarImages' => 'ערכות תמונות של Near-Match',
			'sections.spaceView.title' => 'תצוגת חלל',
			'sections.spaceView.subtitle' => 'מפה את הדיסק שלך באופן ויזואלי כדי לזהות את\nהחשוב ביותר ולפנות מקום מהר יותר.',
			'sections.spaceView.features.visualStorageMap' => 'מפת אחסון אינטראקטיבית',
			'sections.spaceView.features.largeFoldersOverview' => 'נקודות חמות של תיקיות כבדות',
			'sections.spaceView.features.hiddenFilesUncovered' => 'מנקזי שטח נסתרים',
			'sections.applications.title' => 'יישומים',
			'sections.applications.subtitle' => 'השתלט על טביעת הרגל של האפליקציה שלך.\nהסר את ההתקנה בצורה נקייה והסר שאריות שנשכחו.',
			'sections.applications.features.appUninstaller' => 'מסיר אפליקציות עמוק',
			'sections.applications.features.largeApps' => 'אפליקציות במשקל כבד',
			'sections.applications.features.fileLeftovers' => 'קבצי תמיכה מיותמים',
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
			'dialogs.exitConfirmationTitle' => 'אשר יציאה',
			'dialogs.exitConfirmationMessage' => 'סריקה מתבצעת כעת. האם אתה בטוח שברצונך לצאת?',
			'dialogs.exitConfirmationWait' => 'המתן',
			'dialogs.exitConfirmationQuit' => 'צא בכל מקרה',
			'dialogs.stopRemovalTitle' => 'להפסיק את ההסרה?',
			'dialogs.stopRemovalMessage' => 'הקובץ הנוכחי יסתיים, ואז ידלגו על הקבצים הנותרים.',
			'dialogs.confirmRemovalTitle' => 'להסיר את הפריטים שנבחרו?',
			'dialogs.confirmRemovalMessage' => '{count} פריטים יועברו לאשפה.',
			'dialogs.confirmRemovalMessagePermanent' => '{count} פריטים יימחקו לצמיתות. לא ניתן לבטל פעולה זו.',
			'dialogs.confirmRemovalCancel' => 'ביטול',
			'dialogs.confirmRemovalConfirm' => 'הסר',
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
			'donate.title' => 'תמכו ב-PristineCleaner',
			'donate.subtitle' => 'אם PristineCleaner עוזר לכם לשמור על המערכת נקיה, אפשר לתמוך בפיתוח עם תרומה קטנה.',
			'donate.buyMeACoffee' => 'Buy Me a Coffee',
			'donate.paypalDonate' => 'תרומה באמצעות PayPal',
			'donate.openLinkFailed' => 'לא ניתן לפתוח את קישור התרומה.',
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
			'myToolsCatalog.similarImages.title' => 'תמונות דומות',
			'myToolsCatalog.similarImages.description' => 'סקור תמונות דומות ושמור רק את הטובות ביותר.',
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
