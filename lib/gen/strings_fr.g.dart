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
class TranslationsFr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$fr app = _Translations$app$fr._(_root);
	@override late final _Translations$language$fr language = _Translations$language$fr._(_root);
	@override late final _Translations$navigation$fr navigation = _Translations$navigation$fr._(_root);
	@override late final _Translations$settings$fr settings = _Translations$settings$fr._(_root);
	@override late final _Translations$sections$fr sections = _Translations$sections$fr._(_root);
	@override late final _Translations$progress$fr progress = _Translations$progress$fr._(_root);
	@override late final _Translations$errors$fr errors = _Translations$errors$fr._(_root);
	@override late final _Translations$buttons$fr buttons = _Translations$buttons$fr._(_root);
	@override late final _Translations$tooltips$fr tooltips = _Translations$tooltips$fr._(_root);
	@override late final _Translations$dialogs$fr dialogs = _Translations$dialogs$fr._(_root);
	@override late final _Translations$removal$fr removal = _Translations$removal$fr._(_root);
	@override late final _Translations$done$fr done = _Translations$done$fr._(_root);
	@override late final _Translations$donate$fr donate = _Translations$donate$fr._(_root);
	@override late final _Translations$cleanupManager$fr cleanupManager = _Translations$cleanupManager$fr._(_root);
	@override late final _Translations$projectDirectory$fr projectDirectory = _Translations$projectDirectory$fr._(_root);
	@override late final _Translations$searchAndSort$fr searchAndSort = _Translations$searchAndSort$fr._(_root);
	@override late final _Translations$spaceView$fr spaceView = _Translations$spaceView$fr._(_root);
	@override late final _Translations$home$fr home = _Translations$home$fr._(_root);
	@override late final _Translations$myToolsPage$fr myToolsPage = _Translations$myToolsPage$fr._(_root);
	@override late final _Translations$myToolsMessages$fr myToolsMessages = _Translations$myToolsMessages$fr._(_root);
	@override late final _Translations$myToolsCatalog$fr myToolsCatalog = _Translations$myToolsCatalog$fr._(_root);
	@override late final _Translations$cleanupCategories$fr cleanupCategories = _Translations$cleanupCategories$fr._(_root);
	@override late final _Translations$myClutterDashboard$fr myClutterDashboard = _Translations$myClutterDashboard$fr._(_root);
	@override late final _Translations$scanResults$fr scanResults = _Translations$scanResults$fr._(_root);
	@override late final _Translations$spaceViewStart$fr spaceViewStart = _Translations$spaceViewStart$fr._(_root);
	@override late final _Translations$shell$fr shell = _Translations$shell$fr._(_root);
	@override late final _Translations$myToolsService$fr myToolsService = _Translations$myToolsService$fr._(_root);
}

// Path: app
class _Translations$app$fr extends Translations$app$en {
	_Translations$app$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'PristineCleaner';
}

// Path: language
class _Translations$language$fr extends Translations$language$en {
	_Translations$language$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Langue';
	@override String get english => 'Anglais';
	@override String get spanish => 'Espagnol';
	@override String get italian => 'italien';
	@override String get french => 'Français';
	@override String get hebrew => 'hébreu';
	@override String get greek => 'grec';
	@override String get portuguese => 'portugais';
	@override String get mandarin => 'mandarin';
}

// Path: navigation
class _Translations$navigation$fr extends Translations$navigation$en {
	_Translations$navigation$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Maison';
	@override String get cleanup => 'Nettoyage';
	@override String get myClutter => 'Mon désordre';
	@override String get spaceView => 'Vue de l\'espace';
	@override String get applications => 'Applications';
	@override String get myTools => 'Mes outils';
	@override String get donate => 'Faire un don';
	@override String get settings => 'Paramètres';
}

// Path: settings
class _Translations$settings$fr extends Translations$settings$en {
	_Translations$settings$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Paramètres';
	@override String get subtitle => 'Adaptez PristineCleaner à votre façon de travailler.';
	@override String get sectionLanguage => 'Langue';
	@override String get sectionUpdates => 'Mises à jour';
	@override String get sectionBehavior => 'Comportement';
	@override String get autoCheckUpdates => 'Vérifier les mises à jour au démarrage';
	@override String get autoCheckUpdatesSub => 'Recherche automatiquement de nouvelles versions au lancement.';
	@override String get checkForUpdates => 'Vérifier les mises à jour';
	@override String get launchAtLogin => 'Lancer à la connexion';
	@override String get launchAtLoginSub => 'Ouvre PristineCleaner automatiquement à la connexion.';
	@override String get confirmBeforeRemoving => 'Confirmer avant de supprimer';
	@override String get confirmBeforeRemovingSub => 'Affiche une boîte de dialogue de confirmation avant la suppression.';
}

// Path: sections
class _Translations$sections$fr extends Translations$sections$en {
	_Translations$sections$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sections$home$fr home = _Translations$sections$home$fr._(_root);
	@override late final _Translations$sections$cleanup$fr cleanup = _Translations$sections$cleanup$fr._(_root);
	@override late final _Translations$sections$myClutter$fr myClutter = _Translations$sections$myClutter$fr._(_root);
	@override late final _Translations$sections$spaceView$fr spaceView = _Translations$sections$spaceView$fr._(_root);
	@override late final _Translations$sections$applications$fr applications = _Translations$sections$applications$fr._(_root);
	@override late final _Translations$sections$myTools$fr myTools = _Translations$sections$myTools$fr._(_root);
}

// Path: progress
class _Translations$progress$fr extends Translations$progress$en {
	_Translations$progress$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get countingFiles => 'Compter les fichiers...';
	@override String get countingApplications => 'On compte les candidatures...';
	@override String get countingFolders => 'Compter les dossiers...';
}

// Path: errors
class _Translations$errors$fr extends Translations$errors$en {
	_Translations$errors$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get itemsFailedToRemove => '{count} élément(s) n\'a pas pu être supprimé.';
}

// Path: buttons
class _Translations$buttons$fr extends Translations$buttons$en {
	_Translations$buttons$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get scan => 'Balayage';
	@override String get stop => 'Arrêt';
	@override String get done => 'Fait';
	@override String get clean => 'Faire le ménage';
	@override String get cleanUp => 'Nettoyer';
	@override String get close => 'Fermer';
	@override String get refresh => 'Rafraîchir';
	@override String get rescan => 'Nouvelle analyse';
	@override String get startOver => 'Recommencer';
	@override String get selectAll => 'Sélectionner tout';
	@override String get clearSelection => 'Effacer la sélection';
	@override String get keepScanning => 'Continuez à numériser';
	@override String get keepRemoving => 'Continuez à supprimer';
}

// Path: tooltips
class _Translations$tooltips$fr extends Translations$tooltips$en {
	_Translations$tooltips$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get search => 'Recherche';
	@override String get openInFinder => 'Ouvrir dans le Finder';
}

// Path: dialogs
class _Translations$dialogs$fr extends Translations$dialogs$en {
	_Translations$dialogs$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get stopScanningTitle => 'Arrêter la numérisation ?';
	@override String get stopScanningMessage => 'Cela annulera l\'analyse en cours et annulera toute progression partielle.';
	@override String get exitConfirmationTitle => 'Confirmer la fermeture';
	@override String get exitConfirmationMessage => 'Une analyse est en cours. Voulez-vous vraiment quitter ?';
	@override String get exitConfirmationWait => 'Attendre';
	@override String get exitConfirmationQuit => 'Quitter quand même';
	@override String get stopRemovalTitle => 'Arrêter la suppression ?';
	@override String get stopRemovalMessage => 'Le fichier en cours se terminera, puis les fichiers restants seront ignorés.';
	@override String get confirmRemovalTitle => 'Supprimer les éléments sélectionnés ?';
	@override String get confirmRemovalMessage => '{count} élément(s) seront déplacés vers la Corbeille.';
	@override String get confirmRemovalMessagePermanent => '{count} élément(s) seront définitivement supprimés. Action irréversible.';
	@override String get confirmRemovalCancel => 'Annuler';
	@override String get confirmRemovalConfirm => 'Supprimer';
}

// Path: removal
class _Translations$removal$fr extends Translations$removal$en {
	_Translations$removal$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get barrierLabel => 'Progression de la suppression';
	@override String get preparing => 'Préparation...';
	@override String get removingFrom => 'Suppression de {title}';
	@override String get stoppingAfterCurrentFile => 'Arrêt après le fichier en cours...';
	@override String get keepWindowOpen => 'Veuillez garder cette fenêtre ouverte pendant la suppression.';
	@override String get processedSummary => '{processed} sur {total} traités';
	@override String get deletedFreed => '{deleted} supprimé • {bytes} libéré';
	@override String get currentItem => 'Actuel : {name}';
	@override String get stopping => 'Arrêt...';
	@override String get removalFailed => 'Échec de la suppression';
	@override String get removalFailedDetails => 'Une erreur s\'est produite lors de la suppression des fichiers sélectionnés.';
	@override String get removalStopped => 'Suppression arrêtée';
	@override String get removalComplete => 'Suppression terminée';
	@override String get deletedSummary => '{title} élément(s) {count} supprimé(s)';
	@override String get freedSummary => '{bytes} libéré';
	@override String get failedToRemoveSummary => '{count} élément(s) n\'a pas pu être supprimé.';
	@override String get deletedFiles => 'Fichiers supprimés';
	@override String get noFilesDeleted => 'Aucun fichier n\'a été supprimé.';
}

// Path: done
class _Translations$done$fr extends Translations$done$en {
	_Translations$done$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get allCleanedTitle => 'Tout est nettoyé !';
	@override String get movedToTrashMessage => 'Les fichiers sélectionnés ont été déplacés vers la corbeille.';
	@override String get applicationsRemovedTitle => 'Applications supprimées !';
	@override String get appsMovedToTrashMessage => 'Les applications sélectionnées ont été déplacées vers la corbeille.';
}

// Path: donate
class _Translations$donate$fr extends Translations$donate$en {
	_Translations$donate$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Soutenir PristineCleaner';
	@override String get subtitle => 'Si PristineCleaner vous aide a garder votre systeme propre, vous pouvez soutenir son developpement avec un petit don.';
	@override String get buyMeACoffee => 'Buy Me a Coffee';
	@override String get paypalDonate => 'Faire un don avec PayPal';
	@override String get openLinkFailed => 'Impossible d\'ouvrir le lien de don.';
}

// Path: cleanupManager
class _Translations$cleanupManager$fr extends Translations$cleanupManager$en {
	_Translations$cleanupManager$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gestionnaire de nettoyage';
	@override String get systemJunkHeader => 'Indésirable du système';
	@override String get systemJunkDescription => 'Fichiers redondants qui obstruent le stockage de l\'appareil et entravent les performances optimales.';
	@override String get selectLabel => 'Sélectionner';
	@override String get selectAllOption => 'Tous';
	@override String get selectNoneOption => 'Aucun';
	@override String get noItems => 'Aucun article';
	@override String get noItemsFound => 'Aucun article trouvé';
	@override String get itemsSelected => '{count} éléments sélectionnés';
}

// Path: projectDirectory
class _Translations$projectDirectory$fr extends Translations$projectDirectory$en {
	_Translations$projectDirectory$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get chooseFolder => 'Choisissez un dossier...';
	@override String get chooseProjectDirectory => 'Choisir le répertoire du projet';
	@override String get chooseParentFolder => 'Choisir le dossier parent';
	@override String get noFolder => 'Aucun dossier';
}

// Path: searchAndSort
class _Translations$searchAndSort$fr extends Translations$searchAndSort$en {
	_Translations$searchAndSort$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get searchHint => 'Recherche...';
	@override String get sortBy => 'Trier par';
	@override String get size => 'Taille';
	@override String get name => 'Nom';
	@override String get ascending => 'Ascendant';
	@override String get descending => 'Descendant';
}

// Path: spaceView
class _Translations$spaceView$fr extends Translations$spaceView$en {
	_Translations$spaceView$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get noFoldersFound => 'Aucun dossier trouvé pour ce niveau';
	@override String get noBubblesToRender => 'Aucune bulle à restituer';
	@override String get otherItems => 'Autres articles';
}

// Path: home
class _Translations$home$fr extends Translations$home$en {
	_Translations$home$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get refresh => 'Rafraîchir';
	@override String get unableToReadDiskInfo => 'Impossible de lire les informations sur le disque';
	@override String get totalStorage => 'Stockage total';
	@override String get used => 'Utilisé';
	@override String get available => 'Disponible';
	@override String get percentUsed => '{percent}% utilisé';
	@override String get cpuUsage => 'Utilisation du CPU';
	@override String get ramUsage => 'Utilisation de la RAM';
	@override String get memoryPercentUsed => '{percent}% de RAM utilisee';
	@override String get unableToReadSystemInfo => 'Impossible de lire les informations système';
}

// Path: myToolsPage
class _Translations$myToolsPage$fr extends Translations$myToolsPage$en {
	_Translations$myToolsPage$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mes outils';
	@override String get subtitle => 'Vos outils incontournables pour garder votre Mac propre, sûr et fonctionnel.';
	@override String get backToTools => 'Retour aux outils';
}

// Path: myToolsMessages
class _Translations$myToolsMessages$fr extends Translations$myToolsMessages$en {
	_Translations$myToolsMessages$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get itemsWithSize => '{count} article(s) • {size}';
	@override String get scanCancelled => 'l\'analyse a été annulée.';
	@override String get selectAtLeastOne => 'Sélectionnez au moins un élément à nettoyer.';
	@override String get failedToClean => 'Échec du nettoyage de {count} élément(s).';
	@override String get everythingSelectedCleaned => 'Tout ce qui a été sélectionné a été nettoyé.';
	@override String get cleanupUpdated => 'Nettoyage mis à jour.';
	@override String get cleanedCount => 'Article(s) {count} nettoyé(s).';
	@override String get stoppedPrefix => 'Arrêté.';
	@override String get removedCount => 'Élément(s) {count} supprimé(s).';
	@override String get failedCountShort => '{count} a échoué.';
	@override String get scanComplete => 'Scan terminé.';
	@override String get somethingWentWrong => 'Quelque chose s\'est mal passé.';
	@override late final _Translations$myToolsMessages$fallback$fr fallback = _Translations$myToolsMessages$fallback$fr._(_root);
}

// Path: myToolsCatalog
class _Translations$myToolsCatalog$fr extends Translations$myToolsCatalog$en {
	_Translations$myToolsCatalog$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$myToolsCatalog$appLeftovers$fr appLeftovers = _Translations$myToolsCatalog$appLeftovers$fr._(_root);
	@override late final _Translations$myToolsCatalog$backgroundItems$fr backgroundItems = _Translations$myToolsCatalog$backgroundItems$fr._(_root);
	@override late final _Translations$myToolsCatalog$downloads$fr downloads = _Translations$myToolsCatalog$downloads$fr._(_root);
	@override late final _Translations$myToolsCatalog$largeOld$fr largeOld = _Translations$myToolsCatalog$largeOld$fr._(_root);
	@override late final _Translations$myToolsCatalog$similarImages$fr similarImages = _Translations$myToolsCatalog$similarImages$fr._(_root);
	@override late final _Translations$myToolsCatalog$trashBins$fr trashBins = _Translations$myToolsCatalog$trashBins$fr._(_root);
	@override late final _Translations$myToolsCatalog$duplicateFinder$fr duplicateFinder = _Translations$myToolsCatalog$duplicateFinder$fr._(_root);
	@override late final _Translations$myToolsCatalog$applicationPermissions$fr applicationPermissions = _Translations$myToolsCatalog$applicationPermissions$fr._(_root);
	@override late final _Translations$myToolsCatalog$systemJunk$fr systemJunk = _Translations$myToolsCatalog$systemJunk$fr._(_root);
	@override late final _Translations$myToolsCatalog$timeMachineSnapshot$fr timeMachineSnapshot = _Translations$myToolsCatalog$timeMachineSnapshot$fr._(_root);
	@override late final _Translations$myToolsCatalog$loginItems$fr loginItems = _Translations$myToolsCatalog$loginItems$fr._(_root);
	@override late final _Translations$myToolsCatalog$mailAttachments$fr mailAttachments = _Translations$myToolsCatalog$mailAttachments$fr._(_root);
	@override late final _Translations$myToolsCatalog$malwareFinder$fr malwareFinder = _Translations$myToolsCatalog$malwareFinder$fr._(_root);
	@override late final _Translations$myToolsCatalog$uninstaller$fr uninstaller = _Translations$myToolsCatalog$uninstaller$fr._(_root);
}

// Path: cleanupCategories
class _Translations$cleanupCategories$fr extends Translations$cleanupCategories$en {
	_Translations$cleanupCategories$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$cleanupCategories$userCache$fr userCache = _Translations$cleanupCategories$userCache$fr._(_root);
	@override late final _Translations$cleanupCategories$userLogs$fr userLogs = _Translations$cleanupCategories$userLogs$fr._(_root);
	@override late final _Translations$cleanupCategories$languageFiles$fr languageFiles = _Translations$cleanupCategories$languageFiles$fr._(_root);
	@override late final _Translations$cleanupCategories$systemLogs$fr systemLogs = _Translations$cleanupCategories$systemLogs$fr._(_root);
	@override late final _Translations$cleanupCategories$brokenLoginItems$fr brokenLoginItems = _Translations$cleanupCategories$brokenLoginItems$fr._(_root);
}

// Path: myClutterDashboard
class _Translations$myClutterDashboard$fr extends Translations$myClutterDashboard$en {
	_Translations$myClutterDashboard$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get backToCategories => 'Retour aux catégories';
	@override String get filesToSort => 'Vous avez {count} fichiers à trier.';
	@override String get quickRecommendations => 'Utilisez des recommandations rapides ou examinez-les à la main.';
	@override String get reviewAllFiles => 'Examiner tous les fichiers';
	@override String get freshDuplicatesFound => '{count} Nouveaux doublons trouvés';
	@override String get noDuplicates => 'Aucun doublon trouvé dans cette analyse.';
	@override String get removeDuplicateBytes => 'Supprimez {bytes} des fichiers en double.';
	@override String get largeSimilarImagesFound => '{count} Grandes images similaires trouvées';
	@override String get noSimilarGroups => 'Aucun groupe d\'images similaire trouvé.';
	@override String get nearlyIdenticalImages => 'Il y a {bytes} d’images presque identiques.';
	@override String get largeFilesFound => '{bytes} de fichiers volumineux trouvés';
	@override String get noLargeFiles => 'Aucun fichier volumineux trouvé.';
	@override String get largeFilesReady => '{count} les fichiers volumineux sont prêts à être examinés.';
	@override String get review => 'Revoir';
}

// Path: scanResults
class _Translations$scanResults$fr extends Translations$scanResults$en {
	_Translations$scanResults$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get itemsSummary => '{count} articles • {size}';
	@override String get scannedInMs => 'Numérisé en {ms}ms';
	@override String get deselectAll => 'Désélectionner tout';
	@override String get selectAll => 'Sélectionner tout';
	@override String get noItemsMatchSearch => 'Aucun article ne correspond à votre recherche';
	@override String get noItemsFound => 'Aucun article trouvé';
	@override String get itemsSelected => '{count} éléments sélectionnés';
	@override String get rescan => 'Nouvelle analyse';
}

// Path: spaceViewStart
class _Translations$spaceViewStart$fr extends Translations$spaceViewStart$en {
	_Translations$spaceViewStart$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get subtitle => 'Choisissez un dossier parent, puis numérisez pour cartographier ce qui occupe le plus d\'espace.';
	@override String get defaultRootPath => 'Le chemin racine par défaut est votre disque dur principal';
	@override String get exploreBubbles => 'Explorez la taille des dossiers grâce à des bulles interactives';
	@override String get clickToDrillDown => 'Cliquez sur les dossiers pour explorer et inspecter plus en profondeur';
}

// Path: shell
class _Translations$shell$fr extends Translations$shell$en {
	_Translations$shell$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get comingSoon => 'À venir';
}

// Path: myToolsService
class _Translations$myToolsService$fr extends Translations$myToolsService$en {
	_Translations$myToolsService$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get snapshotName => 'Instantané {id}';
	@override String get timeMachineGroup => 'Machine à voyager dans le temps';
	@override String get timeMachineMacOnly => 'Les instantanés Time Machine ne sont disponibles que sur macOS.';
}

// Path: sections.home
class _Translations$sections$home$fr extends Translations$sections$home$en {
	_Translations$sections$home$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Maison';
	@override String get subtitle => 'Consultez les signes vitaux de votre ordinateur en un coup d\'œil\net détectez les problèmes avant qu\'ils ne s\'aggravent.';
	@override late final _Translations$sections$home$features$fr features = _Translations$sections$home$features$fr._(_root);
}

// Path: sections.cleanup
class _Translations$sections$cleanup$fr extends Translations$sections$cleanup$en {
	_Translations$sections$cleanup$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nettoyage indésirable';
	@override String get subtitle => 'Balayez les résidus numériques pour restaurer\nla vitesse, la stabilité et l\'espace libre précieux.';
	@override late final _Translations$sections$cleanup$features$fr features = _Translations$sections$cleanup$features$fr._(_root);
}

// Path: sections.myClutter
class _Translations$sections$myClutter$fr extends Translations$sections$myClutter$en {
	_Translations$sections$myClutter$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mon désordre';
	@override String get subtitle => 'Transformez des dossiers chaotiques en décisions claires\navec un nettoyage guidé en quelques minutes.';
	@override late final _Translations$sections$myClutter$features$fr features = _Translations$sections$myClutter$features$fr._(_root);
}

// Path: sections.spaceView
class _Translations$sections$spaceView$fr extends Translations$sections$spaceView$en {
	_Translations$sections$spaceView$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vue de l\'espace';
	@override String get subtitle => 'Mappez visuellement votre disque pour identifier\nce qui compte le plus et libérer de l\'espace plus rapidement.';
	@override late final _Translations$sections$spaceView$features$fr features = _Translations$sections$spaceView$features$fr._(_root);
}

// Path: sections.applications
class _Translations$sections$applications$fr extends Translations$sections$applications$en {
	_Translations$sections$applications$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Applications';
	@override String get subtitle => 'Maîtrisez l\'empreinte de votre application.\nDésinstallez proprement et supprimez les restes oubliés.';
	@override late final _Translations$sections$applications$features$fr features = _Translations$sections$applications$features$fr._(_root);
}

// Path: sections.myTools
class _Translations$sections$myTools$fr extends Translations$sections$myTools$en {
	_Translations$sections$myTools$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mes outils';
	@override String get subtitle => 'Votre boîte à outils incontournable pour l’entretien et la maintenance du système.';
	@override late final _Translations$sections$myTools$features$fr features = _Translations$sections$myTools$features$fr._(_root);
}

// Path: myToolsMessages.fallback
class _Translations$myToolsMessages$fallback$fr extends Translations$myToolsMessages$fallback$en {
	_Translations$myToolsMessages$fallback$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get downloadsTidy => 'Les téléchargements sont soignés.';
	@override String get noOversizedStale => 'Aucun fichier périmé surdimensionné n’a été trouvé.';
	@override String get noRecentDuplicates => 'Aucun doublon récent trouvé.';
	@override String get noSimilarLargeImages => 'Aucune grande image similaire trouvée.';
	@override String get noAppLeftovers => 'Aucun reste d\'application amovible trouvé.';
	@override String get noStaleApps => 'Aucune application obsolète n\'a été trouvée.';
	@override String get appsNeedReview => 'Des candidatures susceptibles de nécessiter un examen ont été trouvées.';
	@override String get noSystemJunkCandidates => 'Aucun candidat au nettoyage dans les fichiers indésirables du système.';
	@override String get noBrokenStartup => 'Aucune entrée de démarrage/arrière-plan cassée trouvée.';
	@override String get noBackgroundItems => 'Aucun élément d\'arrière-plan n\'a été trouvé.';
	@override String get noPrivacyTraces => 'Aucune trace de confidentialité trouvée dans des emplacements connus.';
	@override String get trashAlreadyEmpty => 'La corbeille est déjà vide.';
	@override String get noPermissionCache => 'Aucun fichier de cache d\'autorisations n\'a été trouvé.';
	@override String get noTimeMachineSnapshots => 'Aucun instantané Time Machine local n\'a été trouvé.';
	@override String get noMaintenanceCandidates => 'Aucun candidat au maintien n\'a été trouvé.';
	@override String get noMailAttachments => 'Aucune pièce jointe amovible n\'a été trouvée.';
	@override String get noSuspiciousFiles => 'Aucun fichier suspect n\'a été détecté.';
}

// Path: myToolsCatalog.appLeftovers
class _Translations$myToolsCatalog$appLeftovers$fr extends Translations$myToolsCatalog$appLeftovers$en {
	_Translations$myToolsCatalog$appLeftovers$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Restes d\'application';
	@override String get description => 'Localisez et supprimez les restes d\'application même si l\'application principale a déjà disparu.';
}

// Path: myToolsCatalog.backgroundItems
class _Translations$myToolsCatalog$backgroundItems$fr extends Translations$myToolsCatalog$backgroundItems$en {
	_Translations$myToolsCatalog$backgroundItems$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Éléments d\'arrière-plan';
	@override String get description => 'Gérez les applications et les processus en arrière-plan exécutés sur votre Mac.';
}

// Path: myToolsCatalog.downloads
class _Translations$myToolsCatalog$downloads$fr extends Translations$myToolsCatalog$downloads$en {
	_Translations$myToolsCatalog$downloads$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Téléchargements';
	@override String get description => 'Examinez et nettoyez les fichiers à usage unique des téléchargements pour garder les dossiers bien rangés.';
}

// Path: myToolsCatalog.largeOld
class _Translations$myToolsCatalog$largeOld$fr extends Translations$myToolsCatalog$largeOld$en {
	_Translations$myToolsCatalog$largeOld$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fichiers volumineux et anciens';
	@override String get description => 'Recherchez et supprimez les fichiers volumineux et inutilisés qui occupent de l\'espace sur votre Mac.';
}

// Path: myToolsCatalog.similarImages
class _Translations$myToolsCatalog$similarImages$fr extends Translations$myToolsCatalog$similarImages$en {
	_Translations$myToolsCatalog$similarImages$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Images similaires';
	@override String get description => 'Examinez les photos similaires et ne conservez que les meilleures.';
}

// Path: myToolsCatalog.trashBins
class _Translations$myToolsCatalog$trashBins$fr extends Translations$myToolsCatalog$trashBins$en {
	_Translations$myToolsCatalog$trashBins$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Poubelles';
	@override String get description => 'Videz toutes les corbeilles disponibles sur votre Mac.';
}

// Path: myToolsCatalog.duplicateFinder
class _Translations$myToolsCatalog$duplicateFinder$fr extends Translations$myToolsCatalog$duplicateFinder$en {
	_Translations$myToolsCatalog$duplicateFinder$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Recherche de doublons';
	@override String get description => 'Supprimez les fichiers en double stockés à différents emplacements sur votre Mac.';
}

// Path: myToolsCatalog.applicationPermissions
class _Translations$myToolsCatalog$applicationPermissions$fr extends Translations$myToolsCatalog$applicationPermissions$en {
	_Translations$myToolsCatalog$applicationPermissions$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Autorisations d\'application';
	@override String get description => 'Gérez la façon dont les applications accèdent aux fonctionnalités, aux appareils et aux fonctionnalités du système.';
}

// Path: myToolsCatalog.systemJunk
class _Translations$myToolsCatalog$systemJunk$fr extends Translations$myToolsCatalog$systemJunk$en {
	_Translations$myToolsCatalog$systemJunk$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Indésirable du système';
	@override String get description => 'Supprimez les fichiers redondants qui obstruent le stockage de l\'appareil et entravent les performances optimales.';
}

// Path: myToolsCatalog.timeMachineSnapshot
class _Translations$myToolsCatalog$timeMachineSnapshot$fr extends Translations$myToolsCatalog$timeMachineSnapshot$en {
	_Translations$myToolsCatalog$timeMachineSnapshot$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Instantané de Time Machine';
	@override String get description => 'Supprimez les instantanés Time Machine locaux sans affecter vos sauvegardes.';
}

// Path: myToolsCatalog.loginItems
class _Translations$myToolsCatalog$loginItems$fr extends Translations$myToolsCatalog$loginItems$en {
	_Translations$myToolsCatalog$loginItems$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Éléments de connexion';
	@override String get description => 'Gérez les applications qui s\'ouvrent automatiquement lorsque vous démarrez votre Mac.';
}

// Path: myToolsCatalog.mailAttachments
class _Translations$myToolsCatalog$mailAttachments$fr extends Translations$myToolsCatalog$mailAttachments$en {
	_Translations$myToolsCatalog$mailAttachments$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pièces jointes au courrier';
	@override String get description => 'Supprimez les pièces jointes stockées localement pour libérer de l\'espace tout en conservant les fichiers modifiés.';
}

// Path: myToolsCatalog.malwareFinder
class _Translations$myToolsCatalog$malwareFinder$fr extends Translations$myToolsCatalog$malwareFinder$en {
	_Translations$myToolsCatalog$malwareFinder$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Recherche de logiciels malveillants';
	@override String get description => 'Identifiez et supprimez les éléments malveillants pour assurer la sécurité de votre Mac.';
}

// Path: myToolsCatalog.uninstaller
class _Translations$myToolsCatalog$uninstaller$fr extends Translations$myToolsCatalog$uninstaller$en {
	_Translations$myToolsCatalog$uninstaller$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Désinstallateur';
	@override String get description => 'Supprimez correctement des applications entières avec tous les fichiers associés.';
}

// Path: cleanupCategories.userCache
class _Translations$cleanupCategories$userCache$fr extends Translations$cleanupCategories$userCache$en {
	_Translations$cleanupCategories$userCache$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get name => 'User Cache Files';
	@override String get description => 'Initialement destinés à améliorer les temps de démarrage, les fichiers cache de vos applications finissent par s\'accumuler et entraînent un dysfonctionnement ou une baisse globale des performances.';
}

// Path: cleanupCategories.userLogs
class _Translations$cleanupCategories$userLogs$fr extends Translations$cleanupCategories$userLogs$en {
	_Translations$cleanupCategories$userLogs$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get name => 'Fichiers journaux utilisateur';
	@override String get description => 'Les fichiers journaux sont créés par macOS et ses applications pour enregistrer les événements et les erreurs. Au fil du temps, ils peuvent devenir grands et occuper un espace important.';
}

// Path: cleanupCategories.languageFiles
class _Translations$cleanupCategories$languageFiles$fr extends Translations$cleanupCategories$languageFiles$en {
	_Translations$cleanupCategories$languageFiles$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get name => 'Fichiers de langue';
	@override String get description => 'Ressources de localisation inutilisées fournies avec les applications. La suppression des langues que vous n\'utilisez pas libère de l\'espace de stockage sans affecter les fonctionnalités.';
}

// Path: cleanupCategories.systemLogs
class _Translations$cleanupCategories$systemLogs$fr extends Translations$cleanupCategories$systemLogs$en {
	_Translations$cleanupCategories$systemLogs$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get name => 'Fichiers journaux système';
	@override String get description => 'Fichiers journaux à l\'échelle du système écrits par les services et démons macOS. Ces fichiers peuvent être supprimés en toute sécurité car le système les recrée en cas de besoin.';
}

// Path: cleanupCategories.brokenLoginItems
class _Translations$cleanupCategories$brokenLoginItems$fr extends Translations$cleanupCategories$brokenLoginItems$en {
	_Translations$cleanupCategories$brokenLoginItems$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get name => 'Éléments de connexion cassés';
	@override String get description => 'Éléments de connexion qui pointent vers des applications ou des fichiers qui n\'existent plus sur votre disque. Les supprimer accélère le temps de connexion.';
}

// Path: sections.home.features
class _Translations$sections$home$features$fr extends Translations$sections$home$features$en {
	_Translations$sections$home$features$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get systemStatus => 'Impulsion du système en direct';
	@override String get storageUsage => 'Pression de stockage';
	@override String get quickActions => 'Correctifs en un seul clic';
}

// Path: sections.cleanup.features
class _Translations$sections$cleanup$features$fr extends Translations$sections$cleanup$features$en {
	_Translations$sections$cleanup$features$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get systemJunk => 'Déchets système résiduels';
	@override String get userCache => 'Cache utilisateur gonflé';
	@override String get tempFiles => 'Fichiers temporaires périmés';
}

// Path: sections.myClutter.features
class _Translations$sections$myClutter$features$fr extends Translations$sections$myClutter$features$en {
	_Translations$sections$myClutter$features$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get largeFiles => 'Fichiers gourmands en espace';
	@override String get duplicates => 'Clusters en double';
	@override String get largeSimilarImages => 'Séries de photos quasi-correspondantes';
}

// Path: sections.spaceView.features
class _Translations$sections$spaceView$features$fr extends Translations$sections$spaceView$features$en {
	_Translations$sections$spaceView$features$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get visualStorageMap => 'Carte de stockage interactive';
	@override String get largeFoldersOverview => 'Points chauds des dossiers lourds';
	@override String get hiddenFilesUncovered => 'Draineurs d\'espace cachés';
}

// Path: sections.applications.features
class _Translations$sections$applications$features$fr extends Translations$sections$applications$features$en {
	_Translations$sections$applications$features$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get appUninstaller => 'Programme de désinstallation d\'applications approfondies';
	@override String get largeApps => 'Applications lourdes';
	@override String get fileLeftovers => 'Fichiers de support orphelins';
}

// Path: sections.myTools.features
class _Translations$sections$myTools$features$fr extends Translations$sections$myTools$features$en {
	_Translations$sections$myTools$features$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get targetedScanners => 'Scanners ciblés';
	@override String get quickActions => 'Actions rapides';
	@override String get liveFiltering => 'Filtrage en direct';
}

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'PristineCleaner',
			'language.label' => 'Langue',
			'language.english' => 'Anglais',
			'language.spanish' => 'Espagnol',
			'language.italian' => 'italien',
			'language.french' => 'Français',
			'language.hebrew' => 'hébreu',
			'language.greek' => 'grec',
			'language.portuguese' => 'portugais',
			'language.mandarin' => 'mandarin',
			'navigation.home' => 'Maison',
			'navigation.cleanup' => 'Nettoyage',
			'navigation.myClutter' => 'Mon désordre',
			'navigation.spaceView' => 'Vue de l\'espace',
			'navigation.applications' => 'Applications',
			'navigation.myTools' => 'Mes outils',
			'navigation.donate' => 'Faire un don',
			'navigation.settings' => 'Paramètres',
			'settings.title' => 'Paramètres',
			'settings.subtitle' => 'Adaptez PristineCleaner à votre façon de travailler.',
			'settings.sectionLanguage' => 'Langue',
			'settings.sectionUpdates' => 'Mises à jour',
			'settings.sectionBehavior' => 'Comportement',
			'settings.autoCheckUpdates' => 'Vérifier les mises à jour au démarrage',
			'settings.autoCheckUpdatesSub' => 'Recherche automatiquement de nouvelles versions au lancement.',
			'settings.checkForUpdates' => 'Vérifier les mises à jour',
			'settings.launchAtLogin' => 'Lancer à la connexion',
			'settings.launchAtLoginSub' => 'Ouvre PristineCleaner automatiquement à la connexion.',
			'settings.confirmBeforeRemoving' => 'Confirmer avant de supprimer',
			'settings.confirmBeforeRemovingSub' => 'Affiche une boîte de dialogue de confirmation avant la suppression.',
			'sections.home.title' => 'Maison',
			'sections.home.subtitle' => 'Consultez les signes vitaux de votre ordinateur en un coup d\'œil\net détectez les problèmes avant qu\'ils ne s\'aggravent.',
			'sections.home.features.systemStatus' => 'Impulsion du système en direct',
			'sections.home.features.storageUsage' => 'Pression de stockage',
			'sections.home.features.quickActions' => 'Correctifs en un seul clic',
			'sections.cleanup.title' => 'Nettoyage indésirable',
			'sections.cleanup.subtitle' => 'Balayez les résidus numériques pour restaurer\nla vitesse, la stabilité et l\'espace libre précieux.',
			'sections.cleanup.features.systemJunk' => 'Déchets système résiduels',
			'sections.cleanup.features.userCache' => 'Cache utilisateur gonflé',
			'sections.cleanup.features.tempFiles' => 'Fichiers temporaires périmés',
			'sections.myClutter.title' => 'Mon désordre',
			'sections.myClutter.subtitle' => 'Transformez des dossiers chaotiques en décisions claires\navec un nettoyage guidé en quelques minutes.',
			'sections.myClutter.features.largeFiles' => 'Fichiers gourmands en espace',
			'sections.myClutter.features.duplicates' => 'Clusters en double',
			'sections.myClutter.features.largeSimilarImages' => 'Séries de photos quasi-correspondantes',
			'sections.spaceView.title' => 'Vue de l\'espace',
			'sections.spaceView.subtitle' => 'Mappez visuellement votre disque pour identifier\nce qui compte le plus et libérer de l\'espace plus rapidement.',
			'sections.spaceView.features.visualStorageMap' => 'Carte de stockage interactive',
			'sections.spaceView.features.largeFoldersOverview' => 'Points chauds des dossiers lourds',
			'sections.spaceView.features.hiddenFilesUncovered' => 'Draineurs d\'espace cachés',
			'sections.applications.title' => 'Applications',
			'sections.applications.subtitle' => 'Maîtrisez l\'empreinte de votre application.\nDésinstallez proprement et supprimez les restes oubliés.',
			'sections.applications.features.appUninstaller' => 'Programme de désinstallation d\'applications approfondies',
			'sections.applications.features.largeApps' => 'Applications lourdes',
			'sections.applications.features.fileLeftovers' => 'Fichiers de support orphelins',
			'sections.myTools.title' => 'Mes outils',
			'sections.myTools.subtitle' => 'Votre boîte à outils incontournable pour l’entretien et la maintenance du système.',
			'sections.myTools.features.targetedScanners' => 'Scanners ciblés',
			'sections.myTools.features.quickActions' => 'Actions rapides',
			'sections.myTools.features.liveFiltering' => 'Filtrage en direct',
			'progress.countingFiles' => 'Compter les fichiers...',
			'progress.countingApplications' => 'On compte les candidatures...',
			'progress.countingFolders' => 'Compter les dossiers...',
			'errors.itemsFailedToRemove' => '{count} élément(s) n\'a pas pu être supprimé.',
			'buttons.scan' => 'Balayage',
			'buttons.stop' => 'Arrêt',
			'buttons.done' => 'Fait',
			'buttons.clean' => 'Faire le ménage',
			'buttons.cleanUp' => 'Nettoyer',
			'buttons.close' => 'Fermer',
			'buttons.refresh' => 'Rafraîchir',
			'buttons.rescan' => 'Nouvelle analyse',
			'buttons.startOver' => 'Recommencer',
			'buttons.selectAll' => 'Sélectionner tout',
			'buttons.clearSelection' => 'Effacer la sélection',
			'buttons.keepScanning' => 'Continuez à numériser',
			'buttons.keepRemoving' => 'Continuez à supprimer',
			'tooltips.search' => 'Recherche',
			'tooltips.openInFinder' => 'Ouvrir dans le Finder',
			'dialogs.stopScanningTitle' => 'Arrêter la numérisation ?',
			'dialogs.stopScanningMessage' => 'Cela annulera l\'analyse en cours et annulera toute progression partielle.',
			'dialogs.exitConfirmationTitle' => 'Confirmer la fermeture',
			'dialogs.exitConfirmationMessage' => 'Une analyse est en cours. Voulez-vous vraiment quitter ?',
			'dialogs.exitConfirmationWait' => 'Attendre',
			'dialogs.exitConfirmationQuit' => 'Quitter quand même',
			'dialogs.stopRemovalTitle' => 'Arrêter la suppression ?',
			'dialogs.stopRemovalMessage' => 'Le fichier en cours se terminera, puis les fichiers restants seront ignorés.',
			'dialogs.confirmRemovalTitle' => 'Supprimer les éléments sélectionnés ?',
			'dialogs.confirmRemovalMessage' => '{count} élément(s) seront déplacés vers la Corbeille.',
			'dialogs.confirmRemovalMessagePermanent' => '{count} élément(s) seront définitivement supprimés. Action irréversible.',
			'dialogs.confirmRemovalCancel' => 'Annuler',
			'dialogs.confirmRemovalConfirm' => 'Supprimer',
			'removal.barrierLabel' => 'Progression de la suppression',
			'removal.preparing' => 'Préparation...',
			'removal.removingFrom' => 'Suppression de {title}',
			'removal.stoppingAfterCurrentFile' => 'Arrêt après le fichier en cours...',
			'removal.keepWindowOpen' => 'Veuillez garder cette fenêtre ouverte pendant la suppression.',
			'removal.processedSummary' => '{processed} sur {total} traités',
			'removal.deletedFreed' => '{deleted} supprimé • {bytes} libéré',
			'removal.currentItem' => 'Actuel : {name}',
			'removal.stopping' => 'Arrêt...',
			'removal.removalFailed' => 'Échec de la suppression',
			'removal.removalFailedDetails' => 'Une erreur s\'est produite lors de la suppression des fichiers sélectionnés.',
			'removal.removalStopped' => 'Suppression arrêtée',
			'removal.removalComplete' => 'Suppression terminée',
			'removal.deletedSummary' => '{title} élément(s) {count} supprimé(s)',
			'removal.freedSummary' => '{bytes} libéré',
			'removal.failedToRemoveSummary' => '{count} élément(s) n\'a pas pu être supprimé.',
			'removal.deletedFiles' => 'Fichiers supprimés',
			'removal.noFilesDeleted' => 'Aucun fichier n\'a été supprimé.',
			'done.allCleanedTitle' => 'Tout est nettoyé !',
			'done.movedToTrashMessage' => 'Les fichiers sélectionnés ont été déplacés vers la corbeille.',
			'done.applicationsRemovedTitle' => 'Applications supprimées !',
			'done.appsMovedToTrashMessage' => 'Les applications sélectionnées ont été déplacées vers la corbeille.',
			'donate.title' => 'Soutenir PristineCleaner',
			'donate.subtitle' => 'Si PristineCleaner vous aide a garder votre systeme propre, vous pouvez soutenir son developpement avec un petit don.',
			'donate.buyMeACoffee' => 'Buy Me a Coffee',
			'donate.paypalDonate' => 'Faire un don avec PayPal',
			'donate.openLinkFailed' => 'Impossible d\'ouvrir le lien de don.',
			'cleanupManager.title' => 'Gestionnaire de nettoyage',
			'cleanupManager.systemJunkHeader' => 'Indésirable du système',
			'cleanupManager.systemJunkDescription' => 'Fichiers redondants qui obstruent le stockage de l\'appareil et entravent les performances optimales.',
			'cleanupManager.selectLabel' => 'Sélectionner',
			'cleanupManager.selectAllOption' => 'Tous',
			'cleanupManager.selectNoneOption' => 'Aucun',
			'cleanupManager.noItems' => 'Aucun article',
			'cleanupManager.noItemsFound' => 'Aucun article trouvé',
			'cleanupManager.itemsSelected' => '{count} éléments sélectionnés',
			'projectDirectory.chooseFolder' => 'Choisissez un dossier...',
			'projectDirectory.chooseProjectDirectory' => 'Choisir le répertoire du projet',
			'projectDirectory.chooseParentFolder' => 'Choisir le dossier parent',
			'projectDirectory.noFolder' => 'Aucun dossier',
			'searchAndSort.searchHint' => 'Recherche...',
			'searchAndSort.sortBy' => 'Trier par',
			'searchAndSort.size' => 'Taille',
			'searchAndSort.name' => 'Nom',
			'searchAndSort.ascending' => 'Ascendant',
			'searchAndSort.descending' => 'Descendant',
			'spaceView.noFoldersFound' => 'Aucun dossier trouvé pour ce niveau',
			'spaceView.noBubblesToRender' => 'Aucune bulle à restituer',
			'spaceView.otherItems' => 'Autres articles',
			'home.refresh' => 'Rafraîchir',
			'home.unableToReadDiskInfo' => 'Impossible de lire les informations sur le disque',
			'home.totalStorage' => 'Stockage total',
			'home.used' => 'Utilisé',
			'home.available' => 'Disponible',
			'home.percentUsed' => '{percent}% utilisé',
			'home.cpuUsage' => 'Utilisation du CPU',
			'home.ramUsage' => 'Utilisation de la RAM',
			'home.memoryPercentUsed' => '{percent}% de RAM utilisee',
			'home.unableToReadSystemInfo' => 'Impossible de lire les informations système',
			'myToolsPage.title' => 'Mes outils',
			'myToolsPage.subtitle' => 'Vos outils incontournables pour garder votre Mac propre, sûr et fonctionnel.',
			'myToolsPage.backToTools' => 'Retour aux outils',
			'myToolsMessages.itemsWithSize' => '{count} article(s) • {size}',
			'myToolsMessages.scanCancelled' => 'l\'analyse a été annulée.',
			'myToolsMessages.selectAtLeastOne' => 'Sélectionnez au moins un élément à nettoyer.',
			'myToolsMessages.failedToClean' => 'Échec du nettoyage de {count} élément(s).',
			'myToolsMessages.everythingSelectedCleaned' => 'Tout ce qui a été sélectionné a été nettoyé.',
			'myToolsMessages.cleanupUpdated' => 'Nettoyage mis à jour.',
			'myToolsMessages.cleanedCount' => 'Article(s) {count} nettoyé(s).',
			'myToolsMessages.stoppedPrefix' => 'Arrêté.',
			'myToolsMessages.removedCount' => 'Élément(s) {count} supprimé(s).',
			'myToolsMessages.failedCountShort' => '{count} a échoué.',
			'myToolsMessages.scanComplete' => 'Scan terminé.',
			'myToolsMessages.somethingWentWrong' => 'Quelque chose s\'est mal passé.',
			'myToolsMessages.fallback.downloadsTidy' => 'Les téléchargements sont soignés.',
			'myToolsMessages.fallback.noOversizedStale' => 'Aucun fichier périmé surdimensionné n’a été trouvé.',
			'myToolsMessages.fallback.noRecentDuplicates' => 'Aucun doublon récent trouvé.',
			'myToolsMessages.fallback.noSimilarLargeImages' => 'Aucune grande image similaire trouvée.',
			'myToolsMessages.fallback.noAppLeftovers' => 'Aucun reste d\'application amovible trouvé.',
			'myToolsMessages.fallback.noStaleApps' => 'Aucune application obsolète n\'a été trouvée.',
			'myToolsMessages.fallback.appsNeedReview' => 'Des candidatures susceptibles de nécessiter un examen ont été trouvées.',
			'myToolsMessages.fallback.noSystemJunkCandidates' => 'Aucun candidat au nettoyage dans les fichiers indésirables du système.',
			'myToolsMessages.fallback.noBrokenStartup' => 'Aucune entrée de démarrage/arrière-plan cassée trouvée.',
			'myToolsMessages.fallback.noBackgroundItems' => 'Aucun élément d\'arrière-plan n\'a été trouvé.',
			'myToolsMessages.fallback.noPrivacyTraces' => 'Aucune trace de confidentialité trouvée dans des emplacements connus.',
			'myToolsMessages.fallback.trashAlreadyEmpty' => 'La corbeille est déjà vide.',
			'myToolsMessages.fallback.noPermissionCache' => 'Aucun fichier de cache d\'autorisations n\'a été trouvé.',
			'myToolsMessages.fallback.noTimeMachineSnapshots' => 'Aucun instantané Time Machine local n\'a été trouvé.',
			'myToolsMessages.fallback.noMaintenanceCandidates' => 'Aucun candidat au maintien n\'a été trouvé.',
			'myToolsMessages.fallback.noMailAttachments' => 'Aucune pièce jointe amovible n\'a été trouvée.',
			'myToolsMessages.fallback.noSuspiciousFiles' => 'Aucun fichier suspect n\'a été détecté.',
			'myToolsCatalog.appLeftovers.title' => 'Restes d\'application',
			'myToolsCatalog.appLeftovers.description' => 'Localisez et supprimez les restes d\'application même si l\'application principale a déjà disparu.',
			'myToolsCatalog.backgroundItems.title' => 'Éléments d\'arrière-plan',
			'myToolsCatalog.backgroundItems.description' => 'Gérez les applications et les processus en arrière-plan exécutés sur votre Mac.',
			'myToolsCatalog.downloads.title' => 'Téléchargements',
			'myToolsCatalog.downloads.description' => 'Examinez et nettoyez les fichiers à usage unique des téléchargements pour garder les dossiers bien rangés.',
			'myToolsCatalog.largeOld.title' => 'Fichiers volumineux et anciens',
			'myToolsCatalog.largeOld.description' => 'Recherchez et supprimez les fichiers volumineux et inutilisés qui occupent de l\'espace sur votre Mac.',
			'myToolsCatalog.similarImages.title' => 'Images similaires',
			'myToolsCatalog.similarImages.description' => 'Examinez les photos similaires et ne conservez que les meilleures.',
			'myToolsCatalog.trashBins.title' => 'Poubelles',
			'myToolsCatalog.trashBins.description' => 'Videz toutes les corbeilles disponibles sur votre Mac.',
			'myToolsCatalog.duplicateFinder.title' => 'Recherche de doublons',
			'myToolsCatalog.duplicateFinder.description' => 'Supprimez les fichiers en double stockés à différents emplacements sur votre Mac.',
			'myToolsCatalog.applicationPermissions.title' => 'Autorisations d\'application',
			'myToolsCatalog.applicationPermissions.description' => 'Gérez la façon dont les applications accèdent aux fonctionnalités, aux appareils et aux fonctionnalités du système.',
			'myToolsCatalog.systemJunk.title' => 'Indésirable du système',
			'myToolsCatalog.systemJunk.description' => 'Supprimez les fichiers redondants qui obstruent le stockage de l\'appareil et entravent les performances optimales.',
			'myToolsCatalog.timeMachineSnapshot.title' => 'Instantané de Time Machine',
			'myToolsCatalog.timeMachineSnapshot.description' => 'Supprimez les instantanés Time Machine locaux sans affecter vos sauvegardes.',
			'myToolsCatalog.loginItems.title' => 'Éléments de connexion',
			'myToolsCatalog.loginItems.description' => 'Gérez les applications qui s\'ouvrent automatiquement lorsque vous démarrez votre Mac.',
			'myToolsCatalog.mailAttachments.title' => 'Pièces jointes au courrier',
			'myToolsCatalog.mailAttachments.description' => 'Supprimez les pièces jointes stockées localement pour libérer de l\'espace tout en conservant les fichiers modifiés.',
			'myToolsCatalog.malwareFinder.title' => 'Recherche de logiciels malveillants',
			'myToolsCatalog.malwareFinder.description' => 'Identifiez et supprimez les éléments malveillants pour assurer la sécurité de votre Mac.',
			'myToolsCatalog.uninstaller.title' => 'Désinstallateur',
			'myToolsCatalog.uninstaller.description' => 'Supprimez correctement des applications entières avec tous les fichiers associés.',
			'cleanupCategories.userCache.name' => 'User Cache Files',
			'cleanupCategories.userCache.description' => 'Initialement destinés à améliorer les temps de démarrage, les fichiers cache de vos applications finissent par s\'accumuler et entraînent un dysfonctionnement ou une baisse globale des performances.',
			'cleanupCategories.userLogs.name' => 'Fichiers journaux utilisateur',
			'cleanupCategories.userLogs.description' => 'Les fichiers journaux sont créés par macOS et ses applications pour enregistrer les événements et les erreurs. Au fil du temps, ils peuvent devenir grands et occuper un espace important.',
			'cleanupCategories.languageFiles.name' => 'Fichiers de langue',
			'cleanupCategories.languageFiles.description' => 'Ressources de localisation inutilisées fournies avec les applications. La suppression des langues que vous n\'utilisez pas libère de l\'espace de stockage sans affecter les fonctionnalités.',
			'cleanupCategories.systemLogs.name' => 'Fichiers journaux système',
			'cleanupCategories.systemLogs.description' => 'Fichiers journaux à l\'échelle du système écrits par les services et démons macOS. Ces fichiers peuvent être supprimés en toute sécurité car le système les recrée en cas de besoin.',
			'cleanupCategories.brokenLoginItems.name' => 'Éléments de connexion cassés',
			'cleanupCategories.brokenLoginItems.description' => 'Éléments de connexion qui pointent vers des applications ou des fichiers qui n\'existent plus sur votre disque. Les supprimer accélère le temps de connexion.',
			'myClutterDashboard.backToCategories' => 'Retour aux catégories',
			'myClutterDashboard.filesToSort' => 'Vous avez {count} fichiers à trier.',
			'myClutterDashboard.quickRecommendations' => 'Utilisez des recommandations rapides ou examinez-les à la main.',
			'myClutterDashboard.reviewAllFiles' => 'Examiner tous les fichiers',
			'myClutterDashboard.freshDuplicatesFound' => '{count} Nouveaux doublons trouvés',
			'myClutterDashboard.noDuplicates' => 'Aucun doublon trouvé dans cette analyse.',
			'myClutterDashboard.removeDuplicateBytes' => 'Supprimez {bytes} des fichiers en double.',
			'myClutterDashboard.largeSimilarImagesFound' => '{count} Grandes images similaires trouvées',
			'myClutterDashboard.noSimilarGroups' => 'Aucun groupe d\'images similaire trouvé.',
			'myClutterDashboard.nearlyIdenticalImages' => 'Il y a {bytes} d’images presque identiques.',
			'myClutterDashboard.largeFilesFound' => '{bytes} de fichiers volumineux trouvés',
			'myClutterDashboard.noLargeFiles' => 'Aucun fichier volumineux trouvé.',
			'myClutterDashboard.largeFilesReady' => '{count} les fichiers volumineux sont prêts à être examinés.',
			'myClutterDashboard.review' => 'Revoir',
			'scanResults.itemsSummary' => '{count} articles • {size}',
			'scanResults.scannedInMs' => 'Numérisé en {ms}ms',
			'scanResults.deselectAll' => 'Désélectionner tout',
			'scanResults.selectAll' => 'Sélectionner tout',
			'scanResults.noItemsMatchSearch' => 'Aucun article ne correspond à votre recherche',
			'scanResults.noItemsFound' => 'Aucun article trouvé',
			'scanResults.itemsSelected' => '{count} éléments sélectionnés',
			'scanResults.rescan' => 'Nouvelle analyse',
			'spaceViewStart.subtitle' => 'Choisissez un dossier parent, puis numérisez pour cartographier ce qui occupe le plus d\'espace.',
			'spaceViewStart.defaultRootPath' => 'Le chemin racine par défaut est votre disque dur principal',
			'spaceViewStart.exploreBubbles' => 'Explorez la taille des dossiers grâce à des bulles interactives',
			'spaceViewStart.clickToDrillDown' => 'Cliquez sur les dossiers pour explorer et inspecter plus en profondeur',
			'shell.comingSoon' => 'À venir',
			'myToolsService.snapshotName' => 'Instantané {id}',
			'myToolsService.timeMachineGroup' => 'Machine à voyager dans le temps',
			'myToolsService.timeMachineMacOnly' => 'Les instantanés Time Machine ne sont disponibles que sur macOS.',
			_ => null,
		};
	}
}
