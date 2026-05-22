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
	@override late final _TranslationsAppEl app = _TranslationsAppEl._(_root);
	@override late final _TranslationsLanguageEl language = _TranslationsLanguageEl._(_root);
	@override late final _TranslationsNavigationEl navigation = _TranslationsNavigationEl._(_root);
	@override late final _TranslationsSectionsEl sections = _TranslationsSectionsEl._(_root);
	@override late final _TranslationsProgressEl progress = _TranslationsProgressEl._(_root);
	@override late final _TranslationsErrorsEl errors = _TranslationsErrorsEl._(_root);
	@override late final _TranslationsButtonsEl buttons = _TranslationsButtonsEl._(_root);
	@override late final _TranslationsTooltipsEl tooltips = _TranslationsTooltipsEl._(_root);
	@override late final _TranslationsDialogsEl dialogs = _TranslationsDialogsEl._(_root);
	@override late final _TranslationsRemovalEl removal = _TranslationsRemovalEl._(_root);
	@override late final _TranslationsDoneEl done = _TranslationsDoneEl._(_root);
	@override late final _TranslationsCleanupManagerEl cleanupManager = _TranslationsCleanupManagerEl._(_root);
	@override late final _TranslationsProjectDirectoryEl projectDirectory = _TranslationsProjectDirectoryEl._(_root);
	@override late final _TranslationsSearchAndSortEl searchAndSort = _TranslationsSearchAndSortEl._(_root);
	@override late final _TranslationsSpaceViewEl spaceView = _TranslationsSpaceViewEl._(_root);
	@override late final _TranslationsSmartCareEl smartCare = _TranslationsSmartCareEl._(_root);
	@override late final _TranslationsMyToolsPageEl myToolsPage = _TranslationsMyToolsPageEl._(_root);
	@override late final _TranslationsMyToolsMessagesEl myToolsMessages = _TranslationsMyToolsMessagesEl._(_root);
	@override late final _TranslationsMyToolsCatalogEl myToolsCatalog = _TranslationsMyToolsCatalogEl._(_root);
	@override late final _TranslationsCleanupCategoriesEl cleanupCategories = _TranslationsCleanupCategoriesEl._(_root);
	@override late final _TranslationsMyClutterDashboardEl myClutterDashboard = _TranslationsMyClutterDashboardEl._(_root);
	@override late final _TranslationsScanResultsEl scanResults = _TranslationsScanResultsEl._(_root);
	@override late final _TranslationsSpaceViewStartEl spaceViewStart = _TranslationsSpaceViewStartEl._(_root);
	@override late final _TranslationsShellEl shell = _TranslationsShellEl._(_root);
	@override late final _TranslationsMyToolsServiceEl myToolsService = _TranslationsMyToolsServiceEl._(_root);
}

// Path: app
class _TranslationsAppEl implements TranslationsAppEn {
	_TranslationsAppEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'PristineCleaner';
}

// Path: language
class _TranslationsLanguageEl implements TranslationsLanguageEn {
	_TranslationsLanguageEl._(this._root);

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
class _TranslationsNavigationEl implements TranslationsNavigationEn {
	_TranslationsNavigationEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get smartCare => 'Έξυπνη Φροντίδα';
	@override String get cleanup => 'Καθαρισμός';
	@override String get myClutter => 'Η ακαταστασία μου';
	@override String get spaceView => 'Θέα Διαστήματος';
	@override String get applications => 'Εφαρμογές';
	@override String get myTools => 'Τα εργαλεία μου';
	@override String get myActivity => 'Η δραστηριότητά μου';
}

// Path: sections
class _TranslationsSectionsEl implements TranslationsSectionsEn {
	_TranslationsSectionsEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSectionsSmartCareEl smartCare = _TranslationsSectionsSmartCareEl._(_root);
	@override late final _TranslationsSectionsCleanupEl cleanup = _TranslationsSectionsCleanupEl._(_root);
	@override late final _TranslationsSectionsMyClutterEl myClutter = _TranslationsSectionsMyClutterEl._(_root);
	@override late final _TranslationsSectionsSpaceViewEl spaceView = _TranslationsSectionsSpaceViewEl._(_root);
	@override late final _TranslationsSectionsApplicationsEl applications = _TranslationsSectionsApplicationsEl._(_root);
	@override late final _TranslationsSectionsMyToolsEl myTools = _TranslationsSectionsMyToolsEl._(_root);
}

// Path: progress
class _TranslationsProgressEl implements TranslationsProgressEn {
	_TranslationsProgressEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get countingFiles => 'Καταμέτρηση αρχείων...';
	@override String get countingApplications => 'Καταμέτρηση εφαρμογών...';
	@override String get countingFolders => 'Καταμέτρηση φακέλων...';
}

// Path: errors
class _TranslationsErrorsEl implements TranslationsErrorsEn {
	_TranslationsErrorsEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get itemsFailedToRemove => 'Η κατάργηση των {count} στοιχείων απέτυχε.';
}

// Path: buttons
class _TranslationsButtonsEl implements TranslationsButtonsEn {
	_TranslationsButtonsEl._(this._root);

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
class _TranslationsTooltipsEl implements TranslationsTooltipsEn {
	_TranslationsTooltipsEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get search => 'Ερευνα';
	@override String get openInFinder => 'Άνοιγμα στο Finder';
}

// Path: dialogs
class _TranslationsDialogsEl implements TranslationsDialogsEn {
	_TranslationsDialogsEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get stopScanningTitle => 'Διακοπή σάρωσης;';
	@override String get stopScanningMessage => 'Αυτό θα ακυρώσει την τρέχουσα σάρωση και θα απορρίψει οποιαδήποτε μερική πρόοδο.';
	@override String get stopRemovalTitle => 'Διακοπή αφαίρεσης;';
	@override String get stopRemovalMessage => 'Το τρέχον αρχείο θα ολοκληρωθεί και, στη συνέχεια, τα υπόλοιπα αρχεία θα παραλειφθούν.';
}

// Path: removal
class _TranslationsRemovalEl implements TranslationsRemovalEn {
	_TranslationsRemovalEl._(this._root);

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
class _TranslationsDoneEl implements TranslationsDoneEn {
	_TranslationsDoneEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get allCleanedTitle => 'Όλα καθαρισμένα!';
	@override String get movedToTrashMessage => 'Τα επιλεγμένα αρχεία έχουν μετακινηθεί στον Κάδο απορριμμάτων.';
	@override String get applicationsRemovedTitle => 'Οι αιτήσεις καταργήθηκαν!';
	@override String get appsMovedToTrashMessage => 'Οι επιλεγμένες εφαρμογές έχουν μετακινηθεί στον Κάδο απορριμμάτων.';
}

// Path: cleanupManager
class _TranslationsCleanupManagerEl implements TranslationsCleanupManagerEn {
	_TranslationsCleanupManagerEl._(this._root);

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
class _TranslationsProjectDirectoryEl implements TranslationsProjectDirectoryEn {
	_TranslationsProjectDirectoryEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get chooseFolder => 'Επιλέξτε Φάκελο...';
	@override String get chooseProjectDirectory => 'Επιλέξτε κατάλογο έργου';
	@override String get chooseParentFolder => 'Επιλέξτε γονικό φάκελο';
	@override String get noFolder => 'Χωρίς φάκελο';
}

// Path: searchAndSort
class _TranslationsSearchAndSortEl implements TranslationsSearchAndSortEn {
	_TranslationsSearchAndSortEl._(this._root);

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
class _TranslationsSpaceViewEl implements TranslationsSpaceViewEn {
	_TranslationsSpaceViewEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get noFoldersFound => 'Δεν βρέθηκαν φάκελοι για αυτό το επίπεδο';
	@override String get noBubblesToRender => 'Δεν υπάρχουν φυσαλίδες για απόδοση';
	@override String get otherItems => 'Άλλα είδη';
}

// Path: smartCare
class _TranslationsSmartCareEl implements TranslationsSmartCareEn {
	_TranslationsSmartCareEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get refresh => 'Φρεσκάρω';
	@override String get unableToReadDiskInfo => 'Δεν είναι δυνατή η ανάγνωση των πληροφοριών του δίσκου';
	@override String get totalStorage => 'Συνολική αποθήκευση';
	@override String get used => 'Μεταχειρισμένος';
	@override String get available => 'Διαθέσιμος';
	@override String get percentUsed => '{percent}% χρησιμοποιείται';
}

// Path: myToolsPage
class _TranslationsMyToolsPageEl implements TranslationsMyToolsPageEn {
	_TranslationsMyToolsPageEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Τα εργαλεία μου';
	@override String get subtitle => 'Τα βασικά εργαλεία σας για να διατηρείτε το Mac σας καθαρό, ασφαλές και να λειτουργεί ομαλά.';
	@override String get backToTools => 'Επιστροφή στα εργαλεία';
}

// Path: myToolsMessages
class _TranslationsMyToolsMessagesEl implements TranslationsMyToolsMessagesEn {
	_TranslationsMyToolsMessagesEl._(this._root);

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
	@override late final _TranslationsMyToolsMessagesFallbackEl fallback = _TranslationsMyToolsMessagesFallbackEl._(_root);
}

// Path: myToolsCatalog
class _TranslationsMyToolsCatalogEl implements TranslationsMyToolsCatalogEn {
	_TranslationsMyToolsCatalogEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMyToolsCatalogAppLeftoversEl appLeftovers = _TranslationsMyToolsCatalogAppLeftoversEl._(_root);
	@override late final _TranslationsMyToolsCatalogBackgroundItemsEl backgroundItems = _TranslationsMyToolsCatalogBackgroundItemsEl._(_root);
	@override late final _TranslationsMyToolsCatalogDownloadsEl downloads = _TranslationsMyToolsCatalogDownloadsEl._(_root);
	@override late final _TranslationsMyToolsCatalogLargeOldEl largeOld = _TranslationsMyToolsCatalogLargeOldEl._(_root);
	@override late final _TranslationsMyToolsCatalogAppUpdaterEl appUpdater = _TranslationsMyToolsCatalogAppUpdaterEl._(_root);
	@override late final _TranslationsMyToolsCatalogSimilarImagesEl similarImages = _TranslationsMyToolsCatalogSimilarImagesEl._(_root);
	@override late final _TranslationsMyToolsCatalogPrivacyItemsEl privacyItems = _TranslationsMyToolsCatalogPrivacyItemsEl._(_root);
	@override late final _TranslationsMyToolsCatalogTrashBinsEl trashBins = _TranslationsMyToolsCatalogTrashBinsEl._(_root);
	@override late final _TranslationsMyToolsCatalogDuplicateFinderEl duplicateFinder = _TranslationsMyToolsCatalogDuplicateFinderEl._(_root);
	@override late final _TranslationsMyToolsCatalogApplicationPermissionsEl applicationPermissions = _TranslationsMyToolsCatalogApplicationPermissionsEl._(_root);
	@override late final _TranslationsMyToolsCatalogSystemJunkEl systemJunk = _TranslationsMyToolsCatalogSystemJunkEl._(_root);
	@override late final _TranslationsMyToolsCatalogTimeMachineSnapshotEl timeMachineSnapshot = _TranslationsMyToolsCatalogTimeMachineSnapshotEl._(_root);
	@override late final _TranslationsMyToolsCatalogMaintenanceTasksEl maintenanceTasks = _TranslationsMyToolsCatalogMaintenanceTasksEl._(_root);
	@override late final _TranslationsMyToolsCatalogLoginItemsEl loginItems = _TranslationsMyToolsCatalogLoginItemsEl._(_root);
	@override late final _TranslationsMyToolsCatalogMailAttachmentsEl mailAttachments = _TranslationsMyToolsCatalogMailAttachmentsEl._(_root);
	@override late final _TranslationsMyToolsCatalogMalwareFinderEl malwareFinder = _TranslationsMyToolsCatalogMalwareFinderEl._(_root);
	@override late final _TranslationsMyToolsCatalogUninstallerEl uninstaller = _TranslationsMyToolsCatalogUninstallerEl._(_root);
}

// Path: cleanupCategories
class _TranslationsCleanupCategoriesEl implements TranslationsCleanupCategoriesEn {
	_TranslationsCleanupCategoriesEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsCleanupCategoriesUserCacheEl userCache = _TranslationsCleanupCategoriesUserCacheEl._(_root);
	@override late final _TranslationsCleanupCategoriesUserLogsEl userLogs = _TranslationsCleanupCategoriesUserLogsEl._(_root);
	@override late final _TranslationsCleanupCategoriesLanguageFilesEl languageFiles = _TranslationsCleanupCategoriesLanguageFilesEl._(_root);
	@override late final _TranslationsCleanupCategoriesSystemLogsEl systemLogs = _TranslationsCleanupCategoriesSystemLogsEl._(_root);
	@override late final _TranslationsCleanupCategoriesBrokenLoginItemsEl brokenLoginItems = _TranslationsCleanupCategoriesBrokenLoginItemsEl._(_root);
}

// Path: myClutterDashboard
class _TranslationsMyClutterDashboardEl implements TranslationsMyClutterDashboardEn {
	_TranslationsMyClutterDashboardEl._(this._root);

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
class _TranslationsScanResultsEl implements TranslationsScanResultsEn {
	_TranslationsScanResultsEl._(this._root);

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
class _TranslationsSpaceViewStartEl implements TranslationsSpaceViewStartEn {
	_TranslationsSpaceViewStartEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get subtitle => 'Επιλέξτε έναν γονικό φάκελο και, στη συνέχεια, σαρώστε για να χαρτογραφήσετε αυτό που καταλαμβάνει τον περισσότερο χώρο.';
	@override String get defaultRootPath => 'Η προεπιλεγμένη διαδρομή ρίζας είναι ο κύριος σκληρός σας δίσκος';
	@override String get exploreBubbles => 'Εξερευνήστε τα μεγέθη φακέλων μέσω διαδραστικών φυσαλίδων';
	@override String get clickToDrillDown => 'Κάντε κλικ στους φακέλους για να διερευνήσετε και να ελέγξετε βαθύτερα';
}

// Path: shell
class _TranslationsShellEl implements TranslationsShellEn {
	_TranslationsShellEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get comingSoon => 'Προσεχώς';
}

// Path: myToolsService
class _TranslationsMyToolsServiceEl implements TranslationsMyToolsServiceEn {
	_TranslationsMyToolsServiceEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get snapshotName => 'Στιγμιότυπο {id}';
	@override String get timeMachineGroup => 'Μηχανή του Χρόνου';
	@override String get timeMachineMacOnly => 'Τα στιγμιότυπα Time Machine είναι διαθέσιμα μόνο στο macOS.';
}

// Path: sections.smartCare
class _TranslationsSectionsSmartCareEl implements TranslationsSectionsSmartCareEn {
	_TranslationsSectionsSmartCareEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Έξυπνη Φροντίδα';
	@override String get subtitle => 'Αποκτήστε μια πλήρη επισκόπηση υγείας\nτου συστήματός σας με ένα κλικ.';
	@override late final _TranslationsSectionsSmartCareFeaturesEl features = _TranslationsSectionsSmartCareFeaturesEl._(_root);
}

// Path: sections.cleanup
class _TranslationsSectionsCleanupEl implements TranslationsSectionsCleanupEn {
	_TranslationsSectionsCleanupEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Καθαρισμός σκουπιδιών';
	@override String get subtitle => 'Καθαρίστε το σύστημά σας για να επιτύχετε τη μέγιστη\nαπόδοση και να αποκτήσετε ξανά περισσότερο ελεύθερο χώρο.';
	@override late final _TranslationsSectionsCleanupFeaturesEl features = _TranslationsSectionsCleanupFeaturesEl._(_root);
}

// Path: sections.myClutter
class _TranslationsSectionsMyClutterEl implements TranslationsSectionsMyClutterEn {
	_TranslationsSectionsMyClutterEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Η ακαταστασία μου';
	@override String get subtitle => 'Ταξινομήστε τα αρχεία σας και μειώστε\nτο χάος με λίγα μόνο κλικ.';
	@override late final _TranslationsSectionsMyClutterFeaturesEl features = _TranslationsSectionsMyClutterFeaturesEl._(_root);
}

// Path: sections.spaceView
class _TranslationsSectionsSpaceViewEl implements TranslationsSectionsSpaceViewEn {
	_TranslationsSectionsSpaceViewEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Θέα Διαστήματος';
	@override String get subtitle => 'Οραματιστείτε τι καταλαμβάνει τον περισσότερο χώρο στον δίσκο και καθαρίστε γρήγορα.';
	@override late final _TranslationsSectionsSpaceViewFeaturesEl features = _TranslationsSectionsSpaceViewFeaturesEl._(_root);
}

// Path: sections.applications
class _TranslationsSectionsApplicationsEl implements TranslationsSectionsApplicationsEn {
	_TranslationsSectionsApplicationsEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Εφαρμογές';
	@override String get subtitle => 'Πάρτε τον έλεγχο των εφαρμογών σας.\nΑπεγκαταστήστε ή αφαιρέστε παλιά υπολείμματα.';
	@override late final _TranslationsSectionsApplicationsFeaturesEl features = _TranslationsSectionsApplicationsFeaturesEl._(_root);
}

// Path: sections.myTools
class _TranslationsSectionsMyToolsEl implements TranslationsSectionsMyToolsEn {
	_TranslationsSectionsMyToolsEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Τα εργαλεία μου';
	@override String get subtitle => 'Το βασικό σας εργαλείο για τη φροντίδα και τη συντήρηση του συστήματος.';
	@override late final _TranslationsSectionsMyToolsFeaturesEl features = _TranslationsSectionsMyToolsFeaturesEl._(_root);
}

// Path: myToolsMessages.fallback
class _TranslationsMyToolsMessagesFallbackEl implements TranslationsMyToolsMessagesFallbackEn {
	_TranslationsMyToolsMessagesFallbackEl._(this._root);

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
class _TranslationsMyToolsCatalogAppLeftoversEl implements TranslationsMyToolsCatalogAppLeftoversEn {
	_TranslationsMyToolsCatalogAppLeftoversEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Υπολείμματα εφαρμογής';
	@override String get description => 'Εντοπίστε και αφαιρέστε τα υπολείμματα εφαρμογών ακόμα κι αν η κύρια εφαρμογή έχει ήδη φύγει.';
}

// Path: myToolsCatalog.backgroundItems
class _TranslationsMyToolsCatalogBackgroundItemsEl implements TranslationsMyToolsCatalogBackgroundItemsEn {
	_TranslationsMyToolsCatalogBackgroundItemsEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Στοιχεία φόντου';
	@override String get description => 'Διαχειριστείτε εφαρμογές παρασκηνίου και διεργασίες που εκτελούνται στο Mac σας.';
}

// Path: myToolsCatalog.downloads
class _TranslationsMyToolsCatalogDownloadsEl implements TranslationsMyToolsCatalogDownloadsEn {
	_TranslationsMyToolsCatalogDownloadsEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Λήψεις';
	@override String get description => 'Ελέγξτε και καθαρίστε τα αρχεία μίας χρήσης από τις Λήψεις για να διατηρείτε τους φακέλους τακτοποιημένους.';
}

// Path: myToolsCatalog.largeOld
class _TranslationsMyToolsCatalogLargeOldEl implements TranslationsMyToolsCatalogLargeOldEn {
	_TranslationsMyToolsCatalogLargeOldEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Μεγάλα και παλιά αρχεία';
	@override String get description => 'Βρείτε και αφαιρέστε μεγάλα, αχρησιμοποίητα αρχεία που καταλαμβάνουν χώρο στο Mac σας.';
}

// Path: myToolsCatalog.appUpdater
class _TranslationsMyToolsCatalogAppUpdaterEl implements TranslationsMyToolsCatalogAppUpdaterEn {
	_TranslationsMyToolsCatalogAppUpdaterEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ενημέρωση εφαρμογών';
	@override String get description => 'Παρακολουθήστε τις πιο πρόσφατες και πιο αξιόπιστες εκδόσεις των εφαρμογών σας.';
}

// Path: myToolsCatalog.similarImages
class _TranslationsMyToolsCatalogSimilarImagesEl implements TranslationsMyToolsCatalogSimilarImagesEn {
	_TranslationsMyToolsCatalogSimilarImagesEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Παρόμοιες Εικόνες';
	@override String get description => 'Ελέγξτε παρόμοιες φωτογραφίες και κρατήστε μόνο τις καλύτερες.';
}

// Path: myToolsCatalog.privacyItems
class _TranslationsMyToolsCatalogPrivacyItemsEl implements TranslationsMyToolsCatalogPrivacyItemsEn {
	_TranslationsMyToolsCatalogPrivacyItemsEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Αντικείμενα απορρήτου';
	@override String get description => 'Καταργήστε το ιστορικό περιήγησης και τα ίχνη δραστηριότητας για να προστατεύσετε το απόρρητό σας.';
}

// Path: myToolsCatalog.trashBins
class _TranslationsMyToolsCatalogTrashBinsEl implements TranslationsMyToolsCatalogTrashBinsEn {
	_TranslationsMyToolsCatalogTrashBinsEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Κάδοι απορριμμάτων';
	@override String get description => 'Αδειάστε όλους τους διαθέσιμους κάδους απορριμμάτων στο Mac σας.';
}

// Path: myToolsCatalog.duplicateFinder
class _TranslationsMyToolsCatalogDuplicateFinderEl implements TranslationsMyToolsCatalogDuplicateFinderEn {
	_TranslationsMyToolsCatalogDuplicateFinderEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Διπλότυπο Finder';
	@override String get description => 'Καταργήστε τα διπλά αρχεία που είναι αποθηκευμένα σε διαφορετικές τοποθεσίες στο Mac σας.';
}

// Path: myToolsCatalog.applicationPermissions
class _TranslationsMyToolsCatalogApplicationPermissionsEl implements TranslationsMyToolsCatalogApplicationPermissionsEn {
	_TranslationsMyToolsCatalogApplicationPermissionsEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Δικαιώματα εφαρμογής';
	@override String get description => 'Διαχειριστείτε τον τρόπο πρόσβασης των εφαρμογών σε λειτουργίες, συσκευές και λειτουργίες συστήματος.';
}

// Path: myToolsCatalog.systemJunk
class _TranslationsMyToolsCatalogSystemJunkEl implements TranslationsMyToolsCatalogSystemJunkEn {
	_TranslationsMyToolsCatalogSystemJunkEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Σκουπίδια συστήματος';
	@override String get description => 'Καταργήστε τα περιττά αρχεία που φράζουν την αποθήκευση της συσκευής και εμποδίζουν τη βέλτιστη απόδοση.';
}

// Path: myToolsCatalog.timeMachineSnapshot
class _TranslationsMyToolsCatalogTimeMachineSnapshotEl implements TranslationsMyToolsCatalogTimeMachineSnapshotEn {
	_TranslationsMyToolsCatalogTimeMachineSnapshotEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Στιγμιότυπο από τη μηχανή του χρόνου';
	@override String get description => 'Καταργήστε τα τοπικά στιγμιότυπα του Time Machine χωρίς να επηρεάσετε τα αντίγραφα ασφαλείας σας.';
}

// Path: myToolsCatalog.maintenanceTasks
class _TranslationsMyToolsCatalogMaintenanceTasksEl implements TranslationsMyToolsCatalogMaintenanceTasksEn {
	_TranslationsMyToolsCatalogMaintenanceTasksEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Εργασίες Συντήρησης';
	@override String get description => 'Εκτελέστε ένα σύνολο συνιστώμενων εργασιών συντήρησης για να φέρετε το Mac σας στο μέγιστο.';
}

// Path: myToolsCatalog.loginItems
class _TranslationsMyToolsCatalogLoginItemsEl implements TranslationsMyToolsCatalogLoginItemsEn {
	_TranslationsMyToolsCatalogLoginItemsEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Στοιχεία σύνδεσης';
	@override String get description => 'Διαχειριστείτε τις εφαρμογές που ανοίγουν αυτόματα κατά την εκκίνηση του Mac σας.';
}

// Path: myToolsCatalog.mailAttachments
class _TranslationsMyToolsCatalogMailAttachmentsEl implements TranslationsMyToolsCatalogMailAttachmentsEn {
	_TranslationsMyToolsCatalogMailAttachmentsEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Συνημμένα αλληλογραφίας';
	@override String get description => 'Καταργήστε τα τοπικά αποθηκευμένα συνημμένα email στον ελεύθερο χώρο διατηρώντας τα τροποποιημένα αρχεία.';
}

// Path: myToolsCatalog.malwareFinder
class _TranslationsMyToolsCatalogMalwareFinderEl implements TranslationsMyToolsCatalogMalwareFinderEn {
	_TranslationsMyToolsCatalogMalwareFinderEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Εύρεση κακόβουλου λογισμικού';
	@override String get description => 'Εντοπίστε και αφαιρέστε κακόβουλα στοιχεία για να διατηρήσετε το Mac σας ασφαλές.';
}

// Path: myToolsCatalog.uninstaller
class _TranslationsMyToolsCatalogUninstallerEl implements TranslationsMyToolsCatalogUninstallerEn {
	_TranslationsMyToolsCatalogUninstallerEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Απεγκατάσταση';
	@override String get description => 'Καταργήστε σωστά ολόκληρες εφαρμογές με όλα τα σχετικά αρχεία.';
}

// Path: cleanupCategories.userCache
class _TranslationsCleanupCategoriesUserCacheEl implements TranslationsCleanupCategoriesUserCacheEn {
	_TranslationsCleanupCategoriesUserCacheEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Αρχεία προσωρινής μνήμης χρήστη';
	@override String get description => 'Αρχικά προοριζόταν να βελτιώσει τους χρόνους εκκίνησης, τα αρχεία προσωρινής μνήμης των εφαρμογών σας τελικά συσσωρεύονται και καταλήγουν σε ακατάλληλη λειτουργία ή συνολική πτώση της απόδοσης.';
}

// Path: cleanupCategories.userLogs
class _TranslationsCleanupCategoriesUserLogsEl implements TranslationsCleanupCategoriesUserLogsEn {
	_TranslationsCleanupCategoriesUserLogsEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Αρχεία καταγραφής χρηστών';
	@override String get description => 'Τα αρχεία καταγραφής δημιουργούνται από το macOS και τις εφαρμογές του για την καταγραφή συμβάντων και σφαλμάτων. Με τον καιρό μπορούν να μεγαλώσουν και να καταλάβουν σημαντικό χώρο.';
}

// Path: cleanupCategories.languageFiles
class _TranslationsCleanupCategoriesLanguageFilesEl implements TranslationsCleanupCategoriesLanguageFilesEn {
	_TranslationsCleanupCategoriesLanguageFilesEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Αρχεία Γλώσσας';
	@override String get description => 'Αχρησιμοποίητοι πόροι τοπικής προσαρμογής σε συνδυασμό με εφαρμογές. Η κατάργηση γλωσσών που δεν χρησιμοποιείτε ελευθερώνει χώρο αποθήκευσης χωρίς να επηρεάζεται η λειτουργικότητα.';
}

// Path: cleanupCategories.systemLogs
class _TranslationsCleanupCategoriesSystemLogsEl implements TranslationsCleanupCategoriesSystemLogsEn {
	_TranslationsCleanupCategoriesSystemLogsEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Αρχεία καταγραφής συστήματος';
	@override String get description => 'Αρχεία καταγραφής σε όλο το σύστημα γραμμένα από υπηρεσίες macOS και δαίμονες. Αυτά τα αρχεία είναι ασφαλή να αφαιρεθούν καθώς το σύστημα τα δημιουργεί ξανά όταν χρειάζεται.';
}

// Path: cleanupCategories.brokenLoginItems
class _TranslationsCleanupCategoriesBrokenLoginItemsEl implements TranslationsCleanupCategoriesBrokenLoginItemsEn {
	_TranslationsCleanupCategoriesBrokenLoginItemsEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Κατεστραμμένα στοιχεία σύνδεσης';
	@override String get description => 'Στοιχεία σύνδεσης που παραπέμπουν σε εφαρμογές ή αρχεία που δεν υπάρχουν πλέον στο δίσκο σας. Η κατάργησή τους επιταχύνει τον χρόνο σύνδεσης.';
}

// Path: sections.smartCare.features
class _TranslationsSectionsSmartCareFeaturesEl implements TranslationsSectionsSmartCareFeaturesEn {
	_TranslationsSectionsSmartCareFeaturesEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get systemStatus => 'Κατάσταση συστήματος';
	@override String get storageUsage => 'Χρήση αποθήκευσης';
	@override String get quickActions => 'Γρήγορες Ενέργειες';
}

// Path: sections.cleanup.features
class _TranslationsSectionsCleanupFeaturesEl implements TranslationsSectionsCleanupFeaturesEn {
	_TranslationsSectionsCleanupFeaturesEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get systemJunk => 'Σκουπίδια συστήματος';
	@override String get userCache => 'Προσωρινή μνήμη χρήστη';
	@override String get tempFiles => 'Αρχεία Temp';
}

// Path: sections.myClutter.features
class _TranslationsSectionsMyClutterFeaturesEl implements TranslationsSectionsMyClutterFeaturesEn {
	_TranslationsSectionsMyClutterFeaturesEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get largeFiles => 'Μεγάλα Αρχεία';
	@override String get duplicates => 'Αντίγραφα';
	@override String get largeSimilarImages => 'Μεγάλες Παρόμοιες Εικόνες';
}

// Path: sections.spaceView.features
class _TranslationsSectionsSpaceViewFeaturesEl implements TranslationsSectionsSpaceViewFeaturesEn {
	_TranslationsSectionsSpaceViewFeaturesEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get visualStorageMap => 'Οπτικός χάρτης αποθήκευσης';
	@override String get largeFoldersOverview => 'Επισκόπηση μεγάλων φακέλων';
	@override String get hiddenFilesUncovered => 'Αποκαλύφθηκαν κρυφά αρχεία';
}

// Path: sections.applications.features
class _TranslationsSectionsApplicationsFeaturesEl implements TranslationsSectionsApplicationsFeaturesEn {
	_TranslationsSectionsApplicationsFeaturesEl._(this._root);

	final TranslationsEl _root; // ignore: unused_field

	// Translations
	@override String get appUninstaller => 'Πρόγραμμα απεγκατάστασης εφαρμογών';
	@override String get largeApps => 'Μεγάλες εφαρμογές';
	@override String get fileLeftovers => 'Υπολείμματα αρχείου';
}

// Path: sections.myTools.features
class _TranslationsSectionsMyToolsFeaturesEl implements TranslationsSectionsMyToolsFeaturesEn {
	_TranslationsSectionsMyToolsFeaturesEl._(this._root);

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
			'navigation.smartCare' => 'Έξυπνη Φροντίδα',
			'navigation.cleanup' => 'Καθαρισμός',
			'navigation.myClutter' => 'Η ακαταστασία μου',
			'navigation.spaceView' => 'Θέα Διαστήματος',
			'navigation.applications' => 'Εφαρμογές',
			'navigation.myTools' => 'Τα εργαλεία μου',
			'navigation.myActivity' => 'Η δραστηριότητά μου',
			'sections.smartCare.title' => 'Έξυπνη Φροντίδα',
			'sections.smartCare.subtitle' => 'Αποκτήστε μια πλήρη επισκόπηση υγείας\nτου συστήματός σας με ένα κλικ.',
			'sections.smartCare.features.systemStatus' => 'Κατάσταση συστήματος',
			'sections.smartCare.features.storageUsage' => 'Χρήση αποθήκευσης',
			'sections.smartCare.features.quickActions' => 'Γρήγορες Ενέργειες',
			'sections.cleanup.title' => 'Καθαρισμός σκουπιδιών',
			'sections.cleanup.subtitle' => 'Καθαρίστε το σύστημά σας για να επιτύχετε τη μέγιστη\nαπόδοση και να αποκτήσετε ξανά περισσότερο ελεύθερο χώρο.',
			'sections.cleanup.features.systemJunk' => 'Σκουπίδια συστήματος',
			'sections.cleanup.features.userCache' => 'Προσωρινή μνήμη χρήστη',
			'sections.cleanup.features.tempFiles' => 'Αρχεία Temp',
			'sections.myClutter.title' => 'Η ακαταστασία μου',
			'sections.myClutter.subtitle' => 'Ταξινομήστε τα αρχεία σας και μειώστε\nτο χάος με λίγα μόνο κλικ.',
			'sections.myClutter.features.largeFiles' => 'Μεγάλα Αρχεία',
			'sections.myClutter.features.duplicates' => 'Αντίγραφα',
			'sections.myClutter.features.largeSimilarImages' => 'Μεγάλες Παρόμοιες Εικόνες',
			'sections.spaceView.title' => 'Θέα Διαστήματος',
			'sections.spaceView.subtitle' => 'Οραματιστείτε τι καταλαμβάνει τον περισσότερο χώρο στον δίσκο και καθαρίστε γρήγορα.',
			'sections.spaceView.features.visualStorageMap' => 'Οπτικός χάρτης αποθήκευσης',
			'sections.spaceView.features.largeFoldersOverview' => 'Επισκόπηση μεγάλων φακέλων',
			'sections.spaceView.features.hiddenFilesUncovered' => 'Αποκαλύφθηκαν κρυφά αρχεία',
			'sections.applications.title' => 'Εφαρμογές',
			'sections.applications.subtitle' => 'Πάρτε τον έλεγχο των εφαρμογών σας.\nΑπεγκαταστήστε ή αφαιρέστε παλιά υπολείμματα.',
			'sections.applications.features.appUninstaller' => 'Πρόγραμμα απεγκατάστασης εφαρμογών',
			'sections.applications.features.largeApps' => 'Μεγάλες εφαρμογές',
			'sections.applications.features.fileLeftovers' => 'Υπολείμματα αρχείου',
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
			'smartCare.refresh' => 'Φρεσκάρω',
			'smartCare.unableToReadDiskInfo' => 'Δεν είναι δυνατή η ανάγνωση των πληροφοριών του δίσκου',
			'smartCare.totalStorage' => 'Συνολική αποθήκευση',
			'smartCare.used' => 'Μεταχειρισμένος',
			'smartCare.available' => 'Διαθέσιμος',
			'smartCare.percentUsed' => '{percent}% χρησιμοποιείται',
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
			'myToolsCatalog.appUpdater.title' => 'Ενημέρωση εφαρμογών',
			'myToolsCatalog.appUpdater.description' => 'Παρακολουθήστε τις πιο πρόσφατες και πιο αξιόπιστες εκδόσεις των εφαρμογών σας.',
			'myToolsCatalog.similarImages.title' => 'Παρόμοιες Εικόνες',
			'myToolsCatalog.similarImages.description' => 'Ελέγξτε παρόμοιες φωτογραφίες και κρατήστε μόνο τις καλύτερες.',
			'myToolsCatalog.privacyItems.title' => 'Αντικείμενα απορρήτου',
			'myToolsCatalog.privacyItems.description' => 'Καταργήστε το ιστορικό περιήγησης και τα ίχνη δραστηριότητας για να προστατεύσετε το απόρρητό σας.',
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
			'myToolsCatalog.maintenanceTasks.title' => 'Εργασίες Συντήρησης',
			'myToolsCatalog.maintenanceTasks.description' => 'Εκτελέστε ένα σύνολο συνιστώμενων εργασιών συντήρησης για να φέρετε το Mac σας στο μέγιστο.',
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
