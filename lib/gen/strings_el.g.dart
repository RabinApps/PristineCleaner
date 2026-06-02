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
class TranslationsEl with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.el,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <el>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEl _root = this; // ignore: unused_field

	@override 
	TranslationsEl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEl(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$el app = _Translations$app$el._(_root);
	@override late final _Translations$language$el language = _Translations$language$el._(_root);
	@override late final _Translations$navigation$el navigation = _Translations$navigation$el._(_root);
	@override late final _Translations$sections$el sections = _Translations$sections$el._(_root);
	@override late final _Translations$progress$el progress = _Translations$progress$el._(_root);
	@override late final _Translations$errors$el errors = _Translations$errors$el._(_root);
	@override late final _Translations$buttons$el buttons = _Translations$buttons$el._(_root);
	@override late final _Translations$tooltips$el tooltips = _Translations$tooltips$el._(_root);
	@override late final _Translations$dialogs$el dialogs = _Translations$dialogs$el._(_root);
	@override late final _Translations$removal$el removal = _Translations$removal$el._(_root);
	@override late final _Translations$done$el done = _Translations$done$el._(_root);
	@override late final _Translations$donate$el donate = _Translations$donate$el._(_root);
	@override late final _Translations$cleanupManager$el cleanupManager = _Translations$cleanupManager$el._(_root);
	@override late final _Translations$projectDirectory$el projectDirectory = _Translations$projectDirectory$el._(_root);
	@override late final _Translations$searchAndSort$el searchAndSort = _Translations$searchAndSort$el._(_root);
	@override late final _Translations$spaceView$el spaceView = _Translations$spaceView$el._(_root);
	@override late final _Translations$home$el home = _Translations$home$el._(_root);
	@override late final _Translations$myToolsPage$el myToolsPage = _Translations$myToolsPage$el._(_root);
	@override late final _Translations$myToolsMessages$el myToolsMessages = _Translations$myToolsMessages$el._(_root);
	@override late final _Translations$myToolsCatalog$el myToolsCatalog = _Translations$myToolsCatalog$el._(_root);
	@override late final _Translations$cleanupCategories$el cleanupCategories = _Translations$cleanupCategories$el._(_root);
	@override late final _Translations$myClutterDashboard$el myClutterDashboard = _Translations$myClutterDashboard$el._(_root);
	@override late final _Translations$scanResults$el scanResults = _Translations$scanResults$el._(_root);
	@override late final _Translations$spaceViewStart$el spaceViewStart = _Translations$spaceViewStart$el._(_root);
	@override late final _Translations$shell$el shell = _Translations$shell$el._(_root);
	@override late final _Translations$myToolsService$el myToolsService = _Translations$myToolsService$el._(_root);
}

// Path: app
class _Translations$app$el implements Translations$app$en {
	_Translations$app$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'PristineCleaner';
}

// Path: language
class _Translations$language$el implements Translations$language$en {
	_Translations$language$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get label => 'Γλώσσα';
	@override String get english => 'αγγλικός';
	@override String get spanish => 'ισπανικά';
	@override String get italian => 'ιταλικά';
	@override String get french => 'Γάλλος';
	@override String get hebrew => 'Εβραϊκά';
	@override String get greek => 'ελληνικά';
	@override String get portuguese => 'Πορτογάλος';
	@override String get mandarin => 'Μανταρίνι';
}

// Path: navigation
class _Translations$navigation$el implements Translations$navigation$en {
	_Translations$navigation$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get home => 'Σπίτι';
	@override String get cleanup => 'Καθαρισμός';
	@override String get myClutter => 'Η ακαταστασία μου';
	@override String get spaceView => 'Θέα Διαστήματος';
	@override String get applications => 'Εφαρμογές';
	@override String get myTools => 'Τα εργαλεία μου';
	@override String get donate => 'Δωρεά';
}

// Path: sections
class _Translations$sections$el implements Translations$sections$en {
	_Translations$sections$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sections$home$el home = _Translations$sections$home$el._(_root);
	@override late final _Translations$sections$cleanup$el cleanup = _Translations$sections$cleanup$el._(_root);
	@override late final _Translations$sections$myClutter$el myClutter = _Translations$sections$myClutter$el._(_root);
	@override late final _Translations$sections$spaceView$el spaceView = _Translations$sections$spaceView$el._(_root);
	@override late final _Translations$sections$applications$el applications = _Translations$sections$applications$el._(_root);
	@override late final _Translations$sections$myTools$el myTools = _Translations$sections$myTools$el._(_root);
}

// Path: progress
class _Translations$progress$el implements Translations$progress$en {
	_Translations$progress$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get countingFiles => 'Καταμέτρηση αρχείων...';
	@override String get countingApplications => 'Καταμέτρηση εφαρμογών...';
	@override String get countingFolders => 'Καταμέτρηση φακέλων...';
}

// Path: errors
class _Translations$errors$el implements Translations$errors$en {
	_Translations$errors$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get itemsFailedToRemove => 'Η κατάργηση των {count} στοιχείων απέτυχε.';
}

// Path: buttons
class _Translations$buttons$el implements Translations$buttons$en {
	_Translations$buttons$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get scan => 'Σάρωση';
	@override String get stop => 'Στάση';
	@override String get done => 'Γινώμενος';
	@override String get clean => 'Καθαρός';
	@override String get cleanUp => 'Εκκαθάριση';
	@override String get close => 'Κοντά';
	@override String get refresh => 'Φρεσκάρω';
	@override String get rescan => 'Εκ νέου σάρωση';
	@override String get startOver => 'Ξεκινήστε από την αρχή';
	@override String get selectAll => 'Επιλέξτε Όλα';
	@override String get clearSelection => 'Εκκαθάριση επιλογής';
	@override String get keepScanning => 'Συνεχίστε τη σάρωση';
	@override String get keepRemoving => 'Συνεχίστε να αφαιρείτε';
}

// Path: tooltips
class _Translations$tooltips$el implements Translations$tooltips$en {
	_Translations$tooltips$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get search => 'Ερευνα';
	@override String get openInFinder => 'Άνοιγμα στο Finder';
}

// Path: dialogs
class _Translations$dialogs$el implements Translations$dialogs$en {
	_Translations$dialogs$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get stopScanningTitle => 'Διακοπή σάρωσης;';
	@override String get stopScanningMessage => 'Αυτό θα ακυρώσει την τρέχουσα σάρωση και θα απορρίψει οποιαδήποτε μερική πρόοδο.';
	@override String get exitConfirmationTitle => 'Επιβεβαίωση εξόδου';
	@override String get exitConfirmationMessage => 'Εκτελείται σάρωση. Είστε βέβαιοι ότι θέλετε να εξέλθετε;';
	@override String get exitConfirmationWait => 'Περιμένετε';
	@override String get exitConfirmationQuit => 'Έξοδος ούτως ή άλλως';
	@override String get stopRemovalTitle => 'Διακοπή αφαίρεσης;';
	@override String get stopRemovalMessage => 'Το τρέχον αρχείο θα ολοκληρωθεί και, στη συνέχεια, τα υπόλοιπα αρχεία θα παραλειφθούν.';
}

// Path: removal
class _Translations$removal$el implements Translations$removal$en {
	_Translations$removal$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get barrierLabel => 'Πρόοδος αφαίρεσης';
	@override String get preparing => 'Προετοιμασία...';
	@override String get removingFrom => 'Αφαίρεση από {title}';
	@override String get stoppingAfterCurrentFile => 'Διακοπή μετά το τρέχον αρχείο...';
	@override String get keepWindowOpen => 'Κρατήστε αυτό το παράθυρο ανοιχτό όσο εκτελείται η αφαίρεση.';
	@override String get processedSummary => '{processed} από {total} υποβλήθηκαν σε επεξεργασία';
	@override String get deletedFreed => '{deleted} διαγράφηκε • {bytes} ελευθερώθηκε';
	@override String get currentItem => 'Τρέχον: {name}';
	@override String get stopping => 'Στάθμευση...';
	@override String get removalFailed => 'Η αφαίρεση απέτυχε';
	@override String get removalFailedDetails => 'Κάτι πήγε στραβά κατά την κατάργηση επιλεγμένων αρχείων.';
	@override String get removalStopped => 'Η αφαίρεση σταμάτησε';
	@override String get removalComplete => 'Η αφαίρεση ολοκληρώθηκε';
	@override String get deletedSummary => 'Ο {title} διέγραψε {count} στοιχεία';
	@override String get freedSummary => '{bytes} ελευθερώθηκε';
	@override String get failedToRemoveSummary => 'Η κατάργηση των {count} στοιχείων απέτυχε.';
	@override String get deletedFiles => 'Διαγραμμένα αρχεία';
	@override String get noFilesDeleted => 'Κανένα αρχείο δεν διαγράφηκε.';
}

// Path: done
class _Translations$done$el implements Translations$done$en {
	_Translations$done$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get allCleanedTitle => 'Όλα καθαρισμένα!';
	@override String get movedToTrashMessage => 'Τα επιλεγμένα αρχεία έχουν μετακινηθεί στον Κάδο απορριμμάτων.';
	@override String get applicationsRemovedTitle => 'Οι αιτήσεις καταργήθηκαν!';
	@override String get appsMovedToTrashMessage => 'Οι επιλεγμένες εφαρμογές έχουν μετακινηθεί στον Κάδο απορριμμάτων.';
}

// Path: donate
class _Translations$donate$el implements Translations$donate$en {
	_Translations$donate$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Υποστηριξτε το PristineCleaner';
	@override String get subtitle => 'Αν το PristineCleaner σας βοηθα να κρατατε το συστημα καθαρο, μπορειτε να υποστηριξετε την αναπτυξη με μια μικρη δωρεα.';
	@override String get buyMeACoffee => 'Buy Me a Coffee';
	@override String get paypalDonate => 'Δωρεα με PayPal';
	@override String get openLinkFailed => 'Δεν ηταν δυνατο το ανοιγμα του συνδεσμου δωρεας.';
}

// Path: cleanupManager
class _Translations$cleanupManager$el implements Translations$cleanupManager$en {
	_Translations$cleanupManager$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Υπεύθυνος καθαρισμού';
	@override String get systemJunkHeader => 'Σκουπίδια συστήματος';
	@override String get systemJunkDescription => 'Περιττά αρχεία που φράζουν την αποθήκευση της συσκευής και εμποδίζουν τη βέλτιστη απόδοση.';
	@override String get selectLabel => 'Επιλέγω';
	@override String get selectAllOption => 'Ολοι';
	@override String get selectNoneOption => 'Κανένας';
	@override String get noItems => 'Δεν υπάρχουν στοιχεία';
	@override String get noItemsFound => 'Δεν βρέθηκαν στοιχεία';
	@override String get itemsSelected => 'Επιλέχθηκαν {count} στοιχεία';
}

// Path: projectDirectory
class _Translations$projectDirectory$el implements Translations$projectDirectory$en {
	_Translations$projectDirectory$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get chooseFolder => 'Επιλέξτε Φάκελο...';
	@override String get chooseProjectDirectory => 'Επιλέξτε κατάλογο έργου';
	@override String get chooseParentFolder => 'Επιλέξτε γονικό φάκελο';
	@override String get noFolder => 'Χωρίς φάκελο';
}

// Path: searchAndSort
class _Translations$searchAndSort$el implements Translations$searchAndSort$en {
	_Translations$searchAndSort$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get searchHint => 'Ερευνα...';
	@override String get sortBy => 'Ταξινόμηση κατά';
	@override String get size => 'Μέγεθος';
	@override String get name => 'Ονομα';
	@override String get ascending => 'Αύξουσα';
	@override String get descending => 'Φθίνων';
}

// Path: spaceView
class _Translations$spaceView$el implements Translations$spaceView$en {
	_Translations$spaceView$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get noFoldersFound => 'Δεν βρέθηκαν φάκελοι για αυτό το επίπεδο';
	@override String get noBubblesToRender => 'Δεν υπάρχουν φυσαλίδες για απόδοση';
	@override String get otherItems => 'Άλλα είδη';
}

// Path: home
class _Translations$home$el implements Translations$home$en {
	_Translations$home$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get refresh => 'Φρεσκάρω';
	@override String get unableToReadDiskInfo => 'Δεν είναι δυνατή η ανάγνωση των πληροφοριών του δίσκου';
	@override String get totalStorage => 'Συνολικός χώρος αποθήκευσης';
	@override String get used => 'Μεταχειρισμένος';
	@override String get available => 'Διαθέσιμος';
	@override String get percentUsed => '{percent}% χρησιμοποιείται';
	@override String get cpuUsage => 'Χρήση CPU';
	@override String get ramUsage => 'Χρήση RAM';
	@override String get memoryPercentUsed => '{percent}% RAM που χρησιμοποιείται';
	@override String get unableToReadSystemInfo => 'Δεν είναι δυνατή η ανάγνωση πληροφοριών συστήματος';
}

// Path: myToolsPage
class _Translations$myToolsPage$el implements Translations$myToolsPage$en {
	_Translations$myToolsPage$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Τα εργαλεία μου';
	@override String get subtitle => 'Τα βασικά εργαλεία σας για να διατηρείτε το Mac σας καθαρό, ασφαλές και να λειτουργεί ομαλά.';
	@override String get backToTools => 'Επιστροφή στα εργαλεία';
}

// Path: myToolsMessages
class _Translations$myToolsMessages$el implements Translations$myToolsMessages$en {
	_Translations$myToolsMessages$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get itemsWithSize => '{count} αντικείμενο(α) • {size}';
	@override String get scanCancelled => 'η σάρωση ακυρώθηκε.';
	@override String get selectAtLeastOne => 'Επιλέξτε τουλάχιστον ένα αντικείμενο για καθαρισμό.';
	@override String get failedToClean => 'Αποτυχία καθαρισμού {count} αντικειμένων.';
	@override String get everythingSelectedCleaned => 'Όλα τα επιλεγμένα καθαρίστηκαν.';
	@override String get cleanupUpdated => 'Η εκκαθάριση ενημερώθηκε.';
	@override String get cleanedCount => 'Καθαρίστηκαν {count} αντικείμενο(α).';
	@override String get stoppedPrefix => 'Σταμάτησε.';
	@override String get removedCount => 'Καταργήθηκαν {count} στοιχεία.';
	@override String get failedCountShort => '{count} απέτυχε.';
	@override String get scanComplete => 'Η σάρωση ολοκληρώθηκε.';
	@override String get somethingWentWrong => 'Κάτι πήγε στραβά.';
	@override late final _Translations$myToolsMessages$fallback$el fallback = _Translations$myToolsMessages$fallback$el._(_root);
}

// Path: myToolsCatalog
class _Translations$myToolsCatalog$el implements Translations$myToolsCatalog$en {
	_Translations$myToolsCatalog$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override late final _Translations$myToolsCatalog$appLeftovers$el appLeftovers = _Translations$myToolsCatalog$appLeftovers$el._(_root);
	@override late final _Translations$myToolsCatalog$backgroundItems$el backgroundItems = _Translations$myToolsCatalog$backgroundItems$el._(_root);
	@override late final _Translations$myToolsCatalog$downloads$el downloads = _Translations$myToolsCatalog$downloads$el._(_root);
	@override late final _Translations$myToolsCatalog$largeOld$el largeOld = _Translations$myToolsCatalog$largeOld$el._(_root);
	@override late final _Translations$myToolsCatalog$similarImages$el similarImages = _Translations$myToolsCatalog$similarImages$el._(_root);
	@override late final _Translations$myToolsCatalog$trashBins$el trashBins = _Translations$myToolsCatalog$trashBins$el._(_root);
	@override late final _Translations$myToolsCatalog$duplicateFinder$el duplicateFinder = _Translations$myToolsCatalog$duplicateFinder$el._(_root);
	@override late final _Translations$myToolsCatalog$applicationPermissions$el applicationPermissions = _Translations$myToolsCatalog$applicationPermissions$el._(_root);
	@override late final _Translations$myToolsCatalog$systemJunk$el systemJunk = _Translations$myToolsCatalog$systemJunk$el._(_root);
	@override late final _Translations$myToolsCatalog$timeMachineSnapshot$el timeMachineSnapshot = _Translations$myToolsCatalog$timeMachineSnapshot$el._(_root);
	@override late final _Translations$myToolsCatalog$loginItems$el loginItems = _Translations$myToolsCatalog$loginItems$el._(_root);
	@override late final _Translations$myToolsCatalog$mailAttachments$el mailAttachments = _Translations$myToolsCatalog$mailAttachments$el._(_root);
	@override late final _Translations$myToolsCatalog$malwareFinder$el malwareFinder = _Translations$myToolsCatalog$malwareFinder$el._(_root);
	@override late final _Translations$myToolsCatalog$uninstaller$el uninstaller = _Translations$myToolsCatalog$uninstaller$el._(_root);
}

// Path: cleanupCategories
class _Translations$cleanupCategories$el implements Translations$cleanupCategories$en {
	_Translations$cleanupCategories$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override late final _Translations$cleanupCategories$userCache$el userCache = _Translations$cleanupCategories$userCache$el._(_root);
	@override late final _Translations$cleanupCategories$userLogs$el userLogs = _Translations$cleanupCategories$userLogs$el._(_root);
	@override late final _Translations$cleanupCategories$languageFiles$el languageFiles = _Translations$cleanupCategories$languageFiles$el._(_root);
	@override late final _Translations$cleanupCategories$systemLogs$el systemLogs = _Translations$cleanupCategories$systemLogs$el._(_root);
	@override late final _Translations$cleanupCategories$brokenLoginItems$el brokenLoginItems = _Translations$cleanupCategories$brokenLoginItems$el._(_root);
}

// Path: myClutterDashboard
class _Translations$myClutterDashboard$el implements Translations$myClutterDashboard$en {
	_Translations$myClutterDashboard$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get backToCategories => 'Επιστροφή στις Κατηγορίες';
	@override String get filesToSort => 'Έχετε {count} αρχεία για ταξινόμηση.';
	@override String get quickRecommendations => 'Χρησιμοποιήστε γρήγορες συστάσεις ή αναθεωρήστε τις με το χέρι.';
	@override String get reviewAllFiles => 'Ελέγξτε όλα τα αρχεία';
	@override String get freshDuplicatesFound => '{count} Βρέθηκαν νέα διπλότυπα';
	@override String get noDuplicates => 'Δεν βρέθηκαν διπλότυπα σε αυτήν τη σάρωση.';
	@override String get removeDuplicateBytes => 'Καταργήστε {bytes} διπλότυπα αρχεία.';
	@override String get largeSimilarImagesFound => '{count} Βρέθηκαν Μεγάλες Παρόμοιες Εικόνες';
	@override String get noSimilarGroups => 'Δεν βρέθηκαν παρόμοιες ομάδες εικόνων.';
	@override String get nearlyIdenticalImages => 'Υπάρχουν {bytes} σχεδόν πανομοιότυπες εικόνες.';
	@override String get largeFilesFound => '{bytes} Βρέθηκαν μεγάλα αρχεία';
	@override String get noLargeFiles => 'Δεν βρέθηκαν μεγάλα αρχεία.';
	@override String get largeFilesReady => '{count} μεγάλα αρχεία είναι έτοιμα για έλεγχο.';
	@override String get review => 'Κριτική';
}

// Path: scanResults
class _Translations$scanResults$el implements Translations$scanResults$en {
	_Translations$scanResults$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get itemsSummary => '{count} αντικείμενα • {size}';
	@override String get scannedInMs => 'Σαρώθηκε σε {ms}ms';
	@override String get deselectAll => 'Καταργήστε την επιλογή όλων';
	@override String get selectAll => 'Επιλέξτε Όλα';
	@override String get noItemsMatchSearch => 'Δεν υπάρχουν στοιχεία που να αντιστοιχούν στην αναζήτησή σας';
	@override String get noItemsFound => 'Δεν βρέθηκαν στοιχεία';
	@override String get itemsSelected => 'Επιλέχθηκαν {count} στοιχεία';
	@override String get rescan => 'Εκ νέου σάρωση';
}

// Path: spaceViewStart
class _Translations$spaceViewStart$el implements Translations$spaceViewStart$en {
	_Translations$spaceViewStart$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get subtitle => 'Επιλέξτε έναν γονικό φάκελο και, στη συνέχεια, σαρώστε για να χαρτογραφήσετε αυτό που καταλαμβάνει τον περισσότερο χώρο.';
	@override String get defaultRootPath => 'Η προεπιλεγμένη διαδρομή ρίζας είναι ο κύριος σκληρός σας δίσκος';
	@override String get exploreBubbles => 'Εξερευνήστε τα μεγέθη φακέλων μέσω διαδραστικών φυσαλίδων';
	@override String get clickToDrillDown => 'Κάντε κλικ στους φακέλους για να διερευνήσετε και να ελέγξετε βαθύτερα';
}

// Path: shell
class _Translations$shell$el implements Translations$shell$en {
	_Translations$shell$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get comingSoon => 'Προσεχώς';
}

// Path: myToolsService
class _Translations$myToolsService$el implements Translations$myToolsService$en {
	_Translations$myToolsService$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get snapshotName => 'Στιγμιότυπο {id}';
	@override String get timeMachineGroup => 'Μηχανή του Χρόνου';
	@override String get timeMachineMacOnly => 'Τα στιγμιότυπα Time Machine είναι διαθέσιμα μόνο στο macOS.';
}

// Path: sections.home
class _Translations$sections$home$el implements Translations$sections$home$en {
	_Translations$sections$home$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Σπίτι';
	@override String get subtitle => 'Δείτε τα ζωτικά σημεία του υπολογιστή σας με μια ματιά\nκαι εντοπίστε προβλήματα προτού αναπτυχθούν.';
	@override late final _Translations$sections$home$features$el features = _Translations$sections$home$features$el._(_root);
}

// Path: sections.cleanup
class _Translations$sections$cleanup$el implements Translations$sections$cleanup$en {
	_Translations$sections$cleanup$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Καθαρισμός σκουπιδιών';
	@override String get subtitle => 'Σαρώστε τα ψηφιακά υπολείμματα για να αποκαταστήσετε\nτην ταχύτητα, τη σταθερότητα και τον πολύτιμο ελεύθερο χώρο.';
	@override late final _Translations$sections$cleanup$features$el features = _Translations$sections$cleanup$features$el._(_root);
}

// Path: sections.myClutter
class _Translations$sections$myClutter$el implements Translations$sections$myClutter$en {
	_Translations$sections$myClutter$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Η ακαταστασία μου';
	@override String get subtitle => 'Μετατρέψτε τους χαοτικούς φακέλους σε σαφείς αποφάσεις\nμε καθοδηγούμενο καθαρισμό μέσα σε λίγα λεπτά.';
	@override late final _Translations$sections$myClutter$features$el features = _Translations$sections$myClutter$features$el._(_root);
}

// Path: sections.spaceView
class _Translations$sections$spaceView$el implements Translations$sections$spaceView$en {
	_Translations$sections$spaceView$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Θέα Διαστήματος';
	@override String get subtitle => 'Αντιστοιχίστε οπτικά τον δίσκο σας για να εντοπίσετε\nτι είναι πιο σημαντικό και να ελευθερώσετε χώρο πιο γρήγορα.';
	@override late final _Translations$sections$spaceView$features$el features = _Translations$sections$spaceView$features$el._(_root);
}

// Path: sections.applications
class _Translations$sections$applications$el implements Translations$sections$applications$en {
	_Translations$sections$applications$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Εφαρμογές';
	@override String get subtitle => 'Κατακτήστε το αποτύπωμα της εφαρμογής σας.\nΑπεγκαταστήστε καθαρά και αφαιρέστε τα ξεχασμένα υπολείμματα.';
	@override late final _Translations$sections$applications$features$el features = _Translations$sections$applications$features$el._(_root);
}

// Path: sections.myTools
class _Translations$sections$myTools$el implements Translations$sections$myTools$en {
	_Translations$sections$myTools$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Τα εργαλεία μου';
	@override String get subtitle => 'Το βασικό σας εργαλείο για τη φροντίδα και τη συντήρηση του συστήματος.';
	@override late final _Translations$sections$myTools$features$el features = _Translations$sections$myTools$features$el._(_root);
}

// Path: myToolsMessages.fallback
class _Translations$myToolsMessages$fallback$el implements Translations$myToolsMessages$fallback$en {
	_Translations$myToolsMessages$fallback$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get downloadsTidy => 'Οι λήψεις είναι τακτοποιημένες.';
	@override String get noOversizedStale => 'Δεν βρέθηκαν μεγάλα μπαγιάτικα αρχεία.';
	@override String get noRecentDuplicates => 'Δεν βρέθηκαν πρόσφατα διπλότυπα.';
	@override String get noSimilarLargeImages => 'Δεν βρέθηκαν παρόμοιες μεγάλες εικόνες.';
	@override String get noAppLeftovers => 'Δεν βρέθηκαν υπολείμματα αφαιρούμενης εφαρμογής.';
	@override String get noStaleApps => 'Δεν βρέθηκαν παλιές εφαρμογές.';
	@override String get appsNeedReview => 'Βρέθηκαν εφαρμογές που μπορεί να χρειάζονται έλεγχο.';
	@override String get noSystemJunkCandidates => 'Δεν υπάρχουν υποψήφιοι καθαρισμού στα σκουπίδια συστήματος.';
	@override String get noBrokenStartup => 'Δεν βρέθηκαν κατεστραμμένες εγγραφές εκκίνησης/παρασκηνίου.';
	@override String get noBackgroundItems => 'Δεν βρέθηκαν στοιχεία φόντου.';
	@override String get noPrivacyTraces => 'Δεν βρέθηκαν ίχνη απορρήτου σε γνωστές τοποθεσίες.';
	@override String get trashAlreadyEmpty => 'Ο κάδος απορριμμάτων είναι ήδη άδειος.';
	@override String get noPermissionCache => 'Δεν βρέθηκαν αρχεία προσωρινής μνήμης αδειών.';
	@override String get noTimeMachineSnapshots => 'Δεν βρέθηκαν τοπικά στιγμιότυπα του Time Machine.';
	@override String get noMaintenanceCandidates => 'Δεν βρέθηκαν υποψήφιοι συντήρησης.';
	@override String get noMailAttachments => 'Δεν βρέθηκαν αφαιρούμενα συνημμένα αλληλογραφίας.';
	@override String get noSuspiciousFiles => 'Δεν εντοπίστηκαν ύποπτα αρχεία.';
}

// Path: myToolsCatalog.appLeftovers
class _Translations$myToolsCatalog$appLeftovers$el implements Translations$myToolsCatalog$appLeftovers$en {
	_Translations$myToolsCatalog$appLeftovers$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Υπολείμματα εφαρμογής';
	@override String get description => 'Εντοπίστε και αφαιρέστε τα υπολείμματα εφαρμογών ακόμα κι αν η κύρια εφαρμογή έχει ήδη φύγει.';
}

// Path: myToolsCatalog.backgroundItems
class _Translations$myToolsCatalog$backgroundItems$el implements Translations$myToolsCatalog$backgroundItems$en {
	_Translations$myToolsCatalog$backgroundItems$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Στοιχεία φόντου';
	@override String get description => 'Διαχειριστείτε εφαρμογές παρασκηνίου και διεργασίες που εκτελούνται στο Mac σας.';
}

// Path: myToolsCatalog.downloads
class _Translations$myToolsCatalog$downloads$el implements Translations$myToolsCatalog$downloads$en {
	_Translations$myToolsCatalog$downloads$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Λήψεις';
	@override String get description => 'Ελέγξτε και καθαρίστε τα αρχεία μίας χρήσης από τις Λήψεις για να διατηρείτε τους φακέλους τακτοποιημένους.';
}

// Path: myToolsCatalog.largeOld
class _Translations$myToolsCatalog$largeOld$el implements Translations$myToolsCatalog$largeOld$en {
	_Translations$myToolsCatalog$largeOld$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Μεγάλα και παλιά αρχεία';
	@override String get description => 'Βρείτε και αφαιρέστε μεγάλα, αχρησιμοποίητα αρχεία που καταλαμβάνουν χώρο στο Mac σας.';
}

// Path: myToolsCatalog.similarImages
class _Translations$myToolsCatalog$similarImages$el implements Translations$myToolsCatalog$similarImages$en {
	_Translations$myToolsCatalog$similarImages$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Παρόμοιες Εικόνες';
	@override String get description => 'Ελέγξτε παρόμοιες φωτογραφίες και κρατήστε μόνο τις καλύτερες.';
}

// Path: myToolsCatalog.trashBins
class _Translations$myToolsCatalog$trashBins$el implements Translations$myToolsCatalog$trashBins$en {
	_Translations$myToolsCatalog$trashBins$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Κάδοι απορριμμάτων';
	@override String get description => 'Αδειάστε όλους τους διαθέσιμους κάδους απορριμμάτων στο Mac σας.';
}

// Path: myToolsCatalog.duplicateFinder
class _Translations$myToolsCatalog$duplicateFinder$el implements Translations$myToolsCatalog$duplicateFinder$en {
	_Translations$myToolsCatalog$duplicateFinder$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Διπλότυπο Finder';
	@override String get description => 'Καταργήστε τα διπλά αρχεία που είναι αποθηκευμένα σε διαφορετικές τοποθεσίες στο Mac σας.';
}

// Path: myToolsCatalog.applicationPermissions
class _Translations$myToolsCatalog$applicationPermissions$el implements Translations$myToolsCatalog$applicationPermissions$en {
	_Translations$myToolsCatalog$applicationPermissions$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Δικαιώματα εφαρμογής';
	@override String get description => 'Διαχειριστείτε τον τρόπο πρόσβασης των εφαρμογών σε λειτουργίες, συσκευές και λειτουργίες συστήματος.';
}

// Path: myToolsCatalog.systemJunk
class _Translations$myToolsCatalog$systemJunk$el implements Translations$myToolsCatalog$systemJunk$en {
	_Translations$myToolsCatalog$systemJunk$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Σκουπίδια συστήματος';
	@override String get description => 'Καταργήστε τα περιττά αρχεία που φράζουν την αποθήκευση της συσκευής και εμποδίζουν τη βέλτιστη απόδοση.';
}

// Path: myToolsCatalog.timeMachineSnapshot
class _Translations$myToolsCatalog$timeMachineSnapshot$el implements Translations$myToolsCatalog$timeMachineSnapshot$en {
	_Translations$myToolsCatalog$timeMachineSnapshot$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Στιγμιότυπο από τη μηχανή του χρόνου';
	@override String get description => 'Καταργήστε τα τοπικά στιγμιότυπα του Time Machine χωρίς να επηρεάσετε τα αντίγραφα ασφαλείας σας.';
}

// Path: myToolsCatalog.loginItems
class _Translations$myToolsCatalog$loginItems$el implements Translations$myToolsCatalog$loginItems$en {
	_Translations$myToolsCatalog$loginItems$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Στοιχεία σύνδεσης';
	@override String get description => 'Διαχειριστείτε τις εφαρμογές που ανοίγουν αυτόματα κατά την εκκίνηση του Mac σας.';
}

// Path: myToolsCatalog.mailAttachments
class _Translations$myToolsCatalog$mailAttachments$el implements Translations$myToolsCatalog$mailAttachments$en {
	_Translations$myToolsCatalog$mailAttachments$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Συνημμένα αλληλογραφίας';
	@override String get description => 'Καταργήστε τα τοπικά αποθηκευμένα συνημμένα email στον ελεύθερο χώρο διατηρώντας τα τροποποιημένα αρχεία.';
}

// Path: myToolsCatalog.malwareFinder
class _Translations$myToolsCatalog$malwareFinder$el implements Translations$myToolsCatalog$malwareFinder$en {
	_Translations$myToolsCatalog$malwareFinder$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Εύρεση κακόβουλου λογισμικού';
	@override String get description => 'Εντοπίστε και αφαιρέστε κακόβουλα στοιχεία για να διατηρήσετε το Mac σας ασφαλές.';
}

// Path: myToolsCatalog.uninstaller
class _Translations$myToolsCatalog$uninstaller$el implements Translations$myToolsCatalog$uninstaller$en {
	_Translations$myToolsCatalog$uninstaller$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Απεγκατάσταση';
	@override String get description => 'Καταργήστε σωστά ολόκληρες εφαρμογές με όλα τα σχετικά αρχεία.';
}

// Path: cleanupCategories.userCache
class _Translations$cleanupCategories$userCache$el implements Translations$cleanupCategories$userCache$en {
	_Translations$cleanupCategories$userCache$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Αρχεία προσωρινής μνήμης χρήστη';
	@override String get description => 'Αρχικά προοριζόταν να βελτιώσει τους χρόνους εκκίνησης, τα αρχεία προσωρινής μνήμης των εφαρμογών σας τελικά συσσωρεύονται και καταλήγουν σε ακατάλληλη λειτουργία ή συνολική πτώση της απόδοσης.';
}

// Path: cleanupCategories.userLogs
class _Translations$cleanupCategories$userLogs$el implements Translations$cleanupCategories$userLogs$en {
	_Translations$cleanupCategories$userLogs$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Αρχεία καταγραφής χρηστών';
	@override String get description => 'Τα αρχεία καταγραφής δημιουργούνται από το macOS και τις εφαρμογές του για την καταγραφή συμβάντων και σφαλμάτων. Με τον καιρό μπορούν να μεγαλώσουν και να καταλάβουν σημαντικό χώρο.';
}

// Path: cleanupCategories.languageFiles
class _Translations$cleanupCategories$languageFiles$el implements Translations$cleanupCategories$languageFiles$en {
	_Translations$cleanupCategories$languageFiles$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Αρχεία Γλώσσας';
	@override String get description => 'Αχρησιμοποίητοι πόροι τοπικής προσαρμογής σε συνδυασμό με εφαρμογές. Η κατάργηση γλωσσών που δεν χρησιμοποιείτε ελευθερώνει χώρο αποθήκευσης χωρίς να επηρεάζεται η λειτουργικότητα.';
}

// Path: cleanupCategories.systemLogs
class _Translations$cleanupCategories$systemLogs$el implements Translations$cleanupCategories$systemLogs$en {
	_Translations$cleanupCategories$systemLogs$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Αρχεία καταγραφής συστήματος';
	@override String get description => 'Αρχεία καταγραφής σε όλο το σύστημα γραμμένα από υπηρεσίες macOS και δαίμονες. Αυτά τα αρχεία είναι ασφαλή να αφαιρεθούν καθώς το σύστημα τα δημιουργεί ξανά όταν χρειάζεται.';
}

// Path: cleanupCategories.brokenLoginItems
class _Translations$cleanupCategories$brokenLoginItems$el implements Translations$cleanupCategories$brokenLoginItems$en {
	_Translations$cleanupCategories$brokenLoginItems$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Κατεστραμμένα στοιχεία σύνδεσης';
	@override String get description => 'Στοιχεία σύνδεσης που παραπέμπουν σε εφαρμογές ή αρχεία που δεν υπάρχουν πλέον στο δίσκο σας. Η κατάργησή τους επιταχύνει τον χρόνο σύνδεσης.';
}

// Path: sections.home.features
class _Translations$sections$home$features$el implements Translations$sections$home$features$en {
	_Translations$sections$home$features$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get systemStatus => 'Ζωντανός παλμός συστήματος';
	@override String get storageUsage => 'Πίεση αποθήκευσης';
	@override String get quickActions => 'Διορθώσεις με ένα πάτημα';
}

// Path: sections.cleanup.features
class _Translations$sections$cleanup$features$el implements Translations$sections$cleanup$features$en {
	_Translations$sections$cleanup$features$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get systemJunk => 'Υπολειμματικά σκουπίδια συστήματος';
	@override String get userCache => 'Φουσκωμένη προσωρινή μνήμη χρήστη';
	@override String get tempFiles => 'Αρχεία Stale Temp';
}

// Path: sections.myClutter.features
class _Translations$sections$myClutter$features$el implements Translations$sections$myClutter$features$en {
	_Translations$sections$myClutter$features$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get largeFiles => 'Space-Hungry Files';
	@override String get duplicates => 'Διπλότυπα συμπλέγματα';
	@override String get largeSimilarImages => 'Σετ φωτογραφιών σχεδόν ταίριασμα';
}

// Path: sections.spaceView.features
class _Translations$sections$spaceView$features$el implements Translations$sections$spaceView$features$en {
	_Translations$sections$spaceView$features$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get visualStorageMap => 'Διαδραστικός χάρτης αποθήκευσης';
	@override String get largeFoldersOverview => 'Σημεία πρόσβασης βαριών φακέλων';
	@override String get hiddenFilesUncovered => 'Κρυφά Στραγγιστήρια Χώρου';
}

// Path: sections.applications.features
class _Translations$sections$applications$features$el implements Translations$sections$applications$features$en {
	_Translations$sections$applications$features$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get appUninstaller => 'Deep App Uninstaller';
	@override String get largeApps => 'Εφαρμογές βαρέων βαρών';
	@override String get fileLeftovers => 'Ορφανά αρχεία υποστήριξης';
}

// Path: sections.myTools.features
class _Translations$sections$myTools$features$el implements Translations$sections$myTools$features$en {
	_Translations$sections$myTools$features$el._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get targetedScanners => 'Στοχευμένοι σαρωτές';
	@override String get quickActions => 'Γρήγορες Ενέργειες';
	@override String get liveFiltering => 'Ζωντανό φιλτράρισμα';
}

/// The flat map containing all translations for locale <el>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEl {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'PristineCleaner',
			'language.label' => 'Γλώσσα',
			'language.english' => 'αγγλικός',
			'language.spanish' => 'ισπανικά',
			'language.italian' => 'ιταλικά',
			'language.french' => 'Γάλλος',
			'language.hebrew' => 'Εβραϊκά',
			'language.greek' => 'ελληνικά',
			'language.portuguese' => 'Πορτογάλος',
			'language.mandarin' => 'Μανταρίνι',
			'navigation.home' => 'Σπίτι',
			'navigation.cleanup' => 'Καθαρισμός',
			'navigation.myClutter' => 'Η ακαταστασία μου',
			'navigation.spaceView' => 'Θέα Διαστήματος',
			'navigation.applications' => 'Εφαρμογές',
			'navigation.myTools' => 'Τα εργαλεία μου',
			'navigation.donate' => 'Δωρεά',
			'sections.home.title' => 'Σπίτι',
			'sections.home.subtitle' => 'Δείτε τα ζωτικά σημεία του υπολογιστή σας με μια ματιά\nκαι εντοπίστε προβλήματα προτού αναπτυχθούν.',
			'sections.home.features.systemStatus' => 'Ζωντανός παλμός συστήματος',
			'sections.home.features.storageUsage' => 'Πίεση αποθήκευσης',
			'sections.home.features.quickActions' => 'Διορθώσεις με ένα πάτημα',
			'sections.cleanup.title' => 'Καθαρισμός σκουπιδιών',
			'sections.cleanup.subtitle' => 'Σαρώστε τα ψηφιακά υπολείμματα για να αποκαταστήσετε\nτην ταχύτητα, τη σταθερότητα και τον πολύτιμο ελεύθερο χώρο.',
			'sections.cleanup.features.systemJunk' => 'Υπολειμματικά σκουπίδια συστήματος',
			'sections.cleanup.features.userCache' => 'Φουσκωμένη προσωρινή μνήμη χρήστη',
			'sections.cleanup.features.tempFiles' => 'Αρχεία Stale Temp',
			'sections.myClutter.title' => 'Η ακαταστασία μου',
			'sections.myClutter.subtitle' => 'Μετατρέψτε τους χαοτικούς φακέλους σε σαφείς αποφάσεις\nμε καθοδηγούμενο καθαρισμό μέσα σε λίγα λεπτά.',
			'sections.myClutter.features.largeFiles' => 'Space-Hungry Files',
			'sections.myClutter.features.duplicates' => 'Διπλότυπα συμπλέγματα',
			'sections.myClutter.features.largeSimilarImages' => 'Σετ φωτογραφιών σχεδόν ταίριασμα',
			'sections.spaceView.title' => 'Θέα Διαστήματος',
			'sections.spaceView.subtitle' => 'Αντιστοιχίστε οπτικά τον δίσκο σας για να εντοπίσετε\nτι είναι πιο σημαντικό και να ελευθερώσετε χώρο πιο γρήγορα.',
			'sections.spaceView.features.visualStorageMap' => 'Διαδραστικός χάρτης αποθήκευσης',
			'sections.spaceView.features.largeFoldersOverview' => 'Σημεία πρόσβασης βαριών φακέλων',
			'sections.spaceView.features.hiddenFilesUncovered' => 'Κρυφά Στραγγιστήρια Χώρου',
			'sections.applications.title' => 'Εφαρμογές',
			'sections.applications.subtitle' => 'Κατακτήστε το αποτύπωμα της εφαρμογής σας.\nΑπεγκαταστήστε καθαρά και αφαιρέστε τα ξεχασμένα υπολείμματα.',
			'sections.applications.features.appUninstaller' => 'Deep App Uninstaller',
			'sections.applications.features.largeApps' => 'Εφαρμογές βαρέων βαρών',
			'sections.applications.features.fileLeftovers' => 'Ορφανά αρχεία υποστήριξης',
			'sections.myTools.title' => 'Τα εργαλεία μου',
			'sections.myTools.subtitle' => 'Το βασικό σας εργαλείο για τη φροντίδα και τη συντήρηση του συστήματος.',
			'sections.myTools.features.targetedScanners' => 'Στοχευμένοι σαρωτές',
			'sections.myTools.features.quickActions' => 'Γρήγορες Ενέργειες',
			'sections.myTools.features.liveFiltering' => 'Ζωντανό φιλτράρισμα',
			'progress.countingFiles' => 'Καταμέτρηση αρχείων...',
			'progress.countingApplications' => 'Καταμέτρηση εφαρμογών...',
			'progress.countingFolders' => 'Καταμέτρηση φακέλων...',
			'errors.itemsFailedToRemove' => 'Η κατάργηση των {count} στοιχείων απέτυχε.',
			'buttons.scan' => 'Σάρωση',
			'buttons.stop' => 'Στάση',
			'buttons.done' => 'Γινώμενος',
			'buttons.clean' => 'Καθαρός',
			'buttons.cleanUp' => 'Εκκαθάριση',
			'buttons.close' => 'Κοντά',
			'buttons.refresh' => 'Φρεσκάρω',
			'buttons.rescan' => 'Εκ νέου σάρωση',
			'buttons.startOver' => 'Ξεκινήστε από την αρχή',
			'buttons.selectAll' => 'Επιλέξτε Όλα',
			'buttons.clearSelection' => 'Εκκαθάριση επιλογής',
			'buttons.keepScanning' => 'Συνεχίστε τη σάρωση',
			'buttons.keepRemoving' => 'Συνεχίστε να αφαιρείτε',
			'tooltips.search' => 'Ερευνα',
			'tooltips.openInFinder' => 'Άνοιγμα στο Finder',
			'dialogs.stopScanningTitle' => 'Διακοπή σάρωσης;',
			'dialogs.stopScanningMessage' => 'Αυτό θα ακυρώσει την τρέχουσα σάρωση και θα απορρίψει οποιαδήποτε μερική πρόοδο.',
			'dialogs.exitConfirmationTitle' => 'Επιβεβαίωση εξόδου',
			'dialogs.exitConfirmationMessage' => 'Εκτελείται σάρωση. Είστε βέβαιοι ότι θέλετε να εξέλθετε;',
			'dialogs.exitConfirmationWait' => 'Περιμένετε',
			'dialogs.exitConfirmationQuit' => 'Έξοδος ούτως ή άλλως',
			'dialogs.stopRemovalTitle' => 'Διακοπή αφαίρεσης;',
			'dialogs.stopRemovalMessage' => 'Το τρέχον αρχείο θα ολοκληρωθεί και, στη συνέχεια, τα υπόλοιπα αρχεία θα παραλειφθούν.',
			'removal.barrierLabel' => 'Πρόοδος αφαίρεσης',
			'removal.preparing' => 'Προετοιμασία...',
			'removal.removingFrom' => 'Αφαίρεση από {title}',
			'removal.stoppingAfterCurrentFile' => 'Διακοπή μετά το τρέχον αρχείο...',
			'removal.keepWindowOpen' => 'Κρατήστε αυτό το παράθυρο ανοιχτό όσο εκτελείται η αφαίρεση.',
			'removal.processedSummary' => '{processed} από {total} υποβλήθηκαν σε επεξεργασία',
			'removal.deletedFreed' => '{deleted} διαγράφηκε • {bytes} ελευθερώθηκε',
			'removal.currentItem' => 'Τρέχον: {name}',
			'removal.stopping' => 'Στάθμευση...',
			'removal.removalFailed' => 'Η αφαίρεση απέτυχε',
			'removal.removalFailedDetails' => 'Κάτι πήγε στραβά κατά την κατάργηση επιλεγμένων αρχείων.',
			'removal.removalStopped' => 'Η αφαίρεση σταμάτησε',
			'removal.removalComplete' => 'Η αφαίρεση ολοκληρώθηκε',
			'removal.deletedSummary' => 'Ο {title} διέγραψε {count} στοιχεία',
			'removal.freedSummary' => '{bytes} ελευθερώθηκε',
			'removal.failedToRemoveSummary' => 'Η κατάργηση των {count} στοιχείων απέτυχε.',
			'removal.deletedFiles' => 'Διαγραμμένα αρχεία',
			'removal.noFilesDeleted' => 'Κανένα αρχείο δεν διαγράφηκε.',
			'done.allCleanedTitle' => 'Όλα καθαρισμένα!',
			'done.movedToTrashMessage' => 'Τα επιλεγμένα αρχεία έχουν μετακινηθεί στον Κάδο απορριμμάτων.',
			'done.applicationsRemovedTitle' => 'Οι αιτήσεις καταργήθηκαν!',
			'done.appsMovedToTrashMessage' => 'Οι επιλεγμένες εφαρμογές έχουν μετακινηθεί στον Κάδο απορριμμάτων.',
			'donate.title' => 'Υποστηριξτε το PristineCleaner',
			'donate.subtitle' => 'Αν το PristineCleaner σας βοηθα να κρατατε το συστημα καθαρο, μπορειτε να υποστηριξετε την αναπτυξη με μια μικρη δωρεα.',
			'donate.buyMeACoffee' => 'Buy Me a Coffee',
			'donate.paypalDonate' => 'Δωρεα με PayPal',
			'donate.openLinkFailed' => 'Δεν ηταν δυνατο το ανοιγμα του συνδεσμου δωρεας.',
			'cleanupManager.title' => 'Υπεύθυνος καθαρισμού',
			'cleanupManager.systemJunkHeader' => 'Σκουπίδια συστήματος',
			'cleanupManager.systemJunkDescription' => 'Περιττά αρχεία που φράζουν την αποθήκευση της συσκευής και εμποδίζουν τη βέλτιστη απόδοση.',
			'cleanupManager.selectLabel' => 'Επιλέγω',
			'cleanupManager.selectAllOption' => 'Ολοι',
			'cleanupManager.selectNoneOption' => 'Κανένας',
			'cleanupManager.noItems' => 'Δεν υπάρχουν στοιχεία',
			'cleanupManager.noItemsFound' => 'Δεν βρέθηκαν στοιχεία',
			'cleanupManager.itemsSelected' => 'Επιλέχθηκαν {count} στοιχεία',
			'projectDirectory.chooseFolder' => 'Επιλέξτε Φάκελο...',
			'projectDirectory.chooseProjectDirectory' => 'Επιλέξτε κατάλογο έργου',
			'projectDirectory.chooseParentFolder' => 'Επιλέξτε γονικό φάκελο',
			'projectDirectory.noFolder' => 'Χωρίς φάκελο',
			'searchAndSort.searchHint' => 'Ερευνα...',
			'searchAndSort.sortBy' => 'Ταξινόμηση κατά',
			'searchAndSort.size' => 'Μέγεθος',
			'searchAndSort.name' => 'Ονομα',
			'searchAndSort.ascending' => 'Αύξουσα',
			'searchAndSort.descending' => 'Φθίνων',
			'spaceView.noFoldersFound' => 'Δεν βρέθηκαν φάκελοι για αυτό το επίπεδο',
			'spaceView.noBubblesToRender' => 'Δεν υπάρχουν φυσαλίδες για απόδοση',
			'spaceView.otherItems' => 'Άλλα είδη',
			'home.refresh' => 'Φρεσκάρω',
			'home.unableToReadDiskInfo' => 'Δεν είναι δυνατή η ανάγνωση των πληροφοριών του δίσκου',
			'home.totalStorage' => 'Συνολικός χώρος αποθήκευσης',
			'home.used' => 'Μεταχειρισμένος',
			'home.available' => 'Διαθέσιμος',
			'home.percentUsed' => '{percent}% χρησιμοποιείται',
			'home.cpuUsage' => 'Χρήση CPU',
			'home.ramUsage' => 'Χρήση RAM',
			'home.memoryPercentUsed' => '{percent}% RAM που χρησιμοποιείται',
			'home.unableToReadSystemInfo' => 'Δεν είναι δυνατή η ανάγνωση πληροφοριών συστήματος',
			'myToolsPage.title' => 'Τα εργαλεία μου',
			'myToolsPage.subtitle' => 'Τα βασικά εργαλεία σας για να διατηρείτε το Mac σας καθαρό, ασφαλές και να λειτουργεί ομαλά.',
			'myToolsPage.backToTools' => 'Επιστροφή στα εργαλεία',
			'myToolsMessages.itemsWithSize' => '{count} αντικείμενο(α) • {size}',
			'myToolsMessages.scanCancelled' => 'η σάρωση ακυρώθηκε.',
			'myToolsMessages.selectAtLeastOne' => 'Επιλέξτε τουλάχιστον ένα αντικείμενο για καθαρισμό.',
			'myToolsMessages.failedToClean' => 'Αποτυχία καθαρισμού {count} αντικειμένων.',
			'myToolsMessages.everythingSelectedCleaned' => 'Όλα τα επιλεγμένα καθαρίστηκαν.',
			'myToolsMessages.cleanupUpdated' => 'Η εκκαθάριση ενημερώθηκε.',
			'myToolsMessages.cleanedCount' => 'Καθαρίστηκαν {count} αντικείμενο(α).',
			'myToolsMessages.stoppedPrefix' => 'Σταμάτησε.',
			'myToolsMessages.removedCount' => 'Καταργήθηκαν {count} στοιχεία.',
			'myToolsMessages.failedCountShort' => '{count} απέτυχε.',
			'myToolsMessages.scanComplete' => 'Η σάρωση ολοκληρώθηκε.',
			'myToolsMessages.somethingWentWrong' => 'Κάτι πήγε στραβά.',
			'myToolsMessages.fallback.downloadsTidy' => 'Οι λήψεις είναι τακτοποιημένες.',
			'myToolsMessages.fallback.noOversizedStale' => 'Δεν βρέθηκαν μεγάλα μπαγιάτικα αρχεία.',
			'myToolsMessages.fallback.noRecentDuplicates' => 'Δεν βρέθηκαν πρόσφατα διπλότυπα.',
			'myToolsMessages.fallback.noSimilarLargeImages' => 'Δεν βρέθηκαν παρόμοιες μεγάλες εικόνες.',
			'myToolsMessages.fallback.noAppLeftovers' => 'Δεν βρέθηκαν υπολείμματα αφαιρούμενης εφαρμογής.',
			'myToolsMessages.fallback.noStaleApps' => 'Δεν βρέθηκαν παλιές εφαρμογές.',
			'myToolsMessages.fallback.appsNeedReview' => 'Βρέθηκαν εφαρμογές που μπορεί να χρειάζονται έλεγχο.',
			'myToolsMessages.fallback.noSystemJunkCandidates' => 'Δεν υπάρχουν υποψήφιοι καθαρισμού στα σκουπίδια συστήματος.',
			'myToolsMessages.fallback.noBrokenStartup' => 'Δεν βρέθηκαν κατεστραμμένες εγγραφές εκκίνησης/παρασκηνίου.',
			'myToolsMessages.fallback.noBackgroundItems' => 'Δεν βρέθηκαν στοιχεία φόντου.',
			'myToolsMessages.fallback.noPrivacyTraces' => 'Δεν βρέθηκαν ίχνη απορρήτου σε γνωστές τοποθεσίες.',
			'myToolsMessages.fallback.trashAlreadyEmpty' => 'Ο κάδος απορριμμάτων είναι ήδη άδειος.',
			'myToolsMessages.fallback.noPermissionCache' => 'Δεν βρέθηκαν αρχεία προσωρινής μνήμης αδειών.',
			'myToolsMessages.fallback.noTimeMachineSnapshots' => 'Δεν βρέθηκαν τοπικά στιγμιότυπα του Time Machine.',
			'myToolsMessages.fallback.noMaintenanceCandidates' => 'Δεν βρέθηκαν υποψήφιοι συντήρησης.',
			'myToolsMessages.fallback.noMailAttachments' => 'Δεν βρέθηκαν αφαιρούμενα συνημμένα αλληλογραφίας.',
			'myToolsMessages.fallback.noSuspiciousFiles' => 'Δεν εντοπίστηκαν ύποπτα αρχεία.',
			'myToolsCatalog.appLeftovers.title' => 'Υπολείμματα εφαρμογής',
			'myToolsCatalog.appLeftovers.description' => 'Εντοπίστε και αφαιρέστε τα υπολείμματα εφαρμογών ακόμα κι αν η κύρια εφαρμογή έχει ήδη φύγει.',
			'myToolsCatalog.backgroundItems.title' => 'Στοιχεία φόντου',
			'myToolsCatalog.backgroundItems.description' => 'Διαχειριστείτε εφαρμογές παρασκηνίου και διεργασίες που εκτελούνται στο Mac σας.',
			'myToolsCatalog.downloads.title' => 'Λήψεις',
			'myToolsCatalog.downloads.description' => 'Ελέγξτε και καθαρίστε τα αρχεία μίας χρήσης από τις Λήψεις για να διατηρείτε τους φακέλους τακτοποιημένους.',
			'myToolsCatalog.largeOld.title' => 'Μεγάλα και παλιά αρχεία',
			'myToolsCatalog.largeOld.description' => 'Βρείτε και αφαιρέστε μεγάλα, αχρησιμοποίητα αρχεία που καταλαμβάνουν χώρο στο Mac σας.',
			'myToolsCatalog.similarImages.title' => 'Παρόμοιες Εικόνες',
			'myToolsCatalog.similarImages.description' => 'Ελέγξτε παρόμοιες φωτογραφίες και κρατήστε μόνο τις καλύτερες.',
			'myToolsCatalog.trashBins.title' => 'Κάδοι απορριμμάτων',
			'myToolsCatalog.trashBins.description' => 'Αδειάστε όλους τους διαθέσιμους κάδους απορριμμάτων στο Mac σας.',
			'myToolsCatalog.duplicateFinder.title' => 'Διπλότυπο Finder',
			'myToolsCatalog.duplicateFinder.description' => 'Καταργήστε τα διπλά αρχεία που είναι αποθηκευμένα σε διαφορετικές τοποθεσίες στο Mac σας.',
			'myToolsCatalog.applicationPermissions.title' => 'Δικαιώματα εφαρμογής',
			'myToolsCatalog.applicationPermissions.description' => 'Διαχειριστείτε τον τρόπο πρόσβασης των εφαρμογών σε λειτουργίες, συσκευές και λειτουργίες συστήματος.',
			'myToolsCatalog.systemJunk.title' => 'Σκουπίδια συστήματος',
			'myToolsCatalog.systemJunk.description' => 'Καταργήστε τα περιττά αρχεία που φράζουν την αποθήκευση της συσκευής και εμποδίζουν τη βέλτιστη απόδοση.',
			'myToolsCatalog.timeMachineSnapshot.title' => 'Στιγμιότυπο από τη μηχανή του χρόνου',
			'myToolsCatalog.timeMachineSnapshot.description' => 'Καταργήστε τα τοπικά στιγμιότυπα του Time Machine χωρίς να επηρεάσετε τα αντίγραφα ασφαλείας σας.',
			'myToolsCatalog.loginItems.title' => 'Στοιχεία σύνδεσης',
			'myToolsCatalog.loginItems.description' => 'Διαχειριστείτε τις εφαρμογές που ανοίγουν αυτόματα κατά την εκκίνηση του Mac σας.',
			'myToolsCatalog.mailAttachments.title' => 'Συνημμένα αλληλογραφίας',
			'myToolsCatalog.mailAttachments.description' => 'Καταργήστε τα τοπικά αποθηκευμένα συνημμένα email στον ελεύθερο χώρο διατηρώντας τα τροποποιημένα αρχεία.',
			'myToolsCatalog.malwareFinder.title' => 'Εύρεση κακόβουλου λογισμικού',
			'myToolsCatalog.malwareFinder.description' => 'Εντοπίστε και αφαιρέστε κακόβουλα στοιχεία για να διατηρήσετε το Mac σας ασφαλές.',
			'myToolsCatalog.uninstaller.title' => 'Απεγκατάσταση',
			'myToolsCatalog.uninstaller.description' => 'Καταργήστε σωστά ολόκληρες εφαρμογές με όλα τα σχετικά αρχεία.',
			'cleanupCategories.userCache.name' => 'Αρχεία προσωρινής μνήμης χρήστη',
			'cleanupCategories.userCache.description' => 'Αρχικά προοριζόταν να βελτιώσει τους χρόνους εκκίνησης, τα αρχεία προσωρινής μνήμης των εφαρμογών σας τελικά συσσωρεύονται και καταλήγουν σε ακατάλληλη λειτουργία ή συνολική πτώση της απόδοσης.',
			'cleanupCategories.userLogs.name' => 'Αρχεία καταγραφής χρηστών',
			'cleanupCategories.userLogs.description' => 'Τα αρχεία καταγραφής δημιουργούνται από το macOS και τις εφαρμογές του για την καταγραφή συμβάντων και σφαλμάτων. Με τον καιρό μπορούν να μεγαλώσουν και να καταλάβουν σημαντικό χώρο.',
			'cleanupCategories.languageFiles.name' => 'Αρχεία Γλώσσας',
			'cleanupCategories.languageFiles.description' => 'Αχρησιμοποίητοι πόροι τοπικής προσαρμογής σε συνδυασμό με εφαρμογές. Η κατάργηση γλωσσών που δεν χρησιμοποιείτε ελευθερώνει χώρο αποθήκευσης χωρίς να επηρεάζεται η λειτουργικότητα.',
			'cleanupCategories.systemLogs.name' => 'Αρχεία καταγραφής συστήματος',
			'cleanupCategories.systemLogs.description' => 'Αρχεία καταγραφής σε όλο το σύστημα γραμμένα από υπηρεσίες macOS και δαίμονες. Αυτά τα αρχεία είναι ασφαλή να αφαιρεθούν καθώς το σύστημα τα δημιουργεί ξανά όταν χρειάζεται.',
			'cleanupCategories.brokenLoginItems.name' => 'Κατεστραμμένα στοιχεία σύνδεσης',
			'cleanupCategories.brokenLoginItems.description' => 'Στοιχεία σύνδεσης που παραπέμπουν σε εφαρμογές ή αρχεία που δεν υπάρχουν πλέον στο δίσκο σας. Η κατάργησή τους επιταχύνει τον χρόνο σύνδεσης.',
			'myClutterDashboard.backToCategories' => 'Επιστροφή στις Κατηγορίες',
			'myClutterDashboard.filesToSort' => 'Έχετε {count} αρχεία για ταξινόμηση.',
			'myClutterDashboard.quickRecommendations' => 'Χρησιμοποιήστε γρήγορες συστάσεις ή αναθεωρήστε τις με το χέρι.',
			'myClutterDashboard.reviewAllFiles' => 'Ελέγξτε όλα τα αρχεία',
			'myClutterDashboard.freshDuplicatesFound' => '{count} Βρέθηκαν νέα διπλότυπα',
			'myClutterDashboard.noDuplicates' => 'Δεν βρέθηκαν διπλότυπα σε αυτήν τη σάρωση.',
			'myClutterDashboard.removeDuplicateBytes' => 'Καταργήστε {bytes} διπλότυπα αρχεία.',
			'myClutterDashboard.largeSimilarImagesFound' => '{count} Βρέθηκαν Μεγάλες Παρόμοιες Εικόνες',
			'myClutterDashboard.noSimilarGroups' => 'Δεν βρέθηκαν παρόμοιες ομάδες εικόνων.',
			'myClutterDashboard.nearlyIdenticalImages' => 'Υπάρχουν {bytes} σχεδόν πανομοιότυπες εικόνες.',
			'myClutterDashboard.largeFilesFound' => '{bytes} Βρέθηκαν μεγάλα αρχεία',
			'myClutterDashboard.noLargeFiles' => 'Δεν βρέθηκαν μεγάλα αρχεία.',
			'myClutterDashboard.largeFilesReady' => '{count} μεγάλα αρχεία είναι έτοιμα για έλεγχο.',
			'myClutterDashboard.review' => 'Κριτική',
			'scanResults.itemsSummary' => '{count} αντικείμενα • {size}',
			'scanResults.scannedInMs' => 'Σαρώθηκε σε {ms}ms',
			'scanResults.deselectAll' => 'Καταργήστε την επιλογή όλων',
			'scanResults.selectAll' => 'Επιλέξτε Όλα',
			'scanResults.noItemsMatchSearch' => 'Δεν υπάρχουν στοιχεία που να αντιστοιχούν στην αναζήτησή σας',
			'scanResults.noItemsFound' => 'Δεν βρέθηκαν στοιχεία',
			'scanResults.itemsSelected' => 'Επιλέχθηκαν {count} στοιχεία',
			'scanResults.rescan' => 'Εκ νέου σάρωση',
			'spaceViewStart.subtitle' => 'Επιλέξτε έναν γονικό φάκελο και, στη συνέχεια, σαρώστε για να χαρτογραφήσετε αυτό που καταλαμβάνει τον περισσότερο χώρο.',
			'spaceViewStart.defaultRootPath' => 'Η προεπιλεγμένη διαδρομή ρίζας είναι ο κύριος σκληρός σας δίσκος',
			'spaceViewStart.exploreBubbles' => 'Εξερευνήστε τα μεγέθη φακέλων μέσω διαδραστικών φυσαλίδων',
			'spaceViewStart.clickToDrillDown' => 'Κάντε κλικ στους φακέλους για να διερευνήσετε και να ελέγξετε βαθύτερα',
			'shell.comingSoon' => 'Προσεχώς',
			'myToolsService.snapshotName' => 'Στιγμιότυπο {id}',
			'myToolsService.timeMachineGroup' => 'Μηχανή του Χρόνου',
			'myToolsService.timeMachineMacOnly' => 'Τα στιγμιότυπα Time Machine είναι διαθέσιμα μόνο στο macOS.',
			_ => null,
		};
	}
}
