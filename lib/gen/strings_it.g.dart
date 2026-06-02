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
	@override late final _Translations$app$it app = _Translations$app$it._(_root);
	@override late final _Translations$language$it language = _Translations$language$it._(_root);
	@override late final _Translations$navigation$it navigation = _Translations$navigation$it._(_root);
	@override late final _Translations$sections$it sections = _Translations$sections$it._(_root);
	@override late final _Translations$progress$it progress = _Translations$progress$it._(_root);
	@override late final _Translations$errors$it errors = _Translations$errors$it._(_root);
	@override late final _Translations$buttons$it buttons = _Translations$buttons$it._(_root);
	@override late final _Translations$tooltips$it tooltips = _Translations$tooltips$it._(_root);
	@override late final _Translations$dialogs$it dialogs = _Translations$dialogs$it._(_root);
	@override late final _Translations$removal$it removal = _Translations$removal$it._(_root);
	@override late final _Translations$done$it done = _Translations$done$it._(_root);
	@override late final _Translations$donate$it donate = _Translations$donate$it._(_root);
	@override late final _Translations$cleanupManager$it cleanupManager = _Translations$cleanupManager$it._(_root);
	@override late final _Translations$projectDirectory$it projectDirectory = _Translations$projectDirectory$it._(_root);
	@override late final _Translations$searchAndSort$it searchAndSort = _Translations$searchAndSort$it._(_root);
	@override late final _Translations$spaceView$it spaceView = _Translations$spaceView$it._(_root);
	@override late final _Translations$home$it home = _Translations$home$it._(_root);
	@override late final _Translations$myToolsPage$it myToolsPage = _Translations$myToolsPage$it._(_root);
	@override late final _Translations$myToolsMessages$it myToolsMessages = _Translations$myToolsMessages$it._(_root);
	@override late final _Translations$myToolsCatalog$it myToolsCatalog = _Translations$myToolsCatalog$it._(_root);
	@override late final _Translations$cleanupCategories$it cleanupCategories = _Translations$cleanupCategories$it._(_root);
	@override late final _Translations$myClutterDashboard$it myClutterDashboard = _Translations$myClutterDashboard$it._(_root);
	@override late final _Translations$scanResults$it scanResults = _Translations$scanResults$it._(_root);
	@override late final _Translations$spaceViewStart$it spaceViewStart = _Translations$spaceViewStart$it._(_root);
	@override late final _Translations$shell$it shell = _Translations$shell$it._(_root);
	@override late final _Translations$myToolsService$it myToolsService = _Translations$myToolsService$it._(_root);
}

// Path: app
class _Translations$app$it implements Translations$app$en {
	_Translations$app$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'PristineCleaner';
}

// Path: language
class _Translations$language$it implements Translations$language$en {
	_Translations$language$it._(this._root);

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
class _Translations$navigation$it implements Translations$navigation$en {
	_Translations$navigation$it._(this._root);

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
class _Translations$sections$it implements Translations$sections$en {
	_Translations$sections$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sections$home$it home = _Translations$sections$home$it._(_root);
	@override late final _Translations$sections$cleanup$it cleanup = _Translations$sections$cleanup$it._(_root);
	@override late final _Translations$sections$myClutter$it myClutter = _Translations$sections$myClutter$it._(_root);
	@override late final _Translations$sections$spaceView$it spaceView = _Translations$sections$spaceView$it._(_root);
	@override late final _Translations$sections$applications$it applications = _Translations$sections$applications$it._(_root);
	@override late final _Translations$sections$myTools$it myTools = _Translations$sections$myTools$it._(_root);
}

// Path: progress
class _Translations$progress$it implements Translations$progress$en {
	_Translations$progress$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get countingFiles => 'Conteggio file...';
	@override String get countingApplications => 'Conteggio applicazioni...';
	@override String get countingFolders => 'Conteggio cartelle...';
}

// Path: errors
class _Translations$errors$it implements Translations$errors$en {
	_Translations$errors$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get itemsFailedToRemove => 'Impossibile rimuovere {count} elemento(i).';
}

// Path: buttons
class _Translations$buttons$it implements Translations$buttons$en {
	_Translations$buttons$it._(this._root);

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
class _Translations$tooltips$it implements Translations$tooltips$en {
	_Translations$tooltips$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get search => 'Cerca';
	@override String get openInFinder => 'Apri nel Finder';
}

// Path: dialogs
class _Translations$dialogs$it implements Translations$dialogs$en {
	_Translations$dialogs$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get stopScanningTitle => 'Interrompere la scansione?';
	@override String get stopScanningMessage => 'Questo annullera la scansione corrente e scartera i progressi parziali.';
	@override String get stopRemovalTitle => 'Interrompere la rimozione?';
	@override String get stopRemovalMessage => 'Il file corrente verra completato, poi i restanti saranno saltati.';
	@override String get exitConfirmationTitle => 'Conferma uscita';
	@override String get exitConfirmationMessage => 'È in corso una scansione. Sei sicuro di voler uscire?';
	@override String get exitConfirmationWait => 'Attendi';
	@override String get exitConfirmationQuit => 'Esci comunque';
}

// Path: removal
class _Translations$removal$it implements Translations$removal$en {
	_Translations$removal$it._(this._root);

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
class _Translations$done$it implements Translations$done$en {
	_Translations$done$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get allCleanedTitle => 'Tutto pulito!';
	@override String get movedToTrashMessage => 'I file selezionati sono stati spostati nel Cestino.';
	@override String get applicationsRemovedTitle => 'Applicazioni rimosse!';
	@override String get appsMovedToTrashMessage => 'Le app selezionate sono state spostate nel Cestino.';
}

// Path: donate
class _Translations$donate$it implements Translations$donate$en {
	_Translations$donate$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Supporta PristineCleaner';
	@override String get subtitle => 'Se PristineCleaner ti aiuta a mantenere il sistema pulito, puoi supportarne lo sviluppo con una piccola donazione.';
	@override String get buyMeACoffee => 'Buy Me a Coffee';
	@override String get paypalDonate => 'Dona con PayPal';
	@override String get openLinkFailed => 'Impossibile aprire il link della donazione.';
}

// Path: cleanupManager
class _Translations$cleanupManager$it implements Translations$cleanupManager$en {
	_Translations$cleanupManager$it._(this._root);

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
class _Translations$projectDirectory$it implements Translations$projectDirectory$en {
	_Translations$projectDirectory$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get chooseFolder => 'Scegli cartella...';
	@override String get chooseProjectDirectory => 'Scegli directory progetto';
	@override String get chooseParentFolder => 'Scegli cartella principale';
	@override String get noFolder => 'Nessuna cartella';
}

// Path: searchAndSort
class _Translations$searchAndSort$it implements Translations$searchAndSort$en {
	_Translations$searchAndSort$it._(this._root);

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
class _Translations$spaceView$it implements Translations$spaceView$en {
	_Translations$spaceView$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get noFoldersFound => 'Nessuna cartella trovata a questo livello';
	@override String get noBubblesToRender => 'Nessuna bolla da mostrare';
	@override String get otherItems => 'Altri elementi';
}

// Path: home
class _Translations$home$it implements Translations$home$en {
	_Translations$home$it._(this._root);

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
class _Translations$myToolsPage$it implements Translations$myToolsPage$en {
	_Translations$myToolsPage$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'I Miei Strumenti';
	@override String get subtitle => 'Gli strumenti essenziali per tenere il tuo Mac pulito, sicuro e veloce.';
	@override String get backToTools => 'Torna agli strumenti';
}

// Path: myToolsMessages
class _Translations$myToolsMessages$it implements Translations$myToolsMessages$en {
	_Translations$myToolsMessages$it._(this._root);

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
	@override late final _Translations$myToolsMessages$fallback$it fallback = _Translations$myToolsMessages$fallback$it._(_root);
}

// Path: myToolsCatalog
class _Translations$myToolsCatalog$it implements Translations$myToolsCatalog$en {
	_Translations$myToolsCatalog$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _Translations$myToolsCatalog$appLeftovers$it appLeftovers = _Translations$myToolsCatalog$appLeftovers$it._(_root);
	@override late final _Translations$myToolsCatalog$backgroundItems$it backgroundItems = _Translations$myToolsCatalog$backgroundItems$it._(_root);
	@override late final _Translations$myToolsCatalog$downloads$it downloads = _Translations$myToolsCatalog$downloads$it._(_root);
	@override late final _Translations$myToolsCatalog$largeOld$it largeOld = _Translations$myToolsCatalog$largeOld$it._(_root);
	@override late final _Translations$myToolsCatalog$similarImages$it similarImages = _Translations$myToolsCatalog$similarImages$it._(_root);
	@override late final _Translations$myToolsCatalog$trashBins$it trashBins = _Translations$myToolsCatalog$trashBins$it._(_root);
	@override late final _Translations$myToolsCatalog$duplicateFinder$it duplicateFinder = _Translations$myToolsCatalog$duplicateFinder$it._(_root);
	@override late final _Translations$myToolsCatalog$applicationPermissions$it applicationPermissions = _Translations$myToolsCatalog$applicationPermissions$it._(_root);
	@override late final _Translations$myToolsCatalog$systemJunk$it systemJunk = _Translations$myToolsCatalog$systemJunk$it._(_root);
	@override late final _Translations$myToolsCatalog$timeMachineSnapshot$it timeMachineSnapshot = _Translations$myToolsCatalog$timeMachineSnapshot$it._(_root);
	@override late final _Translations$myToolsCatalog$loginItems$it loginItems = _Translations$myToolsCatalog$loginItems$it._(_root);
	@override late final _Translations$myToolsCatalog$mailAttachments$it mailAttachments = _Translations$myToolsCatalog$mailAttachments$it._(_root);
	@override late final _Translations$myToolsCatalog$malwareFinder$it malwareFinder = _Translations$myToolsCatalog$malwareFinder$it._(_root);
	@override late final _Translations$myToolsCatalog$uninstaller$it uninstaller = _Translations$myToolsCatalog$uninstaller$it._(_root);
}

// Path: cleanupCategories
class _Translations$cleanupCategories$it implements Translations$cleanupCategories$en {
	_Translations$cleanupCategories$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _Translations$cleanupCategories$userCache$it userCache = _Translations$cleanupCategories$userCache$it._(_root);
	@override late final _Translations$cleanupCategories$userLogs$it userLogs = _Translations$cleanupCategories$userLogs$it._(_root);
	@override late final _Translations$cleanupCategories$languageFiles$it languageFiles = _Translations$cleanupCategories$languageFiles$it._(_root);
	@override late final _Translations$cleanupCategories$systemLogs$it systemLogs = _Translations$cleanupCategories$systemLogs$it._(_root);
	@override late final _Translations$cleanupCategories$brokenLoginItems$it brokenLoginItems = _Translations$cleanupCategories$brokenLoginItems$it._(_root);
}

// Path: myClutterDashboard
class _Translations$myClutterDashboard$it implements Translations$myClutterDashboard$en {
	_Translations$myClutterDashboard$it._(this._root);

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
class _Translations$scanResults$it implements Translations$scanResults$en {
	_Translations$scanResults$it._(this._root);

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
class _Translations$spaceViewStart$it implements Translations$spaceViewStart$en {
	_Translations$spaceViewStart$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get subtitle => 'Scegli una cartella radice e scansiona per capire cosa occupa piu spazio.';
	@override String get defaultRootPath => 'Il percorso radice predefinito e il tuo disco principale';
	@override String get exploreBubbles => 'Esplora le dimensioni cartelle con bolle interattive';
	@override String get clickToDrillDown => 'Fai clic sulle cartelle per approfondire';
}

// Path: shell
class _Translations$shell$it implements Translations$shell$en {
	_Translations$shell$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get comingSoon => 'In arrivo';
}

// Path: myToolsService
class _Translations$myToolsService$it implements Translations$myToolsService$en {
	_Translations$myToolsService$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get snapshotName => 'Istantanea {id}';
	@override String get timeMachineGroup => 'Time Machine';
	@override String get timeMachineMacOnly => 'Le istantanee Time Machine sono disponibili solo su macOS.';
}

// Path: sections.home
class _Translations$sections$home$it implements Translations$sections$home$en {
	_Translations$sections$home$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Casa';
	@override String get subtitle => 'Visualizza i segni vitali del tuo computer a colpo d\'occhio\ne individua i problemi prima che aumentino.';
	@override late final _Translations$sections$home$features$it features = _Translations$sections$home$features$it._(_root);
}

// Path: sections.cleanup
class _Translations$sections$cleanup$it implements Translations$sections$cleanup$en {
	_Translations$sections$cleanup$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pulizia File Inutili';
	@override String get subtitle => 'Elimina i residui digitali per ripristinare\nvelocità, stabilità e prezioso spazio libero.';
	@override late final _Translations$sections$cleanup$features$it features = _Translations$sections$cleanup$features$it._(_root);
}

// Path: sections.myClutter
class _Translations$sections$myClutter$it implements Translations$sections$myClutter$en {
	_Translations$sections$myClutter$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Il Mio Disordine';
	@override String get subtitle => 'Trasforma le cartelle caotiche in decisioni chiare\ncon la pulizia guidata in pochi minuti.';
	@override late final _Translations$sections$myClutter$features$it features = _Translations$sections$myClutter$features$it._(_root);
}

// Path: sections.spaceView
class _Translations$sections$spaceView$it implements Translations$sections$spaceView$en {
	_Translations$sections$spaceView$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vista Spazio';
	@override String get subtitle => 'Mappa visivamente il tuo disco per individuare\nquello che conta di più e liberare spazio più velocemente.';
	@override late final _Translations$sections$spaceView$features$it features = _Translations$sections$spaceView$features$it._(_root);
}

// Path: sections.applications
class _Translations$sections$applications$it implements Translations$sections$applications$en {
	_Translations$sections$applications$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Applicazioni';
	@override String get subtitle => 'Padroneggia l\'impronta della tua app.\nDisinstalla in modo pulito e rimuovi gli avanzi dimenticati.';
	@override late final _Translations$sections$applications$features$it features = _Translations$sections$applications$features$it._(_root);
}

// Path: sections.myTools
class _Translations$sections$myTools$it implements Translations$sections$myTools$en {
	_Translations$sections$myTools$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'I Miei Strumenti';
	@override String get subtitle => 'Il tuo kit principale per cura e manutenzione del sistema.';
	@override late final _Translations$sections$myTools$features$it features = _Translations$sections$myTools$features$it._(_root);
}

// Path: myToolsMessages.fallback
class _Translations$myToolsMessages$fallback$it implements Translations$myToolsMessages$fallback$en {
	_Translations$myToolsMessages$fallback$it._(this._root);

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
class _Translations$myToolsCatalog$appLeftovers$it implements Translations$myToolsCatalog$appLeftovers$en {
	_Translations$myToolsCatalog$appLeftovers$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Residui App';
	@override String get description => 'Trova e rimuovi residui app anche se l\'app principale non esiste piu.';
}

// Path: myToolsCatalog.backgroundItems
class _Translations$myToolsCatalog$backgroundItems$it implements Translations$myToolsCatalog$backgroundItems$en {
	_Translations$myToolsCatalog$backgroundItems$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Elementi in Background';
	@override String get description => 'Gestisci app e processi in background in esecuzione sul tuo Mac.';
}

// Path: myToolsCatalog.downloads
class _Translations$myToolsCatalog$downloads$it implements Translations$myToolsCatalog$downloads$en {
	_Translations$myToolsCatalog$downloads$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Download';
	@override String get description => 'Rivedi e pulisci file monouso dalla cartella Download.';
}

// Path: myToolsCatalog.largeOld
class _Translations$myToolsCatalog$largeOld$it implements Translations$myToolsCatalog$largeOld$en {
	_Translations$myToolsCatalog$largeOld$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'File Grandi e Vecchi';
	@override String get description => 'Trova e rimuovi file grandi inutilizzati che occupano spazio.';
}

// Path: myToolsCatalog.similarImages
class _Translations$myToolsCatalog$similarImages$it implements Translations$myToolsCatalog$similarImages$en {
	_Translations$myToolsCatalog$similarImages$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Immagini Simili';
	@override String get description => 'Rivedi foto simili e conserva solo le migliori.';
}

// Path: myToolsCatalog.trashBins
class _Translations$myToolsCatalog$trashBins$it implements Translations$myToolsCatalog$trashBins$en {
	_Translations$myToolsCatalog$trashBins$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cestini';
	@override String get description => 'Svuota tutti i cestini disponibili sul tuo Mac.';
}

// Path: myToolsCatalog.duplicateFinder
class _Translations$myToolsCatalog$duplicateFinder$it implements Translations$myToolsCatalog$duplicateFinder$en {
	_Translations$myToolsCatalog$duplicateFinder$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Trova Duplicati';
	@override String get description => 'Rimuovi file duplicati salvati in posizioni diverse.';
}

// Path: myToolsCatalog.applicationPermissions
class _Translations$myToolsCatalog$applicationPermissions$it implements Translations$myToolsCatalog$applicationPermissions$en {
	_Translations$myToolsCatalog$applicationPermissions$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Permessi Applicazioni';
	@override String get description => 'Gestisci come le app accedono a funzioni e dispositivi di sistema.';
}

// Path: myToolsCatalog.systemJunk
class _Translations$myToolsCatalog$systemJunk$it implements Translations$myToolsCatalog$systemJunk$en {
	_Translations$myToolsCatalog$systemJunk$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'File Inutili di Sistema';
	@override String get description => 'Rimuovi file ridondanti che rallentano e occupano spazio.';
}

// Path: myToolsCatalog.timeMachineSnapshot
class _Translations$myToolsCatalog$timeMachineSnapshot$it implements Translations$myToolsCatalog$timeMachineSnapshot$en {
	_Translations$myToolsCatalog$timeMachineSnapshot$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Istantanea Time Machine';
	@override String get description => 'Rimuovi istantanee locali Time Machine senza influire sui backup.';
}

// Path: myToolsCatalog.loginItems
class _Translations$myToolsCatalog$loginItems$it implements Translations$myToolsCatalog$loginItems$en {
	_Translations$myToolsCatalog$loginItems$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Elementi di Accesso';
	@override String get description => 'Gestisci app che si aprono automaticamente all\'avvio del Mac.';
}

// Path: myToolsCatalog.mailAttachments
class _Translations$myToolsCatalog$mailAttachments$it implements Translations$myToolsCatalog$mailAttachments$en {
	_Translations$myToolsCatalog$mailAttachments$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Allegati Mail';
	@override String get description => 'Rimuovi allegati email locali per liberare spazio mantenendo file modificati.';
}

// Path: myToolsCatalog.malwareFinder
class _Translations$myToolsCatalog$malwareFinder$it implements Translations$myToolsCatalog$malwareFinder$en {
	_Translations$myToolsCatalog$malwareFinder$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ricerca Malware';
	@override String get description => 'Individua e rimuovi elementi dannosi per mantenere sicuro il Mac.';
}

// Path: myToolsCatalog.uninstaller
class _Translations$myToolsCatalog$uninstaller$it implements Translations$myToolsCatalog$uninstaller$en {
	_Translations$myToolsCatalog$uninstaller$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Disinstallatore';
	@override String get description => 'Rimuovi correttamente app complete con tutti i file correlati.';
}

// Path: cleanupCategories.userCache
class _Translations$cleanupCategories$userCache$it implements Translations$cleanupCategories$userCache$en {
	_Translations$cleanupCategories$userCache$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get name => 'File Cache Utente';
	@override String get description => 'I file cache migliorano l\'avvio ma si accumulano e possono ridurre prestazioni o stabilita.';
}

// Path: cleanupCategories.userLogs
class _Translations$cleanupCategories$userLogs$it implements Translations$cleanupCategories$userLogs$en {
	_Translations$cleanupCategories$userLogs$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get name => 'File Log Utente';
	@override String get description => 'I log creati da macOS e app possono crescere e occupare molto spazio.';
}

// Path: cleanupCategories.languageFiles
class _Translations$cleanupCategories$languageFiles$it implements Translations$cleanupCategories$languageFiles$en {
	_Translations$cleanupCategories$languageFiles$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get name => 'File Lingua';
	@override String get description => 'Risorse lingua non usate incluse nelle app. Rimuoverle libera spazio senza impatti funzionali.';
}

// Path: cleanupCategories.systemLogs
class _Translations$cleanupCategories$systemLogs$it implements Translations$cleanupCategories$systemLogs$en {
	_Translations$cleanupCategories$systemLogs$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get name => 'File Log di Sistema';
	@override String get description => 'Log di sistema scritti da servizi macOS. Sicuri da rimuovere perche vengono ricreati quando necessario.';
}

// Path: cleanupCategories.brokenLoginItems
class _Translations$cleanupCategories$brokenLoginItems$it implements Translations$cleanupCategories$brokenLoginItems$en {
	_Translations$cleanupCategories$brokenLoginItems$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get name => 'Elementi di Accesso Non Validi';
	@override String get description => 'Elementi che puntano ad app o file inesistenti. Rimuoverli accelera l\'accesso.';
}

// Path: sections.home.features
class _Translations$sections$home$features$it implements Translations$sections$home$features$en {
	_Translations$sections$home$features$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get systemStatus => 'Impulso del sistema in tempo reale';
	@override String get storageUsage => 'Pressione di stoccaggio';
	@override String get quickActions => 'Correzioni con un solo tocco';
}

// Path: sections.cleanup.features
class _Translations$sections$cleanup$features$it implements Translations$sections$cleanup$features$en {
	_Translations$sections$cleanup$features$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get systemJunk => 'Spazzatura residua del sistema';
	@override String get userCache => 'Cache utente gonfia';
	@override String get tempFiles => 'File temporanei obsoleti';
}

// Path: sections.myClutter.features
class _Translations$sections$myClutter$features$it implements Translations$sections$myClutter$features$en {
	_Translations$sections$myClutter$features$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get largeFiles => 'File affamati di spazio';
	@override String get duplicates => 'Cluster duplicati';
	@override String get largeSimilarImages => 'Set di foto quasi corrispondenti';
}

// Path: sections.spaceView.features
class _Translations$sections$spaceView$features$it implements Translations$sections$spaceView$features$en {
	_Translations$sections$spaceView$features$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get visualStorageMap => 'Mappa di archiviazione interattiva';
	@override String get largeFoldersOverview => 'Hotspot di cartelle pesanti';
	@override String get hiddenFilesUncovered => 'Drenatori di spazio nascosto';
}

// Path: sections.applications.features
class _Translations$sections$applications$features$it implements Translations$sections$applications$features$en {
	_Translations$sections$applications$features$it._(this._root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get appUninstaller => 'Programma di disinstallazione approfondita dell\'app';
	@override String get largeApps => 'App pesanti';
	@override String get fileLeftovers => 'File di supporto orfani';
}

// Path: sections.myTools.features
class _Translations$sections$myTools$features$it implements Translations$sections$myTools$features$en {
	_Translations$sections$myTools$features$it._(this._root);

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
			'sections.home.subtitle' => 'Visualizza i segni vitali del tuo computer a colpo d\'occhio\ne individua i problemi prima che aumentino.',
			'sections.home.features.systemStatus' => 'Impulso del sistema in tempo reale',
			'sections.home.features.storageUsage' => 'Pressione di stoccaggio',
			'sections.home.features.quickActions' => 'Correzioni con un solo tocco',
			'sections.cleanup.title' => 'Pulizia File Inutili',
			'sections.cleanup.subtitle' => 'Elimina i residui digitali per ripristinare\nvelocità, stabilità e prezioso spazio libero.',
			'sections.cleanup.features.systemJunk' => 'Spazzatura residua del sistema',
			'sections.cleanup.features.userCache' => 'Cache utente gonfia',
			'sections.cleanup.features.tempFiles' => 'File temporanei obsoleti',
			'sections.myClutter.title' => 'Il Mio Disordine',
			'sections.myClutter.subtitle' => 'Trasforma le cartelle caotiche in decisioni chiare\ncon la pulizia guidata in pochi minuti.',
			'sections.myClutter.features.largeFiles' => 'File affamati di spazio',
			'sections.myClutter.features.duplicates' => 'Cluster duplicati',
			'sections.myClutter.features.largeSimilarImages' => 'Set di foto quasi corrispondenti',
			'sections.spaceView.title' => 'Vista Spazio',
			'sections.spaceView.subtitle' => 'Mappa visivamente il tuo disco per individuare\nquello che conta di più e liberare spazio più velocemente.',
			'sections.spaceView.features.visualStorageMap' => 'Mappa di archiviazione interattiva',
			'sections.spaceView.features.largeFoldersOverview' => 'Hotspot di cartelle pesanti',
			'sections.spaceView.features.hiddenFilesUncovered' => 'Drenatori di spazio nascosto',
			'sections.applications.title' => 'Applicazioni',
			'sections.applications.subtitle' => 'Padroneggia l\'impronta della tua app.\nDisinstalla in modo pulito e rimuovi gli avanzi dimenticati.',
			'sections.applications.features.appUninstaller' => 'Programma di disinstallazione approfondita dell\'app',
			'sections.applications.features.largeApps' => 'App pesanti',
			'sections.applications.features.fileLeftovers' => 'File di supporto orfani',
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
			'dialogs.exitConfirmationTitle' => 'Conferma uscita',
			'dialogs.exitConfirmationMessage' => 'È in corso una scansione. Sei sicuro di voler uscire?',
			'dialogs.exitConfirmationWait' => 'Attendi',
			'dialogs.exitConfirmationQuit' => 'Esci comunque',
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
