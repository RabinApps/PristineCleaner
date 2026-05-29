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
class TranslationsIt with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsIt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.it,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <it>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsIt _root = this; // ignore: unused_field

	@override 
	TranslationsIt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsIt(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppIt app = _TranslationsAppIt._(_root);
	@override late final _TranslationsLanguageIt language = _TranslationsLanguageIt._(_root);
	@override late final _TranslationsNavigationIt navigation = _TranslationsNavigationIt._(_root);
	@override late final _TranslationsSectionsIt sections = _TranslationsSectionsIt._(_root);
	@override late final _TranslationsProgressIt progress = _TranslationsProgressIt._(_root);
	@override late final _TranslationsErrorsIt errors = _TranslationsErrorsIt._(_root);
	@override late final _TranslationsButtonsIt buttons = _TranslationsButtonsIt._(_root);
	@override late final _TranslationsTooltipsIt tooltips = _TranslationsTooltipsIt._(_root);
	@override late final _TranslationsDialogsIt dialogs = _TranslationsDialogsIt._(_root);
	@override late final _TranslationsRemovalIt removal = _TranslationsRemovalIt._(_root);
	@override late final _TranslationsDoneIt done = _TranslationsDoneIt._(_root);
	@override late final _TranslationsDonateIt donate = _TranslationsDonateIt._(_root);
	@override late final _TranslationsCleanupManagerIt cleanupManager = _TranslationsCleanupManagerIt._(_root);
	@override late final _TranslationsProjectDirectoryIt projectDirectory = _TranslationsProjectDirectoryIt._(_root);
	@override late final _TranslationsSearchAndSortIt searchAndSort = _TranslationsSearchAndSortIt._(_root);
	@override late final _TranslationsSpaceViewIt spaceView = _TranslationsSpaceViewIt._(_root);
	@override late final _TranslationsHomeIt home = _TranslationsHomeIt._(_root);
	@override late final _TranslationsMyToolsPageIt myToolsPage = _TranslationsMyToolsPageIt._(_root);
	@override late final _TranslationsMyToolsMessagesIt myToolsMessages = _TranslationsMyToolsMessagesIt._(_root);
	@override late final _TranslationsMyToolsCatalogIt myToolsCatalog = _TranslationsMyToolsCatalogIt._(_root);
	@override late final _TranslationsCleanupCategoriesIt cleanupCategories = _TranslationsCleanupCategoriesIt._(_root);
	@override late final _TranslationsMyClutterDashboardIt myClutterDashboard = _TranslationsMyClutterDashboardIt._(_root);
	@override late final _TranslationsScanResultsIt scanResults = _TranslationsScanResultsIt._(_root);
	@override late final _TranslationsSpaceViewStartIt spaceViewStart = _TranslationsSpaceViewStartIt._(_root);
	@override late final _TranslationsShellIt shell = _TranslationsShellIt._(_root);
	@override late final _TranslationsMyToolsServiceIt myToolsService = _TranslationsMyToolsServiceIt._(_root);
}

// Path: app
class _TranslationsAppIt implements TranslationsAppEn {
	_TranslationsAppIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'PristineCleaner';
}

// Path: language
class _TranslationsLanguageIt implements TranslationsLanguageEn {
	_TranslationsLanguageIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get label => 'Lingua';
	@override String get english => 'Inglese';
	@override String get spanish => 'Spagnolo';
	@override String get italian => 'Italiano';
	@override String get french => 'Francese';
	@override String get hebrew => 'Ebraico';
	@override String get greek => 'Greco';
	@override String get portuguese => 'Portoghese';
	@override String get mandarin => 'Mandarino';
}

// Path: navigation
class _TranslationsNavigationIt implements TranslationsNavigationEn {
	_TranslationsNavigationIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Casa';
	@override String get cleanup => 'Pulizia';
	@override String get myClutter => 'Il Mio Disordine';
	@override String get spaceView => 'Vista Spazio';
	@override String get applications => 'Applicazioni';
	@override String get myTools => 'I Miei Strumenti';
	@override String get donate => 'Dona';
}

// Path: sections
class _TranslationsSectionsIt implements TranslationsSectionsEn {
	_TranslationsSectionsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSectionsHomeIt home = _TranslationsSectionsHomeIt._(_root);
	@override late final _TranslationsSectionsCleanupIt cleanup = _TranslationsSectionsCleanupIt._(_root);
	@override late final _TranslationsSectionsMyClutterIt myClutter = _TranslationsSectionsMyClutterIt._(_root);
	@override late final _TranslationsSectionsSpaceViewIt spaceView = _TranslationsSectionsSpaceViewIt._(_root);
	@override late final _TranslationsSectionsApplicationsIt applications = _TranslationsSectionsApplicationsIt._(_root);
	@override late final _TranslationsSectionsMyToolsIt myTools = _TranslationsSectionsMyToolsIt._(_root);
}

// Path: progress
class _TranslationsProgressIt implements TranslationsProgressEn {
	_TranslationsProgressIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get countingFiles => 'Conteggio file...';
	@override String get countingApplications => 'Conteggio applicazioni...';
	@override String get countingFolders => 'Conteggio cartelle...';
}

// Path: errors
class _TranslationsErrorsIt implements TranslationsErrorsEn {
	_TranslationsErrorsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get itemsFailedToRemove => 'Impossibile rimuovere {count} elemento(i).';
}

// Path: buttons
class _TranslationsButtonsIt implements TranslationsButtonsEn {
	_TranslationsButtonsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get scan => 'Scansiona';
	@override String get stop => 'Ferma';
	@override String get done => 'Fatto';
	@override String get clean => 'Pulisci';
	@override String get cleanUp => 'Pulisci';
	@override String get close => 'Chiudi';
	@override String get refresh => 'Aggiorna';
	@override String get rescan => 'Nuova scansione';
	@override String get startOver => 'Ricomincia';
	@override String get selectAll => 'Seleziona tutto';
	@override String get clearSelection => 'Cancella selezione';
	@override String get keepScanning => 'Continua scansione';
	@override String get keepRemoving => 'Continua rimozione';
}

// Path: tooltips
class _TranslationsTooltipsIt implements TranslationsTooltipsEn {
	_TranslationsTooltipsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get search => 'Cerca';
	@override String get openInFinder => 'Apri nel Finder';
}

// Path: dialogs
class _TranslationsDialogsIt implements TranslationsDialogsEn {
	_TranslationsDialogsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get stopScanningTitle => 'Interrompere la scansione?';
	@override String get stopScanningMessage => 'Questo annullera la scansione corrente e scartera i progressi parziali.';
	@override String get stopRemovalTitle => 'Interrompere la rimozione?';
	@override String get stopRemovalMessage => 'Il file corrente verra completato, poi i restanti saranno saltati.';
}

// Path: removal
class _TranslationsRemovalIt implements TranslationsRemovalEn {
	_TranslationsRemovalIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get barrierLabel => 'Progresso rimozione';
	@override String get preparing => 'Preparazione...';
	@override String get removingFrom => 'Rimozione da {title}';
	@override String get stoppingAfterCurrentFile => 'Arresto dopo il file corrente...';
	@override String get keepWindowOpen => 'Mantieni aperta questa finestra durante la rimozione.';
	@override String get processedSummary => '{processed} di {total} elaborati';
	@override String get deletedFreed => '{deleted} eliminati • {bytes} liberati';
	@override String get currentItem => 'Corrente: {name}';
	@override String get stopping => 'Arresto...';
	@override String get removalFailed => 'Rimozione non riuscita';
	@override String get removalFailedDetails => 'Si e verificato un problema durante la rimozione dei file selezionati.';
	@override String get removalStopped => 'Rimozione interrotta';
	@override String get removalComplete => 'Rimozione completata';
	@override String get deletedSummary => '{title} ha eliminato {count} elemento(i)';
	@override String get freedSummary => '{bytes} liberati';
	@override String get failedToRemoveSummary => 'Impossibile rimuovere {count} elemento(i).';
	@override String get deletedFiles => 'File eliminati';
	@override String get noFilesDeleted => 'Nessun file eliminato.';
}

// Path: done
class _TranslationsDoneIt implements TranslationsDoneEn {
	_TranslationsDoneIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get allCleanedTitle => 'Tutto pulito!';
	@override String get movedToTrashMessage => 'I file selezionati sono stati spostati nel Cestino.';
	@override String get applicationsRemovedTitle => 'Applicazioni rimosse!';
	@override String get appsMovedToTrashMessage => 'Le app selezionate sono state spostate nel Cestino.';
}

// Path: donate
class _TranslationsDonateIt implements TranslationsDonateEn {
	_TranslationsDonateIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Supporta PristineCleaner';
	@override String get subtitle => 'Se PristineCleaner ti aiuta a mantenere il sistema pulito, puoi supportarne lo sviluppo con una piccola donazione.';
	@override String get buyMeACoffee => 'Buy Me a Coffee';
	@override String get paypalDonate => 'Dona con PayPal';
	@override String get openLinkFailed => 'Impossibile aprire il link della donazione.';
}

// Path: cleanupManager
class _TranslationsCleanupManagerIt implements TranslationsCleanupManagerEn {
	_TranslationsCleanupManagerIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gestore Pulizia';
	@override String get systemJunkHeader => 'File Inutili di Sistema';
	@override String get systemJunkDescription => 'File ridondanti che occupano spazio e rallentano le prestazioni.';
	@override String get selectLabel => 'Seleziona';
	@override String get selectAllOption => 'Tutto';
	@override String get selectNoneOption => 'Nessuno';
	@override String get noItems => 'Nessun elemento';
	@override String get noItemsFound => 'Nessun elemento trovato';
	@override String get itemsSelected => '{count} elementi selezionati';
}

// Path: projectDirectory
class _TranslationsProjectDirectoryIt implements TranslationsProjectDirectoryEn {
	_TranslationsProjectDirectoryIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get chooseFolder => 'Scegli cartella...';
	@override String get chooseProjectDirectory => 'Scegli directory progetto';
	@override String get chooseParentFolder => 'Scegli cartella principale';
	@override String get noFolder => 'Nessuna cartella';
}

// Path: searchAndSort
class _TranslationsSearchAndSortIt implements TranslationsSearchAndSortEn {
	_TranslationsSearchAndSortIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get searchHint => 'Cerca...';
	@override String get sortBy => 'Ordina per';
	@override String get size => 'Dimensione';
	@override String get name => 'Nome';
	@override String get ascending => 'Crescente';
	@override String get descending => 'Decrescente';
}

// Path: spaceView
class _TranslationsSpaceViewIt implements TranslationsSpaceViewEn {
	_TranslationsSpaceViewIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get noFoldersFound => 'Nessuna cartella trovata a questo livello';
	@override String get noBubblesToRender => 'Nessuna bolla da mostrare';
	@override String get otherItems => 'Altri elementi';
}

// Path: home
class _TranslationsHomeIt implements TranslationsHomeEn {
	_TranslationsHomeIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get refresh => 'Aggiorna';
	@override String get unableToReadDiskInfo => 'Impossibile leggere le informazioni sul disco';
	@override String get totalStorage => 'Spazio di archiviazione totale';
	@override String get used => 'Usato';
	@override String get available => 'Disponibile';
	@override String get percentUsed => '{percent}% utilizzato';
	@override String get cpuUsage => 'Utilizzo della CPU';
	@override String get ramUsage => 'Utilizzo della RAM';
	@override String get memoryPercentUsed => '{percent}% RAM utilizzata';
	@override String get unableToReadSystemInfo => 'Impossibile leggere le informazioni di sistema';
}

// Path: myToolsPage
class _TranslationsMyToolsPageIt implements TranslationsMyToolsPageEn {
	_TranslationsMyToolsPageIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'I Miei Strumenti';
	@override String get subtitle => 'Gli strumenti essenziali per tenere il tuo Mac pulito, sicuro e veloce.';
	@override String get backToTools => 'Torna agli strumenti';
}

// Path: myToolsMessages
class _TranslationsMyToolsMessagesIt implements TranslationsMyToolsMessagesEn {
	_TranslationsMyToolsMessagesIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get itemsWithSize => '{count} elemento(i) • {size}';
	@override String get scanCancelled => 'la scansione e stata annullata.';
	@override String get selectAtLeastOne => 'Seleziona almeno un elemento da pulire.';
	@override String get failedToClean => 'Impossibile pulire {count} elemento(i).';
	@override String get everythingSelectedCleaned => 'Tutto cio che era selezionato e stato pulito.';
	@override String get cleanupUpdated => 'Pulizia aggiornata.';
	@override String get cleanedCount => 'Puliti {count} elemento(i).';
	@override String get stoppedPrefix => 'Interrotto. ';
	@override String get removedCount => 'Rimossi {count} elemento(i).';
	@override String get failedCountShort => ' {count} non riusciti.';
	@override String get scanComplete => 'Scansione completata.';
	@override String get somethingWentWrong => 'Qualcosa e andato storto.';
	@override late final _TranslationsMyToolsMessagesFallbackIt fallback = _TranslationsMyToolsMessagesFallbackIt._(_root);
}

// Path: myToolsCatalog
class _TranslationsMyToolsCatalogIt implements TranslationsMyToolsCatalogEn {
	_TranslationsMyToolsCatalogIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMyToolsCatalogAppLeftoversIt appLeftovers = _TranslationsMyToolsCatalogAppLeftoversIt._(_root);
	@override late final _TranslationsMyToolsCatalogBackgroundItemsIt backgroundItems = _TranslationsMyToolsCatalogBackgroundItemsIt._(_root);
	@override late final _TranslationsMyToolsCatalogDownloadsIt downloads = _TranslationsMyToolsCatalogDownloadsIt._(_root);
	@override late final _TranslationsMyToolsCatalogLargeOldIt largeOld = _TranslationsMyToolsCatalogLargeOldIt._(_root);
	@override late final _TranslationsMyToolsCatalogSimilarImagesIt similarImages = _TranslationsMyToolsCatalogSimilarImagesIt._(_root);
	@override late final _TranslationsMyToolsCatalogTrashBinsIt trashBins = _TranslationsMyToolsCatalogTrashBinsIt._(_root);
	@override late final _TranslationsMyToolsCatalogDuplicateFinderIt duplicateFinder = _TranslationsMyToolsCatalogDuplicateFinderIt._(_root);
	@override late final _TranslationsMyToolsCatalogApplicationPermissionsIt applicationPermissions = _TranslationsMyToolsCatalogApplicationPermissionsIt._(_root);
	@override late final _TranslationsMyToolsCatalogSystemJunkIt systemJunk = _TranslationsMyToolsCatalogSystemJunkIt._(_root);
	@override late final _TranslationsMyToolsCatalogTimeMachineSnapshotIt timeMachineSnapshot = _TranslationsMyToolsCatalogTimeMachineSnapshotIt._(_root);
	@override late final _TranslationsMyToolsCatalogLoginItemsIt loginItems = _TranslationsMyToolsCatalogLoginItemsIt._(_root);
	@override late final _TranslationsMyToolsCatalogMailAttachmentsIt mailAttachments = _TranslationsMyToolsCatalogMailAttachmentsIt._(_root);
	@override late final _TranslationsMyToolsCatalogMalwareFinderIt malwareFinder = _TranslationsMyToolsCatalogMalwareFinderIt._(_root);
	@override late final _TranslationsMyToolsCatalogUninstallerIt uninstaller = _TranslationsMyToolsCatalogUninstallerIt._(_root);
}

// Path: cleanupCategories
class _TranslationsCleanupCategoriesIt implements TranslationsCleanupCategoriesEn {
	_TranslationsCleanupCategoriesIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsCleanupCategoriesUserCacheIt userCache = _TranslationsCleanupCategoriesUserCacheIt._(_root);
	@override late final _TranslationsCleanupCategoriesUserLogsIt userLogs = _TranslationsCleanupCategoriesUserLogsIt._(_root);
	@override late final _TranslationsCleanupCategoriesLanguageFilesIt languageFiles = _TranslationsCleanupCategoriesLanguageFilesIt._(_root);
	@override late final _TranslationsCleanupCategoriesSystemLogsIt systemLogs = _TranslationsCleanupCategoriesSystemLogsIt._(_root);
	@override late final _TranslationsCleanupCategoriesBrokenLoginItemsIt brokenLoginItems = _TranslationsCleanupCategoriesBrokenLoginItemsIt._(_root);
}

// Path: myClutterDashboard
class _TranslationsMyClutterDashboardIt implements TranslationsMyClutterDashboardEn {
	_TranslationsMyClutterDashboardIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get backToCategories => 'Torna alle categorie';
	@override String get filesToSort => 'Hai {count} file da ordinare.';
	@override String get quickRecommendations => 'Usa suggerimenti rapidi o controlla manualmente.';
	@override String get reviewAllFiles => 'Rivedi tutti i file';
	@override String get freshDuplicatesFound => '{count} duplicati recenti trovati';
	@override String get noDuplicates => 'Nessun duplicato trovato in questa scansione.';
	@override String get removeDuplicateBytes => 'Rimuovi {bytes} di file duplicati.';
	@override String get largeSimilarImagesFound => '{count} immagini grandi simili trovate';
	@override String get noSimilarGroups => 'Nessun gruppo di immagini simili trovato.';
	@override String get nearlyIdenticalImages => 'Ci sono {bytes} di immagini quasi identiche.';
	@override String get largeFilesFound => '{bytes} di file grandi trovati';
	@override String get noLargeFiles => 'Nessun file grande trovato.';
	@override String get largeFilesReady => '{count} file grandi pronti per la revisione.';
	@override String get review => 'Rivedi';
}

// Path: scanResults
class _TranslationsScanResultsIt implements TranslationsScanResultsEn {
	_TranslationsScanResultsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get itemsSummary => '{count} elementi  •  {size}';
	@override String get scannedInMs => 'Scansione in {ms}ms';
	@override String get deselectAll => 'Deseleziona tutto';
	@override String get selectAll => 'Seleziona tutto';
	@override String get noItemsMatchSearch => 'Nessun elemento corrisponde alla ricerca';
	@override String get noItemsFound => 'Nessun elemento trovato';
	@override String get itemsSelected => '{count} elementi selezionati';
	@override String get rescan => 'Nuova scansione';
}

// Path: spaceViewStart
class _TranslationsSpaceViewStartIt implements TranslationsSpaceViewStartEn {
	_TranslationsSpaceViewStartIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get subtitle => 'Scegli una cartella radice e scansiona per capire cosa occupa piu spazio.';
	@override String get defaultRootPath => 'Il percorso radice predefinito e il tuo disco principale';
	@override String get exploreBubbles => 'Esplora le dimensioni cartelle con bolle interattive';
	@override String get clickToDrillDown => 'Fai clic sulle cartelle per approfondire';
}

// Path: shell
class _TranslationsShellIt implements TranslationsShellEn {
	_TranslationsShellIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get comingSoon => 'In arrivo';
}

// Path: myToolsService
class _TranslationsMyToolsServiceIt implements TranslationsMyToolsServiceEn {
	_TranslationsMyToolsServiceIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get snapshotName => 'Istantanea {id}';
	@override String get timeMachineGroup => 'Time Machine';
	@override String get timeMachineMacOnly => 'Le istantanee Time Machine sono disponibili solo su macOS.';
}

// Path: sections.home
class _TranslationsSectionsHomeIt implements TranslationsSectionsHomeEn {
	_TranslationsSectionsHomeIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Casa';
	@override String get subtitle => 'Ottieni una panoramica completa dello stato del tuo sistema in un clic.';
	@override late final _TranslationsSectionsHomeFeaturesIt features = _TranslationsSectionsHomeFeaturesIt._(_root);
}

// Path: sections.cleanup
class _TranslationsSectionsCleanupIt implements TranslationsSectionsCleanupEn {
	_TranslationsSectionsCleanupIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pulizia File Inutili';
	@override String get subtitle => 'Pulisci il sistema per ottenere\nprestazioni massime e recuperare spazio.';
	@override late final _TranslationsSectionsCleanupFeaturesIt features = _TranslationsSectionsCleanupFeaturesIt._(_root);
}

// Path: sections.myClutter
class _TranslationsSectionsMyClutterIt implements TranslationsSectionsMyClutterEn {
	_TranslationsSectionsMyClutterIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Il Mio Disordine';
	@override String get subtitle => 'Ordina i tuoi file e riduci\nil disordine in pochi clic.';
	@override late final _TranslationsSectionsMyClutterFeaturesIt features = _TranslationsSectionsMyClutterFeaturesIt._(_root);
}

// Path: sections.spaceView
class _TranslationsSectionsSpaceViewIt implements TranslationsSectionsSpaceViewEn {
	_TranslationsSectionsSpaceViewIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vista Spazio';
	@override String get subtitle => 'Visualizza cosa occupa piu\nspazio su disco e pulisci rapidamente.';
	@override late final _TranslationsSectionsSpaceViewFeaturesIt features = _TranslationsSectionsSpaceViewFeaturesIt._(_root);
}

// Path: sections.applications
class _TranslationsSectionsApplicationsIt implements TranslationsSectionsApplicationsEn {
	_TranslationsSectionsApplicationsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Applicazioni';
	@override String get subtitle => 'Prendi il controllo delle applicazioni.\nDisinstalla o rimuovi vecchi residui.';
	@override late final _TranslationsSectionsApplicationsFeaturesIt features = _TranslationsSectionsApplicationsFeaturesIt._(_root);
}

// Path: sections.myTools
class _TranslationsSectionsMyToolsIt implements TranslationsSectionsMyToolsEn {
	_TranslationsSectionsMyToolsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'I Miei Strumenti';
	@override String get subtitle => 'Il tuo kit principale per cura e manutenzione del sistema.';
	@override late final _TranslationsSectionsMyToolsFeaturesIt features = _TranslationsSectionsMyToolsFeaturesIt._(_root);
}

// Path: myToolsMessages.fallback
class _TranslationsMyToolsMessagesFallbackIt implements TranslationsMyToolsMessagesFallbackEn {
	_TranslationsMyToolsMessagesFallbackIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get downloadsTidy => 'Download gia in ordine.';
	@override String get noOversizedStale => 'Nessun file grande obsoleto trovato.';
	@override String get noRecentDuplicates => 'Nessun duplicato recente trovato.';
	@override String get noSimilarLargeImages => 'Nessuna immagine grande simile trovata.';
	@override String get noAppLeftovers => 'Nessun residuo app rimovibile trovato.';
	@override String get noStaleApps => 'Nessuna app obsoleta trovata.';
	@override String get appsNeedReview => 'Trovate app che potrebbero richiedere revisione.';
	@override String get noSystemJunkCandidates => 'Nessun candidato pulizia in file inutili di sistema.';
	@override String get noBrokenStartup => 'Nessuna voce di avvio/background non valida trovata.';
	@override String get noBackgroundItems => 'Nessun elemento in background trovato.';
	@override String get noPrivacyTraces => 'Nessuna traccia privacy trovata nelle posizioni note.';
	@override String get trashAlreadyEmpty => 'Il cestino e gia vuoto.';
	@override String get noPermissionCache => 'Nessun file cache permessi trovato.';
	@override String get noTimeMachineSnapshots => 'Nessuna istantanea locale Time Machine trovata.';
	@override String get noMaintenanceCandidates => 'Nessun candidato manutenzione trovato.';
	@override String get noMailAttachments => 'Nessun allegato mail rimovibile trovato.';
	@override String get noSuspiciousFiles => 'Nessun file sospetto rilevato.';
}

// Path: myToolsCatalog.appLeftovers
class _TranslationsMyToolsCatalogAppLeftoversIt implements TranslationsMyToolsCatalogAppLeftoversEn {
	_TranslationsMyToolsCatalogAppLeftoversIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Residui App';
	@override String get description => 'Trova e rimuovi residui app anche se l\'app principale non esiste piu.';
}

// Path: myToolsCatalog.backgroundItems
class _TranslationsMyToolsCatalogBackgroundItemsIt implements TranslationsMyToolsCatalogBackgroundItemsEn {
	_TranslationsMyToolsCatalogBackgroundItemsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Elementi in Background';
	@override String get description => 'Gestisci app e processi in background in esecuzione sul tuo Mac.';
}

// Path: myToolsCatalog.downloads
class _TranslationsMyToolsCatalogDownloadsIt implements TranslationsMyToolsCatalogDownloadsEn {
	_TranslationsMyToolsCatalogDownloadsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Download';
	@override String get description => 'Rivedi e pulisci file monouso dalla cartella Download.';
}

// Path: myToolsCatalog.largeOld
class _TranslationsMyToolsCatalogLargeOldIt implements TranslationsMyToolsCatalogLargeOldEn {
	_TranslationsMyToolsCatalogLargeOldIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'File Grandi e Vecchi';
	@override String get description => 'Trova e rimuovi file grandi inutilizzati che occupano spazio.';
}

// Path: myToolsCatalog.similarImages
class _TranslationsMyToolsCatalogSimilarImagesIt implements TranslationsMyToolsCatalogSimilarImagesEn {
	_TranslationsMyToolsCatalogSimilarImagesIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Immagini Simili';
	@override String get description => 'Rivedi foto simili e conserva solo le migliori.';
}

// Path: myToolsCatalog.trashBins
class _TranslationsMyToolsCatalogTrashBinsIt implements TranslationsMyToolsCatalogTrashBinsEn {
	_TranslationsMyToolsCatalogTrashBinsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cestini';
	@override String get description => 'Svuota tutti i cestini disponibili sul tuo Mac.';
}

// Path: myToolsCatalog.duplicateFinder
class _TranslationsMyToolsCatalogDuplicateFinderIt implements TranslationsMyToolsCatalogDuplicateFinderEn {
	_TranslationsMyToolsCatalogDuplicateFinderIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Trova Duplicati';
	@override String get description => 'Rimuovi file duplicati salvati in posizioni diverse.';
}

// Path: myToolsCatalog.applicationPermissions
class _TranslationsMyToolsCatalogApplicationPermissionsIt implements TranslationsMyToolsCatalogApplicationPermissionsEn {
	_TranslationsMyToolsCatalogApplicationPermissionsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Permessi Applicazioni';
	@override String get description => 'Gestisci come le app accedono a funzioni e dispositivi di sistema.';
}

// Path: myToolsCatalog.systemJunk
class _TranslationsMyToolsCatalogSystemJunkIt implements TranslationsMyToolsCatalogSystemJunkEn {
	_TranslationsMyToolsCatalogSystemJunkIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'File Inutili di Sistema';
	@override String get description => 'Rimuovi file ridondanti che rallentano e occupano spazio.';
}

// Path: myToolsCatalog.timeMachineSnapshot
class _TranslationsMyToolsCatalogTimeMachineSnapshotIt implements TranslationsMyToolsCatalogTimeMachineSnapshotEn {
	_TranslationsMyToolsCatalogTimeMachineSnapshotIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Istantanea Time Machine';
	@override String get description => 'Rimuovi istantanee locali Time Machine senza influire sui backup.';
}

// Path: myToolsCatalog.loginItems
class _TranslationsMyToolsCatalogLoginItemsIt implements TranslationsMyToolsCatalogLoginItemsEn {
	_TranslationsMyToolsCatalogLoginItemsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Elementi di Accesso';
	@override String get description => 'Gestisci app che si aprono automaticamente all\'avvio del Mac.';
}

// Path: myToolsCatalog.mailAttachments
class _TranslationsMyToolsCatalogMailAttachmentsIt implements TranslationsMyToolsCatalogMailAttachmentsEn {
	_TranslationsMyToolsCatalogMailAttachmentsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Allegati Mail';
	@override String get description => 'Rimuovi allegati email locali per liberare spazio mantenendo file modificati.';
}

// Path: myToolsCatalog.malwareFinder
class _TranslationsMyToolsCatalogMalwareFinderIt implements TranslationsMyToolsCatalogMalwareFinderEn {
	_TranslationsMyToolsCatalogMalwareFinderIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ricerca Malware';
	@override String get description => 'Individua e rimuovi elementi dannosi per mantenere sicuro il Mac.';
}

// Path: myToolsCatalog.uninstaller
class _TranslationsMyToolsCatalogUninstallerIt implements TranslationsMyToolsCatalogUninstallerEn {
	_TranslationsMyToolsCatalogUninstallerIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Disinstallatore';
	@override String get description => 'Rimuovi correttamente app complete con tutti i file correlati.';
}

// Path: cleanupCategories.userCache
class _TranslationsCleanupCategoriesUserCacheIt implements TranslationsCleanupCategoriesUserCacheEn {
	_TranslationsCleanupCategoriesUserCacheIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get name => 'File Cache Utente';
	@override String get description => 'I file cache migliorano l\'avvio ma si accumulano e possono ridurre prestazioni o stabilita.';
}

// Path: cleanupCategories.userLogs
class _TranslationsCleanupCategoriesUserLogsIt implements TranslationsCleanupCategoriesUserLogsEn {
	_TranslationsCleanupCategoriesUserLogsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get name => 'File Log Utente';
	@override String get description => 'I log creati da macOS e app possono crescere e occupare molto spazio.';
}

// Path: cleanupCategories.languageFiles
class _TranslationsCleanupCategoriesLanguageFilesIt implements TranslationsCleanupCategoriesLanguageFilesEn {
	_TranslationsCleanupCategoriesLanguageFilesIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get name => 'File Lingua';
	@override String get description => 'Risorse lingua non usate incluse nelle app. Rimuoverle libera spazio senza impatti funzionali.';
}

// Path: cleanupCategories.systemLogs
class _TranslationsCleanupCategoriesSystemLogsIt implements TranslationsCleanupCategoriesSystemLogsEn {
	_TranslationsCleanupCategoriesSystemLogsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get name => 'File Log di Sistema';
	@override String get description => 'Log di sistema scritti da servizi macOS. Sicuri da rimuovere perche vengono ricreati quando necessario.';
}

// Path: cleanupCategories.brokenLoginItems
class _TranslationsCleanupCategoriesBrokenLoginItemsIt implements TranslationsCleanupCategoriesBrokenLoginItemsEn {
	_TranslationsCleanupCategoriesBrokenLoginItemsIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get name => 'Elementi di Accesso Non Validi';
	@override String get description => 'Elementi che puntano ad app o file inesistenti. Rimuoverli accelera l\'accesso.';
}

// Path: sections.home.features
class _TranslationsSectionsHomeFeaturesIt implements TranslationsSectionsHomeFeaturesEn {
	_TranslationsSectionsHomeFeaturesIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get systemStatus => 'Stato del sistema';
	@override String get storageUsage => 'Utilizzo dello spazio di archiviazione';
	@override String get quickActions => 'Azioni rapide';
}

// Path: sections.cleanup.features
class _TranslationsSectionsCleanupFeaturesIt implements TranslationsSectionsCleanupFeaturesEn {
	_TranslationsSectionsCleanupFeaturesIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get systemJunk => 'File di Sistema Inutili';
	@override String get userCache => 'Cache Utente';
	@override String get tempFiles => 'File Temporanei';
}

// Path: sections.myClutter.features
class _TranslationsSectionsMyClutterFeaturesIt implements TranslationsSectionsMyClutterFeaturesEn {
	_TranslationsSectionsMyClutterFeaturesIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get largeFiles => 'File Grandi';
	@override String get duplicates => 'Duplicati';
	@override String get largeSimilarImages => 'Immagini Simili Grandi';
}

// Path: sections.spaceView.features
class _TranslationsSectionsSpaceViewFeaturesIt implements TranslationsSectionsSpaceViewFeaturesEn {
	_TranslationsSectionsSpaceViewFeaturesIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get visualStorageMap => 'Mappa Visiva dello Spazio';
	@override String get largeFoldersOverview => 'Panoramica Cartelle Grandi';
	@override String get hiddenFilesUncovered => 'File Nascosti Individuati';
}

// Path: sections.applications.features
class _TranslationsSectionsApplicationsFeaturesIt implements TranslationsSectionsApplicationsFeaturesEn {
	_TranslationsSectionsApplicationsFeaturesIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get appUninstaller => 'Disinstallatore App';
	@override String get largeApps => 'App Grandi';
	@override String get fileLeftovers => 'Residui dei File';
}

// Path: sections.myTools.features
class _TranslationsSectionsMyToolsFeaturesIt implements TranslationsSectionsMyToolsFeaturesEn {
	_TranslationsSectionsMyToolsFeaturesIt._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get targetedScanners => 'Scansioni Mirate';
	@override String get quickActions => 'Azioni Rapide';
	@override String get liveFiltering => 'Filtro in Tempo Reale';
}

/// The flat map containing all translations for locale <it>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsIt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'PristineCleaner',
			'language.label' => 'Lingua',
			'language.english' => 'Inglese',
			'language.spanish' => 'Spagnolo',
			'language.italian' => 'Italiano',
			'language.french' => 'Francese',
			'language.hebrew' => 'Ebraico',
			'language.greek' => 'Greco',
			'language.portuguese' => 'Portoghese',
			'language.mandarin' => 'Mandarino',
			'navigation.home' => 'Casa',
			'navigation.cleanup' => 'Pulizia',
			'navigation.myClutter' => 'Il Mio Disordine',
			'navigation.spaceView' => 'Vista Spazio',
			'navigation.applications' => 'Applicazioni',
			'navigation.myTools' => 'I Miei Strumenti',
			'navigation.donate' => 'Dona',
			'sections.home.title' => 'Casa',
			'sections.home.subtitle' => 'Ottieni una panoramica completa dello stato del tuo sistema in un clic.',
			'sections.home.features.systemStatus' => 'Stato del sistema',
			'sections.home.features.storageUsage' => 'Utilizzo dello spazio di archiviazione',
			'sections.home.features.quickActions' => 'Azioni rapide',
			'sections.cleanup.title' => 'Pulizia File Inutili',
			'sections.cleanup.subtitle' => 'Pulisci il sistema per ottenere\nprestazioni massime e recuperare spazio.',
			'sections.cleanup.features.systemJunk' => 'File di Sistema Inutili',
			'sections.cleanup.features.userCache' => 'Cache Utente',
			'sections.cleanup.features.tempFiles' => 'File Temporanei',
			'sections.myClutter.title' => 'Il Mio Disordine',
			'sections.myClutter.subtitle' => 'Ordina i tuoi file e riduci\nil disordine in pochi clic.',
			'sections.myClutter.features.largeFiles' => 'File Grandi',
			'sections.myClutter.features.duplicates' => 'Duplicati',
			'sections.myClutter.features.largeSimilarImages' => 'Immagini Simili Grandi',
			'sections.spaceView.title' => 'Vista Spazio',
			'sections.spaceView.subtitle' => 'Visualizza cosa occupa piu\nspazio su disco e pulisci rapidamente.',
			'sections.spaceView.features.visualStorageMap' => 'Mappa Visiva dello Spazio',
			'sections.spaceView.features.largeFoldersOverview' => 'Panoramica Cartelle Grandi',
			'sections.spaceView.features.hiddenFilesUncovered' => 'File Nascosti Individuati',
			'sections.applications.title' => 'Applicazioni',
			'sections.applications.subtitle' => 'Prendi il controllo delle applicazioni.\nDisinstalla o rimuovi vecchi residui.',
			'sections.applications.features.appUninstaller' => 'Disinstallatore App',
			'sections.applications.features.largeApps' => 'App Grandi',
			'sections.applications.features.fileLeftovers' => 'Residui dei File',
			'sections.myTools.title' => 'I Miei Strumenti',
			'sections.myTools.subtitle' => 'Il tuo kit principale per cura e manutenzione del sistema.',
			'sections.myTools.features.targetedScanners' => 'Scansioni Mirate',
			'sections.myTools.features.quickActions' => 'Azioni Rapide',
			'sections.myTools.features.liveFiltering' => 'Filtro in Tempo Reale',
			'progress.countingFiles' => 'Conteggio file...',
			'progress.countingApplications' => 'Conteggio applicazioni...',
			'progress.countingFolders' => 'Conteggio cartelle...',
			'errors.itemsFailedToRemove' => 'Impossibile rimuovere {count} elemento(i).',
			'buttons.scan' => 'Scansiona',
			'buttons.stop' => 'Ferma',
			'buttons.done' => 'Fatto',
			'buttons.clean' => 'Pulisci',
			'buttons.cleanUp' => 'Pulisci',
			'buttons.close' => 'Chiudi',
			'buttons.refresh' => 'Aggiorna',
			'buttons.rescan' => 'Nuova scansione',
			'buttons.startOver' => 'Ricomincia',
			'buttons.selectAll' => 'Seleziona tutto',
			'buttons.clearSelection' => 'Cancella selezione',
			'buttons.keepScanning' => 'Continua scansione',
			'buttons.keepRemoving' => 'Continua rimozione',
			'tooltips.search' => 'Cerca',
			'tooltips.openInFinder' => 'Apri nel Finder',
			'dialogs.stopScanningTitle' => 'Interrompere la scansione?',
			'dialogs.stopScanningMessage' => 'Questo annullera la scansione corrente e scartera i progressi parziali.',
			'dialogs.stopRemovalTitle' => 'Interrompere la rimozione?',
			'dialogs.stopRemovalMessage' => 'Il file corrente verra completato, poi i restanti saranno saltati.',
			'removal.barrierLabel' => 'Progresso rimozione',
			'removal.preparing' => 'Preparazione...',
			'removal.removingFrom' => 'Rimozione da {title}',
			'removal.stoppingAfterCurrentFile' => 'Arresto dopo il file corrente...',
			'removal.keepWindowOpen' => 'Mantieni aperta questa finestra durante la rimozione.',
			'removal.processedSummary' => '{processed} di {total} elaborati',
			'removal.deletedFreed' => '{deleted} eliminati • {bytes} liberati',
			'removal.currentItem' => 'Corrente: {name}',
			'removal.stopping' => 'Arresto...',
			'removal.removalFailed' => 'Rimozione non riuscita',
			'removal.removalFailedDetails' => 'Si e verificato un problema durante la rimozione dei file selezionati.',
			'removal.removalStopped' => 'Rimozione interrotta',
			'removal.removalComplete' => 'Rimozione completata',
			'removal.deletedSummary' => '{title} ha eliminato {count} elemento(i)',
			'removal.freedSummary' => '{bytes} liberati',
			'removal.failedToRemoveSummary' => 'Impossibile rimuovere {count} elemento(i).',
			'removal.deletedFiles' => 'File eliminati',
			'removal.noFilesDeleted' => 'Nessun file eliminato.',
			'done.allCleanedTitle' => 'Tutto pulito!',
			'done.movedToTrashMessage' => 'I file selezionati sono stati spostati nel Cestino.',
			'done.applicationsRemovedTitle' => 'Applicazioni rimosse!',
			'done.appsMovedToTrashMessage' => 'Le app selezionate sono state spostate nel Cestino.',
			'donate.title' => 'Supporta PristineCleaner',
			'donate.subtitle' => 'Se PristineCleaner ti aiuta a mantenere il sistema pulito, puoi supportarne lo sviluppo con una piccola donazione.',
			'donate.buyMeACoffee' => 'Buy Me a Coffee',
			'donate.paypalDonate' => 'Dona con PayPal',
			'donate.openLinkFailed' => 'Impossibile aprire il link della donazione.',
			'cleanupManager.title' => 'Gestore Pulizia',
			'cleanupManager.systemJunkHeader' => 'File Inutili di Sistema',
			'cleanupManager.systemJunkDescription' => 'File ridondanti che occupano spazio e rallentano le prestazioni.',
			'cleanupManager.selectLabel' => 'Seleziona',
			'cleanupManager.selectAllOption' => 'Tutto',
			'cleanupManager.selectNoneOption' => 'Nessuno',
			'cleanupManager.noItems' => 'Nessun elemento',
			'cleanupManager.noItemsFound' => 'Nessun elemento trovato',
			'cleanupManager.itemsSelected' => '{count} elementi selezionati',
			'projectDirectory.chooseFolder' => 'Scegli cartella...',
			'projectDirectory.chooseProjectDirectory' => 'Scegli directory progetto',
			'projectDirectory.chooseParentFolder' => 'Scegli cartella principale',
			'projectDirectory.noFolder' => 'Nessuna cartella',
			'searchAndSort.searchHint' => 'Cerca...',
			'searchAndSort.sortBy' => 'Ordina per',
			'searchAndSort.size' => 'Dimensione',
			'searchAndSort.name' => 'Nome',
			'searchAndSort.ascending' => 'Crescente',
			'searchAndSort.descending' => 'Decrescente',
			'spaceView.noFoldersFound' => 'Nessuna cartella trovata a questo livello',
			'spaceView.noBubblesToRender' => 'Nessuna bolla da mostrare',
			'spaceView.otherItems' => 'Altri elementi',
			'home.refresh' => 'Aggiorna',
			'home.unableToReadDiskInfo' => 'Impossibile leggere le informazioni sul disco',
			'home.totalStorage' => 'Spazio di archiviazione totale',
			'home.used' => 'Usato',
			'home.available' => 'Disponibile',
			'home.percentUsed' => '{percent}% utilizzato',
			'home.cpuUsage' => 'Utilizzo della CPU',
			'home.ramUsage' => 'Utilizzo della RAM',
			'home.memoryPercentUsed' => '{percent}% RAM utilizzata',
			'home.unableToReadSystemInfo' => 'Impossibile leggere le informazioni di sistema',
			'myToolsPage.title' => 'I Miei Strumenti',
			'myToolsPage.subtitle' => 'Gli strumenti essenziali per tenere il tuo Mac pulito, sicuro e veloce.',
			'myToolsPage.backToTools' => 'Torna agli strumenti',
			'myToolsMessages.itemsWithSize' => '{count} elemento(i) • {size}',
			'myToolsMessages.scanCancelled' => 'la scansione e stata annullata.',
			'myToolsMessages.selectAtLeastOne' => 'Seleziona almeno un elemento da pulire.',
			'myToolsMessages.failedToClean' => 'Impossibile pulire {count} elemento(i).',
			'myToolsMessages.everythingSelectedCleaned' => 'Tutto cio che era selezionato e stato pulito.',
			'myToolsMessages.cleanupUpdated' => 'Pulizia aggiornata.',
			'myToolsMessages.cleanedCount' => 'Puliti {count} elemento(i).',
			'myToolsMessages.stoppedPrefix' => 'Interrotto. ',
			'myToolsMessages.removedCount' => 'Rimossi {count} elemento(i).',
			'myToolsMessages.failedCountShort' => ' {count} non riusciti.',
			'myToolsMessages.scanComplete' => 'Scansione completata.',
			'myToolsMessages.somethingWentWrong' => 'Qualcosa e andato storto.',
			'myToolsMessages.fallback.downloadsTidy' => 'Download gia in ordine.',
			'myToolsMessages.fallback.noOversizedStale' => 'Nessun file grande obsoleto trovato.',
			'myToolsMessages.fallback.noRecentDuplicates' => 'Nessun duplicato recente trovato.',
			'myToolsMessages.fallback.noSimilarLargeImages' => 'Nessuna immagine grande simile trovata.',
			'myToolsMessages.fallback.noAppLeftovers' => 'Nessun residuo app rimovibile trovato.',
			'myToolsMessages.fallback.noStaleApps' => 'Nessuna app obsoleta trovata.',
			'myToolsMessages.fallback.appsNeedReview' => 'Trovate app che potrebbero richiedere revisione.',
			'myToolsMessages.fallback.noSystemJunkCandidates' => 'Nessun candidato pulizia in file inutili di sistema.',
			'myToolsMessages.fallback.noBrokenStartup' => 'Nessuna voce di avvio/background non valida trovata.',
			'myToolsMessages.fallback.noBackgroundItems' => 'Nessun elemento in background trovato.',
			'myToolsMessages.fallback.noPrivacyTraces' => 'Nessuna traccia privacy trovata nelle posizioni note.',
			'myToolsMessages.fallback.trashAlreadyEmpty' => 'Il cestino e gia vuoto.',
			'myToolsMessages.fallback.noPermissionCache' => 'Nessun file cache permessi trovato.',
			'myToolsMessages.fallback.noTimeMachineSnapshots' => 'Nessuna istantanea locale Time Machine trovata.',
			'myToolsMessages.fallback.noMaintenanceCandidates' => 'Nessun candidato manutenzione trovato.',
			'myToolsMessages.fallback.noMailAttachments' => 'Nessun allegato mail rimovibile trovato.',
			'myToolsMessages.fallback.noSuspiciousFiles' => 'Nessun file sospetto rilevato.',
			'myToolsCatalog.appLeftovers.title' => 'Residui App',
			'myToolsCatalog.appLeftovers.description' => 'Trova e rimuovi residui app anche se l\'app principale non esiste piu.',
			'myToolsCatalog.backgroundItems.title' => 'Elementi in Background',
			'myToolsCatalog.backgroundItems.description' => 'Gestisci app e processi in background in esecuzione sul tuo Mac.',
			'myToolsCatalog.downloads.title' => 'Download',
			'myToolsCatalog.downloads.description' => 'Rivedi e pulisci file monouso dalla cartella Download.',
			'myToolsCatalog.largeOld.title' => 'File Grandi e Vecchi',
			'myToolsCatalog.largeOld.description' => 'Trova e rimuovi file grandi inutilizzati che occupano spazio.',
			'myToolsCatalog.similarImages.title' => 'Immagini Simili',
			'myToolsCatalog.similarImages.description' => 'Rivedi foto simili e conserva solo le migliori.',
			'myToolsCatalog.trashBins.title' => 'Cestini',
			'myToolsCatalog.trashBins.description' => 'Svuota tutti i cestini disponibili sul tuo Mac.',
			'myToolsCatalog.duplicateFinder.title' => 'Trova Duplicati',
			'myToolsCatalog.duplicateFinder.description' => 'Rimuovi file duplicati salvati in posizioni diverse.',
			'myToolsCatalog.applicationPermissions.title' => 'Permessi Applicazioni',
			'myToolsCatalog.applicationPermissions.description' => 'Gestisci come le app accedono a funzioni e dispositivi di sistema.',
			'myToolsCatalog.systemJunk.title' => 'File Inutili di Sistema',
			'myToolsCatalog.systemJunk.description' => 'Rimuovi file ridondanti che rallentano e occupano spazio.',
			'myToolsCatalog.timeMachineSnapshot.title' => 'Istantanea Time Machine',
			'myToolsCatalog.timeMachineSnapshot.description' => 'Rimuovi istantanee locali Time Machine senza influire sui backup.',
			'myToolsCatalog.loginItems.title' => 'Elementi di Accesso',
			'myToolsCatalog.loginItems.description' => 'Gestisci app che si aprono automaticamente all\'avvio del Mac.',
			'myToolsCatalog.mailAttachments.title' => 'Allegati Mail',
			'myToolsCatalog.mailAttachments.description' => 'Rimuovi allegati email locali per liberare spazio mantenendo file modificati.',
			'myToolsCatalog.malwareFinder.title' => 'Ricerca Malware',
			'myToolsCatalog.malwareFinder.description' => 'Individua e rimuovi elementi dannosi per mantenere sicuro il Mac.',
			'myToolsCatalog.uninstaller.title' => 'Disinstallatore',
			'myToolsCatalog.uninstaller.description' => 'Rimuovi correttamente app complete con tutti i file correlati.',
			'cleanupCategories.userCache.name' => 'File Cache Utente',
			'cleanupCategories.userCache.description' => 'I file cache migliorano l\'avvio ma si accumulano e possono ridurre prestazioni o stabilita.',
			'cleanupCategories.userLogs.name' => 'File Log Utente',
			'cleanupCategories.userLogs.description' => 'I log creati da macOS e app possono crescere e occupare molto spazio.',
			'cleanupCategories.languageFiles.name' => 'File Lingua',
			'cleanupCategories.languageFiles.description' => 'Risorse lingua non usate incluse nelle app. Rimuoverle libera spazio senza impatti funzionali.',
			'cleanupCategories.systemLogs.name' => 'File Log di Sistema',
			'cleanupCategories.systemLogs.description' => 'Log di sistema scritti da servizi macOS. Sicuri da rimuovere perche vengono ricreati quando necessario.',
			'cleanupCategories.brokenLoginItems.name' => 'Elementi di Accesso Non Validi',
			'cleanupCategories.brokenLoginItems.description' => 'Elementi che puntano ad app o file inesistenti. Rimuoverli accelera l\'accesso.',
			'myClutterDashboard.backToCategories' => 'Torna alle categorie',
			'myClutterDashboard.filesToSort' => 'Hai {count} file da ordinare.',
			'myClutterDashboard.quickRecommendations' => 'Usa suggerimenti rapidi o controlla manualmente.',
			'myClutterDashboard.reviewAllFiles' => 'Rivedi tutti i file',
			'myClutterDashboard.freshDuplicatesFound' => '{count} duplicati recenti trovati',
			'myClutterDashboard.noDuplicates' => 'Nessun duplicato trovato in questa scansione.',
			'myClutterDashboard.removeDuplicateBytes' => 'Rimuovi {bytes} di file duplicati.',
			'myClutterDashboard.largeSimilarImagesFound' => '{count} immagini grandi simili trovate',
			'myClutterDashboard.noSimilarGroups' => 'Nessun gruppo di immagini simili trovato.',
			'myClutterDashboard.nearlyIdenticalImages' => 'Ci sono {bytes} di immagini quasi identiche.',
			'myClutterDashboard.largeFilesFound' => '{bytes} di file grandi trovati',
			'myClutterDashboard.noLargeFiles' => 'Nessun file grande trovato.',
			'myClutterDashboard.largeFilesReady' => '{count} file grandi pronti per la revisione.',
			'myClutterDashboard.review' => 'Rivedi',
			'scanResults.itemsSummary' => '{count} elementi  •  {size}',
			'scanResults.scannedInMs' => 'Scansione in {ms}ms',
			'scanResults.deselectAll' => 'Deseleziona tutto',
			'scanResults.selectAll' => 'Seleziona tutto',
			'scanResults.noItemsMatchSearch' => 'Nessun elemento corrisponde alla ricerca',
			'scanResults.noItemsFound' => 'Nessun elemento trovato',
			'scanResults.itemsSelected' => '{count} elementi selezionati',
			'scanResults.rescan' => 'Nuova scansione',
			'spaceViewStart.subtitle' => 'Scegli una cartella radice e scansiona per capire cosa occupa piu spazio.',
			'spaceViewStart.defaultRootPath' => 'Il percorso radice predefinito e il tuo disco principale',
			'spaceViewStart.exploreBubbles' => 'Esplora le dimensioni cartelle con bolle interattive',
			'spaceViewStart.clickToDrillDown' => 'Fai clic sulle cartelle per approfondire',
			'shell.comingSoon' => 'In arrivo',
			'myToolsService.snapshotName' => 'Istantanea {id}',
			'myToolsService.timeMachineGroup' => 'Time Machine',
			'myToolsService.timeMachineMacOnly' => 'Le istantanee Time Machine sono disponibili solo su macOS.',
			_ => null,
		};
	}
}
