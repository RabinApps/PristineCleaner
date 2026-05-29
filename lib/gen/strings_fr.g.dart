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
class TranslationsFr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppFr app = _TranslationsAppFr._(_root);
	@override late final _TranslationsLanguageFr language = _TranslationsLanguageFr._(_root);
	@override late final _TranslationsNavigationFr navigation = _TranslationsNavigationFr._(_root);
	@override late final _TranslationsSectionsFr sections = _TranslationsSectionsFr._(_root);
	@override late final _TranslationsProgressFr progress = _TranslationsProgressFr._(_root);
	@override late final _TranslationsErrorsFr errors = _TranslationsErrorsFr._(_root);
	@override late final _TranslationsButtonsFr buttons = _TranslationsButtonsFr._(_root);
	@override late final _TranslationsTooltipsFr tooltips = _TranslationsTooltipsFr._(_root);
	@override late final _TranslationsDialogsFr dialogs = _TranslationsDialogsFr._(_root);
	@override late final _TranslationsRemovalFr removal = _TranslationsRemovalFr._(_root);
	@override late final _TranslationsDoneFr done = _TranslationsDoneFr._(_root);
	@override late final _TranslationsDonateFr donate = _TranslationsDonateFr._(_root);
	@override late final _TranslationsCleanupManagerFr cleanupManager = _TranslationsCleanupManagerFr._(_root);
	@override late final _TranslationsProjectDirectoryFr projectDirectory = _TranslationsProjectDirectoryFr._(_root);
	@override late final _TranslationsSearchAndSortFr searchAndSort = _TranslationsSearchAndSortFr._(_root);
	@override late final _TranslationsSpaceViewFr spaceView = _TranslationsSpaceViewFr._(_root);
	@override late final _TranslationsHomeFr home = _TranslationsHomeFr._(_root);
	@override late final _TranslationsMyToolsPageFr myToolsPage = _TranslationsMyToolsPageFr._(_root);
	@override late final _TranslationsMyToolsMessagesFr myToolsMessages = _TranslationsMyToolsMessagesFr._(_root);
	@override late final _TranslationsMyToolsCatalogFr myToolsCatalog = _TranslationsMyToolsCatalogFr._(_root);
	@override late final _TranslationsCleanupCategoriesFr cleanupCategories = _TranslationsCleanupCategoriesFr._(_root);
	@override late final _TranslationsMyClutterDashboardFr myClutterDashboard = _TranslationsMyClutterDashboardFr._(_root);
	@override late final _TranslationsScanResultsFr scanResults = _TranslationsScanResultsFr._(_root);
	@override late final _TranslationsSpaceViewStartFr spaceViewStart = _TranslationsSpaceViewStartFr._(_root);
	@override late final _TranslationsShellFr shell = _TranslationsShellFr._(_root);
	@override late final _TranslationsMyToolsServiceFr myToolsService = _TranslationsMyToolsServiceFr._(_root);
}

// Path: app
class _TranslationsAppFr implements TranslationsAppEn {
	_TranslationsAppFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'PristineCleaner';
}

// Path: language
class _TranslationsLanguageFr implements TranslationsLanguageEn {
	_TranslationsLanguageFr._(this._root);

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
class _TranslationsNavigationFr implements TranslationsNavigationEn {
	_TranslationsNavigationFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Maison';
	@override String get cleanup => 'Nettoyage';
	@override String get myClutter => 'Mon désordre';
	@override String get spaceView => 'Vue de l\'espace';
	@override String get applications => 'Applications';
	@override String get myTools => 'Mes outils';
	@override String get donate => 'Faire un don';
}

// Path: sections
class _TranslationsSectionsFr implements TranslationsSectionsEn {
	_TranslationsSectionsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSectionsHomeFr home = _TranslationsSectionsHomeFr._(_root);
	@override late final _TranslationsSectionsCleanupFr cleanup = _TranslationsSectionsCleanupFr._(_root);
	@override late final _TranslationsSectionsMyClutterFr myClutter = _TranslationsSectionsMyClutterFr._(_root);
	@override late final _TranslationsSectionsSpaceViewFr spaceView = _TranslationsSectionsSpaceViewFr._(_root);
	@override late final _TranslationsSectionsApplicationsFr applications = _TranslationsSectionsApplicationsFr._(_root);
	@override late final _TranslationsSectionsMyToolsFr myTools = _TranslationsSectionsMyToolsFr._(_root);
}

// Path: progress
class _TranslationsProgressFr implements TranslationsProgressEn {
	_TranslationsProgressFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get countingFiles => 'Compter les fichiers...';
	@override String get countingApplications => 'On compte les candidatures...';
	@override String get countingFolders => 'Compter les dossiers...';
}

// Path: errors
class _TranslationsErrorsFr implements TranslationsErrorsEn {
	_TranslationsErrorsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get itemsFailedToRemove => '{count} élément(s) n\'a pas pu être supprimé.';
}

// Path: buttons
class _TranslationsButtonsFr implements TranslationsButtonsEn {
	_TranslationsButtonsFr._(this._root);

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
class _TranslationsTooltipsFr implements TranslationsTooltipsEn {
	_TranslationsTooltipsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get search => 'Recherche';
	@override String get openInFinder => 'Ouvrir dans le Finder';
}

// Path: dialogs
class _TranslationsDialogsFr implements TranslationsDialogsEn {
	_TranslationsDialogsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get stopScanningTitle => 'Arrêter la numérisation ?';
	@override String get stopScanningMessage => 'Cela annulera l\'analyse en cours et annulera toute progression partielle.';
	@override String get stopRemovalTitle => 'Arrêter la suppression ?';
	@override String get stopRemovalMessage => 'Le fichier en cours se terminera, puis les fichiers restants seront ignorés.';
}

// Path: removal
class _TranslationsRemovalFr implements TranslationsRemovalEn {
	_TranslationsRemovalFr._(this._root);

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
class _TranslationsDoneFr implements TranslationsDoneEn {
	_TranslationsDoneFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get allCleanedTitle => 'Tout est nettoyé !';
	@override String get movedToTrashMessage => 'Les fichiers sélectionnés ont été déplacés vers la corbeille.';
	@override String get applicationsRemovedTitle => 'Applications supprimées !';
	@override String get appsMovedToTrashMessage => 'Les applications sélectionnées ont été déplacées vers la corbeille.';
}

// Path: donate
class _TranslationsDonateFr implements TranslationsDonateEn {
	_TranslationsDonateFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Soutenir PristineCleaner';
	@override String get subtitle => 'Si PristineCleaner vous aide a garder votre systeme propre, vous pouvez soutenir son developpement avec un petit don.';
	@override String get buyMeACoffee => 'Buy Me a Coffee';
	@override String get paypalDonate => 'Faire un don avec PayPal';
	@override String get openLinkFailed => 'Impossible d\'ouvrir le lien de don.';
}

// Path: cleanupManager
class _TranslationsCleanupManagerFr implements TranslationsCleanupManagerEn {
	_TranslationsCleanupManagerFr._(this._root);

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
class _TranslationsProjectDirectoryFr implements TranslationsProjectDirectoryEn {
	_TranslationsProjectDirectoryFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get chooseFolder => 'Choisissez un dossier...';
	@override String get chooseProjectDirectory => 'Choisir le répertoire du projet';
	@override String get chooseParentFolder => 'Choisir le dossier parent';
	@override String get noFolder => 'Aucun dossier';
}

// Path: searchAndSort
class _TranslationsSearchAndSortFr implements TranslationsSearchAndSortEn {
	_TranslationsSearchAndSortFr._(this._root);

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
class _TranslationsSpaceViewFr implements TranslationsSpaceViewEn {
	_TranslationsSpaceViewFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get noFoldersFound => 'Aucun dossier trouvé pour ce niveau';
	@override String get noBubblesToRender => 'Aucune bulle à restituer';
	@override String get otherItems => 'Autres articles';
}

// Path: home
class _TranslationsHomeFr implements TranslationsHomeEn {
	_TranslationsHomeFr._(this._root);

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
class _TranslationsMyToolsPageFr implements TranslationsMyToolsPageEn {
	_TranslationsMyToolsPageFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mes outils';
	@override String get subtitle => 'Vos outils incontournables pour garder votre Mac propre, sûr et fonctionnel.';
	@override String get backToTools => 'Retour aux outils';
}

// Path: myToolsMessages
class _TranslationsMyToolsMessagesFr implements TranslationsMyToolsMessagesEn {
	_TranslationsMyToolsMessagesFr._(this._root);

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
	@override late final _TranslationsMyToolsMessagesFallbackFr fallback = _TranslationsMyToolsMessagesFallbackFr._(_root);
}

// Path: myToolsCatalog
class _TranslationsMyToolsCatalogFr implements TranslationsMyToolsCatalogEn {
	_TranslationsMyToolsCatalogFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMyToolsCatalogAppLeftoversFr appLeftovers = _TranslationsMyToolsCatalogAppLeftoversFr._(_root);
	@override late final _TranslationsMyToolsCatalogBackgroundItemsFr backgroundItems = _TranslationsMyToolsCatalogBackgroundItemsFr._(_root);
	@override late final _TranslationsMyToolsCatalogDownloadsFr downloads = _TranslationsMyToolsCatalogDownloadsFr._(_root);
	@override late final _TranslationsMyToolsCatalogLargeOldFr largeOld = _TranslationsMyToolsCatalogLargeOldFr._(_root);
	@override late final _TranslationsMyToolsCatalogSimilarImagesFr similarImages = _TranslationsMyToolsCatalogSimilarImagesFr._(_root);
	@override late final _TranslationsMyToolsCatalogTrashBinsFr trashBins = _TranslationsMyToolsCatalogTrashBinsFr._(_root);
	@override late final _TranslationsMyToolsCatalogDuplicateFinderFr duplicateFinder = _TranslationsMyToolsCatalogDuplicateFinderFr._(_root);
	@override late final _TranslationsMyToolsCatalogApplicationPermissionsFr applicationPermissions = _TranslationsMyToolsCatalogApplicationPermissionsFr._(_root);
	@override late final _TranslationsMyToolsCatalogSystemJunkFr systemJunk = _TranslationsMyToolsCatalogSystemJunkFr._(_root);
	@override late final _TranslationsMyToolsCatalogTimeMachineSnapshotFr timeMachineSnapshot = _TranslationsMyToolsCatalogTimeMachineSnapshotFr._(_root);
	@override late final _TranslationsMyToolsCatalogLoginItemsFr loginItems = _TranslationsMyToolsCatalogLoginItemsFr._(_root);
	@override late final _TranslationsMyToolsCatalogMailAttachmentsFr mailAttachments = _TranslationsMyToolsCatalogMailAttachmentsFr._(_root);
	@override late final _TranslationsMyToolsCatalogMalwareFinderFr malwareFinder = _TranslationsMyToolsCatalogMalwareFinderFr._(_root);
	@override late final _TranslationsMyToolsCatalogUninstallerFr uninstaller = _TranslationsMyToolsCatalogUninstallerFr._(_root);
}

// Path: cleanupCategories
class _TranslationsCleanupCategoriesFr implements TranslationsCleanupCategoriesEn {
	_TranslationsCleanupCategoriesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsCleanupCategoriesUserCacheFr userCache = _TranslationsCleanupCategoriesUserCacheFr._(_root);
	@override late final _TranslationsCleanupCategoriesUserLogsFr userLogs = _TranslationsCleanupCategoriesUserLogsFr._(_root);
	@override late final _TranslationsCleanupCategoriesLanguageFilesFr languageFiles = _TranslationsCleanupCategoriesLanguageFilesFr._(_root);
	@override late final _TranslationsCleanupCategoriesSystemLogsFr systemLogs = _TranslationsCleanupCategoriesSystemLogsFr._(_root);
	@override late final _TranslationsCleanupCategoriesBrokenLoginItemsFr brokenLoginItems = _TranslationsCleanupCategoriesBrokenLoginItemsFr._(_root);
}

// Path: myClutterDashboard
class _TranslationsMyClutterDashboardFr implements TranslationsMyClutterDashboardEn {
	_TranslationsMyClutterDashboardFr._(this._root);

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
class _TranslationsScanResultsFr implements TranslationsScanResultsEn {
	_TranslationsScanResultsFr._(this._root);

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
class _TranslationsSpaceViewStartFr implements TranslationsSpaceViewStartEn {
	_TranslationsSpaceViewStartFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get subtitle => 'Choisissez un dossier parent, puis numérisez pour cartographier ce qui occupe le plus d\'espace.';
	@override String get defaultRootPath => 'Le chemin racine par défaut est votre disque dur principal';
	@override String get exploreBubbles => 'Explorez la taille des dossiers grâce à des bulles interactives';
	@override String get clickToDrillDown => 'Cliquez sur les dossiers pour explorer et inspecter plus en profondeur';
}

// Path: shell
class _TranslationsShellFr implements TranslationsShellEn {
	_TranslationsShellFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get comingSoon => 'À venir';
}

// Path: myToolsService
class _TranslationsMyToolsServiceFr implements TranslationsMyToolsServiceEn {
	_TranslationsMyToolsServiceFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get snapshotName => 'Instantané {id}';
	@override String get timeMachineGroup => 'Machine à voyager dans le temps';
	@override String get timeMachineMacOnly => 'Les instantanés Time Machine ne sont disponibles que sur macOS.';
}

// Path: sections.home
class _TranslationsSectionsHomeFr implements TranslationsSectionsHomeEn {
	_TranslationsSectionsHomeFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Maison';
	@override String get subtitle => 'Obtenez un aperçu complet de l\'état de santé de votre système en un seul clic.';
	@override late final _TranslationsSectionsHomeFeaturesFr features = _TranslationsSectionsHomeFeaturesFr._(_root);
}

// Path: sections.cleanup
class _TranslationsSectionsCleanupFr implements TranslationsSectionsCleanupEn {
	_TranslationsSectionsCleanupFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nettoyage indésirable';
	@override String get subtitle => 'Nettoyez votre système pour obtenir\ndes performances maximales et récupérer plus d\'espace libre.';
	@override late final _TranslationsSectionsCleanupFeaturesFr features = _TranslationsSectionsCleanupFeaturesFr._(_root);
}

// Path: sections.myClutter
class _TranslationsSectionsMyClutterFr implements TranslationsSectionsMyClutterEn {
	_TranslationsSectionsMyClutterFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mon désordre';
	@override String get subtitle => 'Triez vos fichiers et réduisez\nle désordre en quelques clics.';
	@override late final _TranslationsSectionsMyClutterFeaturesFr features = _TranslationsSectionsMyClutterFeaturesFr._(_root);
}

// Path: sections.spaceView
class _TranslationsSectionsSpaceViewFr implements TranslationsSectionsSpaceViewEn {
	_TranslationsSectionsSpaceViewFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vue de l\'espace';
	@override String get subtitle => 'Visualisez ce qui occupe le plus d\'espace\ndisque et nettoyez rapidement.';
	@override late final _TranslationsSectionsSpaceViewFeaturesFr features = _TranslationsSectionsSpaceViewFeaturesFr._(_root);
}

// Path: sections.applications
class _TranslationsSectionsApplicationsFr implements TranslationsSectionsApplicationsEn {
	_TranslationsSectionsApplicationsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Applications';
	@override String get subtitle => 'Prenez le contrôle de vos applications.\nDésinstallez ou supprimez les anciens restes.';
	@override late final _TranslationsSectionsApplicationsFeaturesFr features = _TranslationsSectionsApplicationsFeaturesFr._(_root);
}

// Path: sections.myTools
class _TranslationsSectionsMyToolsFr implements TranslationsSectionsMyToolsEn {
	_TranslationsSectionsMyToolsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mes outils';
	@override String get subtitle => 'Votre boîte à outils incontournable pour l’entretien et la maintenance du système.';
	@override late final _TranslationsSectionsMyToolsFeaturesFr features = _TranslationsSectionsMyToolsFeaturesFr._(_root);
}

// Path: myToolsMessages.fallback
class _TranslationsMyToolsMessagesFallbackFr implements TranslationsMyToolsMessagesFallbackEn {
	_TranslationsMyToolsMessagesFallbackFr._(this._root);

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
class _TranslationsMyToolsCatalogAppLeftoversFr implements TranslationsMyToolsCatalogAppLeftoversEn {
	_TranslationsMyToolsCatalogAppLeftoversFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Restes d\'application';
	@override String get description => 'Localisez et supprimez les restes d\'application même si l\'application principale a déjà disparu.';
}

// Path: myToolsCatalog.backgroundItems
class _TranslationsMyToolsCatalogBackgroundItemsFr implements TranslationsMyToolsCatalogBackgroundItemsEn {
	_TranslationsMyToolsCatalogBackgroundItemsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Éléments d\'arrière-plan';
	@override String get description => 'Gérez les applications et les processus en arrière-plan exécutés sur votre Mac.';
}

// Path: myToolsCatalog.downloads
class _TranslationsMyToolsCatalogDownloadsFr implements TranslationsMyToolsCatalogDownloadsEn {
	_TranslationsMyToolsCatalogDownloadsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Téléchargements';
	@override String get description => 'Examinez et nettoyez les fichiers à usage unique des téléchargements pour garder les dossiers bien rangés.';
}

// Path: myToolsCatalog.largeOld
class _TranslationsMyToolsCatalogLargeOldFr implements TranslationsMyToolsCatalogLargeOldEn {
	_TranslationsMyToolsCatalogLargeOldFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fichiers volumineux et anciens';
	@override String get description => 'Recherchez et supprimez les fichiers volumineux et inutilisés qui occupent de l\'espace sur votre Mac.';
}

// Path: myToolsCatalog.similarImages
class _TranslationsMyToolsCatalogSimilarImagesFr implements TranslationsMyToolsCatalogSimilarImagesEn {
	_TranslationsMyToolsCatalogSimilarImagesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Images similaires';
	@override String get description => 'Examinez les photos similaires et ne conservez que les meilleures.';
}

// Path: myToolsCatalog.trashBins
class _TranslationsMyToolsCatalogTrashBinsFr implements TranslationsMyToolsCatalogTrashBinsEn {
	_TranslationsMyToolsCatalogTrashBinsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Poubelles';
	@override String get description => 'Videz toutes les corbeilles disponibles sur votre Mac.';
}

// Path: myToolsCatalog.duplicateFinder
class _TranslationsMyToolsCatalogDuplicateFinderFr implements TranslationsMyToolsCatalogDuplicateFinderEn {
	_TranslationsMyToolsCatalogDuplicateFinderFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Recherche de doublons';
	@override String get description => 'Supprimez les fichiers en double stockés à différents emplacements sur votre Mac.';
}

// Path: myToolsCatalog.applicationPermissions
class _TranslationsMyToolsCatalogApplicationPermissionsFr implements TranslationsMyToolsCatalogApplicationPermissionsEn {
	_TranslationsMyToolsCatalogApplicationPermissionsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Autorisations d\'application';
	@override String get description => 'Gérez la façon dont les applications accèdent aux fonctionnalités, aux appareils et aux fonctionnalités du système.';
}

// Path: myToolsCatalog.systemJunk
class _TranslationsMyToolsCatalogSystemJunkFr implements TranslationsMyToolsCatalogSystemJunkEn {
	_TranslationsMyToolsCatalogSystemJunkFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Indésirable du système';
	@override String get description => 'Supprimez les fichiers redondants qui obstruent le stockage de l\'appareil et entravent les performances optimales.';
}

// Path: myToolsCatalog.timeMachineSnapshot
class _TranslationsMyToolsCatalogTimeMachineSnapshotFr implements TranslationsMyToolsCatalogTimeMachineSnapshotEn {
	_TranslationsMyToolsCatalogTimeMachineSnapshotFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Instantané de Time Machine';
	@override String get description => 'Supprimez les instantanés Time Machine locaux sans affecter vos sauvegardes.';
}

// Path: myToolsCatalog.loginItems
class _TranslationsMyToolsCatalogLoginItemsFr implements TranslationsMyToolsCatalogLoginItemsEn {
	_TranslationsMyToolsCatalogLoginItemsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Éléments de connexion';
	@override String get description => 'Gérez les applications qui s\'ouvrent automatiquement lorsque vous démarrez votre Mac.';
}

// Path: myToolsCatalog.mailAttachments
class _TranslationsMyToolsCatalogMailAttachmentsFr implements TranslationsMyToolsCatalogMailAttachmentsEn {
	_TranslationsMyToolsCatalogMailAttachmentsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pièces jointes au courrier';
	@override String get description => 'Supprimez les pièces jointes stockées localement pour libérer de l\'espace tout en conservant les fichiers modifiés.';
}

// Path: myToolsCatalog.malwareFinder
class _TranslationsMyToolsCatalogMalwareFinderFr implements TranslationsMyToolsCatalogMalwareFinderEn {
	_TranslationsMyToolsCatalogMalwareFinderFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Recherche de logiciels malveillants';
	@override String get description => 'Identifiez et supprimez les éléments malveillants pour assurer la sécurité de votre Mac.';
}

// Path: myToolsCatalog.uninstaller
class _TranslationsMyToolsCatalogUninstallerFr implements TranslationsMyToolsCatalogUninstallerEn {
	_TranslationsMyToolsCatalogUninstallerFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Désinstallateur';
	@override String get description => 'Supprimez correctement des applications entières avec tous les fichiers associés.';
}

// Path: cleanupCategories.userCache
class _TranslationsCleanupCategoriesUserCacheFr implements TranslationsCleanupCategoriesUserCacheEn {
	_TranslationsCleanupCategoriesUserCacheFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get name => 'User Cache Files';
	@override String get description => 'Initialement destinés à améliorer les temps de démarrage, les fichiers cache de vos applications finissent par s\'accumuler et entraînent un dysfonctionnement ou une baisse globale des performances.';
}

// Path: cleanupCategories.userLogs
class _TranslationsCleanupCategoriesUserLogsFr implements TranslationsCleanupCategoriesUserLogsEn {
	_TranslationsCleanupCategoriesUserLogsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get name => 'Fichiers journaux utilisateur';
	@override String get description => 'Les fichiers journaux sont créés par macOS et ses applications pour enregistrer les événements et les erreurs. Au fil du temps, ils peuvent devenir grands et occuper un espace important.';
}

// Path: cleanupCategories.languageFiles
class _TranslationsCleanupCategoriesLanguageFilesFr implements TranslationsCleanupCategoriesLanguageFilesEn {
	_TranslationsCleanupCategoriesLanguageFilesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get name => 'Fichiers de langue';
	@override String get description => 'Ressources de localisation inutilisées fournies avec les applications. La suppression des langues que vous n\'utilisez pas libère de l\'espace de stockage sans affecter les fonctionnalités.';
}

// Path: cleanupCategories.systemLogs
class _TranslationsCleanupCategoriesSystemLogsFr implements TranslationsCleanupCategoriesSystemLogsEn {
	_TranslationsCleanupCategoriesSystemLogsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get name => 'Fichiers journaux système';
	@override String get description => 'Fichiers journaux à l\'échelle du système écrits par les services et démons macOS. Ces fichiers peuvent être supprimés en toute sécurité car le système les recrée en cas de besoin.';
}

// Path: cleanupCategories.brokenLoginItems
class _TranslationsCleanupCategoriesBrokenLoginItemsFr implements TranslationsCleanupCategoriesBrokenLoginItemsEn {
	_TranslationsCleanupCategoriesBrokenLoginItemsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get name => 'Éléments de connexion cassés';
	@override String get description => 'Éléments de connexion qui pointent vers des applications ou des fichiers qui n\'existent plus sur votre disque. Les supprimer accélère le temps de connexion.';
}

// Path: sections.home.features
class _TranslationsSectionsHomeFeaturesFr implements TranslationsSectionsHomeFeaturesEn {
	_TranslationsSectionsHomeFeaturesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get systemStatus => 'État du système';
	@override String get storageUsage => 'Storage Usage';
	@override String get quickActions => 'Actions rapides';
}

// Path: sections.cleanup.features
class _TranslationsSectionsCleanupFeaturesFr implements TranslationsSectionsCleanupFeaturesEn {
	_TranslationsSectionsCleanupFeaturesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get systemJunk => 'Indésirable du système';
	@override String get userCache => 'User Cache';
	@override String get tempFiles => 'Fichiers temporaires';
}

// Path: sections.myClutter.features
class _TranslationsSectionsMyClutterFeaturesFr implements TranslationsSectionsMyClutterFeaturesEn {
	_TranslationsSectionsMyClutterFeaturesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get largeFiles => 'Fichiers volumineux';
	@override String get duplicates => 'Doublons';
	@override String get largeSimilarImages => 'Grandes images similaires';
}

// Path: sections.spaceView.features
class _TranslationsSectionsSpaceViewFeaturesFr implements TranslationsSectionsSpaceViewFeaturesEn {
	_TranslationsSectionsSpaceViewFeaturesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get visualStorageMap => 'Carte de stockage visuelle';
	@override String get largeFoldersOverview => 'Présentation des grands dossiers';
	@override String get hiddenFilesUncovered => 'Fichiers cachés découverts';
}

// Path: sections.applications.features
class _TranslationsSectionsApplicationsFeaturesFr implements TranslationsSectionsApplicationsFeaturesEn {
	_TranslationsSectionsApplicationsFeaturesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get appUninstaller => 'Programme de désinstallation d\'application';
	@override String get largeApps => 'Applications volumineuses';
	@override String get fileLeftovers => 'Restes de fichiers';
}

// Path: sections.myTools.features
class _TranslationsSectionsMyToolsFeaturesFr implements TranslationsSectionsMyToolsFeaturesEn {
	_TranslationsSectionsMyToolsFeaturesFr._(this._root);

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
			'sections.home.title' => 'Maison',
			'sections.home.subtitle' => 'Obtenez un aperçu complet de l\'état de santé de votre système en un seul clic.',
			'sections.home.features.systemStatus' => 'État du système',
			'sections.home.features.storageUsage' => 'Storage Usage',
			'sections.home.features.quickActions' => 'Actions rapides',
			'sections.cleanup.title' => 'Nettoyage indésirable',
			'sections.cleanup.subtitle' => 'Nettoyez votre système pour obtenir\ndes performances maximales et récupérer plus d\'espace libre.',
			'sections.cleanup.features.systemJunk' => 'Indésirable du système',
			'sections.cleanup.features.userCache' => 'User Cache',
			'sections.cleanup.features.tempFiles' => 'Fichiers temporaires',
			'sections.myClutter.title' => 'Mon désordre',
			'sections.myClutter.subtitle' => 'Triez vos fichiers et réduisez\nle désordre en quelques clics.',
			'sections.myClutter.features.largeFiles' => 'Fichiers volumineux',
			'sections.myClutter.features.duplicates' => 'Doublons',
			'sections.myClutter.features.largeSimilarImages' => 'Grandes images similaires',
			'sections.spaceView.title' => 'Vue de l\'espace',
			'sections.spaceView.subtitle' => 'Visualisez ce qui occupe le plus d\'espace\ndisque et nettoyez rapidement.',
			'sections.spaceView.features.visualStorageMap' => 'Carte de stockage visuelle',
			'sections.spaceView.features.largeFoldersOverview' => 'Présentation des grands dossiers',
			'sections.spaceView.features.hiddenFilesUncovered' => 'Fichiers cachés découverts',
			'sections.applications.title' => 'Applications',
			'sections.applications.subtitle' => 'Prenez le contrôle de vos applications.\nDésinstallez ou supprimez les anciens restes.',
			'sections.applications.features.appUninstaller' => 'Programme de désinstallation d\'application',
			'sections.applications.features.largeApps' => 'Applications volumineuses',
			'sections.applications.features.fileLeftovers' => 'Restes de fichiers',
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
			'dialogs.stopRemovalTitle' => 'Arrêter la suppression ?',
			'dialogs.stopRemovalMessage' => 'Le fichier en cours se terminera, puis les fichiers restants seront ignorés.',
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
