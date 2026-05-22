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
class TranslationsEs with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppEs app = _TranslationsAppEs._(_root);
	@override late final _TranslationsLanguageEs language = _TranslationsLanguageEs._(_root);
	@override late final _TranslationsNavigationEs navigation = _TranslationsNavigationEs._(_root);
	@override late final _TranslationsSectionsEs sections = _TranslationsSectionsEs._(_root);
	@override late final _TranslationsProgressEs progress = _TranslationsProgressEs._(_root);
	@override late final _TranslationsErrorsEs errors = _TranslationsErrorsEs._(_root);
	@override late final _TranslationsButtonsEs buttons = _TranslationsButtonsEs._(_root);
	@override late final _TranslationsTooltipsEs tooltips = _TranslationsTooltipsEs._(_root);
	@override late final _TranslationsDialogsEs dialogs = _TranslationsDialogsEs._(_root);
	@override late final _TranslationsRemovalEs removal = _TranslationsRemovalEs._(_root);
	@override late final _TranslationsDoneEs done = _TranslationsDoneEs._(_root);
	@override late final _TranslationsCleanupManagerEs cleanupManager = _TranslationsCleanupManagerEs._(_root);
	@override late final _TranslationsProjectDirectoryEs projectDirectory = _TranslationsProjectDirectoryEs._(_root);
	@override late final _TranslationsSearchAndSortEs searchAndSort = _TranslationsSearchAndSortEs._(_root);
	@override late final _TranslationsSpaceViewEs spaceView = _TranslationsSpaceViewEs._(_root);
	@override late final _TranslationsSmartCareEs smartCare = _TranslationsSmartCareEs._(_root);
	@override late final _TranslationsMyToolsPageEs myToolsPage = _TranslationsMyToolsPageEs._(_root);
	@override late final _TranslationsMyToolsMessagesEs myToolsMessages = _TranslationsMyToolsMessagesEs._(_root);
	@override late final _TranslationsMyToolsCatalogEs myToolsCatalog = _TranslationsMyToolsCatalogEs._(_root);
	@override late final _TranslationsCleanupCategoriesEs cleanupCategories = _TranslationsCleanupCategoriesEs._(_root);
	@override late final _TranslationsMyClutterDashboardEs myClutterDashboard = _TranslationsMyClutterDashboardEs._(_root);
	@override late final _TranslationsScanResultsEs scanResults = _TranslationsScanResultsEs._(_root);
	@override late final _TranslationsSpaceViewStartEs spaceViewStart = _TranslationsSpaceViewStartEs._(_root);
	@override late final _TranslationsShellEs shell = _TranslationsShellEs._(_root);
	@override late final _TranslationsMyToolsServiceEs myToolsService = _TranslationsMyToolsServiceEs._(_root);
}

// Path: app
class _TranslationsAppEs implements TranslationsAppEn {
	_TranslationsAppEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'PristineCleaner';
}

// Path: language
class _TranslationsLanguageEs implements TranslationsLanguageEn {
	_TranslationsLanguageEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'Idioma';
	@override String get english => 'Ingles';
	@override String get spanish => 'Espanol';
	@override String get italian => 'Italiano';
}

// Path: navigation
class _TranslationsNavigationEs implements TranslationsNavigationEn {
	_TranslationsNavigationEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get smartCare => 'Cuidado Inteligente';
	@override String get cleanup => 'Limpieza';
	@override String get myClutter => 'Mi Desorden';
	@override String get spaceView => 'Vista de Espacio';
	@override String get applications => 'Aplicaciones';
	@override String get myTools => 'Mis Herramientas';
	@override String get myActivity => 'Mi Actividad';
}

// Path: sections
class _TranslationsSectionsEs implements TranslationsSectionsEn {
	_TranslationsSectionsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSectionsSmartCareEs smartCare = _TranslationsSectionsSmartCareEs._(_root);
	@override late final _TranslationsSectionsCleanupEs cleanup = _TranslationsSectionsCleanupEs._(_root);
	@override late final _TranslationsSectionsMyClutterEs myClutter = _TranslationsSectionsMyClutterEs._(_root);
	@override late final _TranslationsSectionsSpaceViewEs spaceView = _TranslationsSectionsSpaceViewEs._(_root);
	@override late final _TranslationsSectionsApplicationsEs applications = _TranslationsSectionsApplicationsEs._(_root);
	@override late final _TranslationsSectionsMyToolsEs myTools = _TranslationsSectionsMyToolsEs._(_root);
}

// Path: progress
class _TranslationsProgressEs implements TranslationsProgressEn {
	_TranslationsProgressEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get countingFiles => 'Contando archivos...';
	@override String get countingApplications => 'Contando aplicaciones...';
	@override String get countingFolders => 'Contando carpetas...';
}

// Path: errors
class _TranslationsErrorsEs implements TranslationsErrorsEn {
	_TranslationsErrorsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get itemsFailedToRemove => 'No se pudieron eliminar {count} elemento(s).';
}

// Path: buttons
class _TranslationsButtonsEs implements TranslationsButtonsEn {
	_TranslationsButtonsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get scan => 'Escanear';
	@override String get stop => 'Detener';
	@override String get done => 'Listo';
	@override String get clean => 'Limpiar';
	@override String get cleanUp => 'Limpiar';
	@override String get close => 'Cerrar';
	@override String get refresh => 'Actualizar';
	@override String get rescan => 'Reescanear';
	@override String get startOver => 'Empezar de nuevo';
	@override String get selectAll => 'Seleccionar todo';
	@override String get clearSelection => 'Limpiar seleccion';
	@override String get keepScanning => 'Seguir escaneando';
	@override String get keepRemoving => 'Seguir eliminando';
}

// Path: tooltips
class _TranslationsTooltipsEs implements TranslationsTooltipsEn {
	_TranslationsTooltipsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get search => 'Buscar';
	@override String get openInFinder => 'Abrir en Finder';
}

// Path: dialogs
class _TranslationsDialogsEs implements TranslationsDialogsEn {
	_TranslationsDialogsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get stopScanningTitle => 'Detener escaneo?';
	@override String get stopScanningMessage => 'Esto cancelara el escaneo actual y descartara cualquier progreso parcial.';
	@override String get stopRemovalTitle => 'Detener eliminacion?';
	@override String get stopRemovalMessage => 'El archivo actual terminara y luego se omitiran los restantes.';
}

// Path: removal
class _TranslationsRemovalEs implements TranslationsRemovalEn {
	_TranslationsRemovalEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get barrierLabel => 'Progreso de eliminacion';
	@override String get preparing => 'Preparando...';
	@override String get removingFrom => 'Eliminando de {title}';
	@override String get stoppingAfterCurrentFile => 'Deteniendo despues del archivo actual...';
	@override String get keepWindowOpen => 'Mantenga esta ventana abierta mientras se ejecuta la eliminacion.';
	@override String get processedSummary => '{processed} de {total} procesados';
	@override String get deletedFreed => '{deleted} eliminados • {bytes} liberados';
	@override String get currentItem => 'Actual: {name}';
	@override String get stopping => 'Deteniendo...';
	@override String get removalFailed => 'Error al eliminar';
	@override String get removalFailedDetails => 'Ocurrio un problema al eliminar los archivos seleccionados.';
	@override String get removalStopped => 'Eliminacion detenida';
	@override String get removalComplete => 'Eliminacion completada';
	@override String get deletedSummary => '{title} elimino {count} elemento(s)';
	@override String get freedSummary => '{bytes} liberados';
	@override String get failedToRemoveSummary => 'No se pudieron eliminar {count} elemento(s).';
	@override String get deletedFiles => 'Archivos eliminados';
	@override String get noFilesDeleted => 'No se eliminaron archivos.';
}

// Path: done
class _TranslationsDoneEs implements TranslationsDoneEn {
	_TranslationsDoneEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get allCleanedTitle => 'Todo limpio!';
	@override String get movedToTrashMessage => 'Los archivos seleccionados se movieron a la papelera.';
	@override String get applicationsRemovedTitle => 'Aplicaciones eliminadas!';
	@override String get appsMovedToTrashMessage => 'Las apps seleccionadas se movieron a la papelera.';
}

// Path: cleanupManager
class _TranslationsCleanupManagerEs implements TranslationsCleanupManagerEn {
	_TranslationsCleanupManagerEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Administrador de Limpieza';
	@override String get systemJunkHeader => 'Basura del Sistema';
	@override String get systemJunkDescription => 'Archivos redundantes que saturan el almacenamiento y reducen el rendimiento.';
	@override String get selectLabel => 'Seleccion';
	@override String get selectAllOption => 'Todo';
	@override String get selectNoneOption => 'Ninguno';
	@override String get noItems => 'Sin elementos';
	@override String get noItemsFound => 'No se encontraron elementos';
	@override String get itemsSelected => '{count} elementos seleccionados';
}

// Path: projectDirectory
class _TranslationsProjectDirectoryEs implements TranslationsProjectDirectoryEn {
	_TranslationsProjectDirectoryEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get chooseFolder => 'Elegir carpeta...';
	@override String get chooseProjectDirectory => 'Elegir directorio del proyecto';
	@override String get chooseParentFolder => 'Elegir carpeta raiz';
	@override String get noFolder => 'Sin carpeta';
}

// Path: searchAndSort
class _TranslationsSearchAndSortEs implements TranslationsSearchAndSortEn {
	_TranslationsSearchAndSortEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get searchHint => 'Buscar...';
	@override String get sortBy => 'Ordenar por';
	@override String get size => 'Tamano';
	@override String get name => 'Nombre';
	@override String get ascending => 'Ascendente';
	@override String get descending => 'Descendente';
}

// Path: spaceView
class _TranslationsSpaceViewEs implements TranslationsSpaceViewEn {
	_TranslationsSpaceViewEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get noFoldersFound => 'No se encontraron carpetas en este nivel';
	@override String get noBubblesToRender => 'No hay burbujas para mostrar';
	@override String get otherItems => 'Otros elementos';
}

// Path: smartCare
class _TranslationsSmartCareEs implements TranslationsSmartCareEn {
	_TranslationsSmartCareEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get refresh => 'Actualizar';
	@override String get unableToReadDiskInfo => 'No se pudo leer la informacion del disco';
	@override String get totalStorage => 'Almacenamiento Total';
	@override String get used => 'Usado';
	@override String get available => 'Disponible';
	@override String get percentUsed => '{percent}% usado';
}

// Path: myToolsPage
class _TranslationsMyToolsPageEs implements TranslationsMyToolsPageEn {
	_TranslationsMyToolsPageEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mis Herramientas';
	@override String get subtitle => 'Tus herramientas clave para mantener tu Mac limpia, segura y fluida.';
	@override String get backToTools => 'Volver a herramientas';
}

// Path: myToolsMessages
class _TranslationsMyToolsMessagesEs implements TranslationsMyToolsMessagesEn {
	_TranslationsMyToolsMessagesEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get itemsWithSize => '{count} elemento(s) • {size}';
	@override String get scanCancelled => 'el escaneo fue cancelado.';
	@override String get selectAtLeastOne => 'Selecciona al menos un elemento para limpiar.';
	@override String get failedToClean => 'No se pudieron limpiar {count} elemento(s).';
	@override String get everythingSelectedCleaned => 'Todo lo seleccionado fue limpiado.';
	@override String get cleanupUpdated => 'Limpieza actualizada.';
	@override String get cleanedCount => 'Se limpiaron {count} elemento(s).';
	@override String get stoppedPrefix => 'Detenido. ';
	@override String get removedCount => 'Se eliminaron {count} elemento(s).';
	@override String get failedCountShort => ' {count} fallaron.';
	@override String get scanComplete => 'Escaneo completado.';
	@override String get somethingWentWrong => 'Algo salio mal.';
	@override late final _TranslationsMyToolsMessagesFallbackEs fallback = _TranslationsMyToolsMessagesFallbackEs._(_root);
}

// Path: myToolsCatalog
class _TranslationsMyToolsCatalogEs implements TranslationsMyToolsCatalogEn {
	_TranslationsMyToolsCatalogEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMyToolsCatalogAppLeftoversEs appLeftovers = _TranslationsMyToolsCatalogAppLeftoversEs._(_root);
	@override late final _TranslationsMyToolsCatalogBackgroundItemsEs backgroundItems = _TranslationsMyToolsCatalogBackgroundItemsEs._(_root);
	@override late final _TranslationsMyToolsCatalogDownloadsEs downloads = _TranslationsMyToolsCatalogDownloadsEs._(_root);
	@override late final _TranslationsMyToolsCatalogLargeOldEs largeOld = _TranslationsMyToolsCatalogLargeOldEs._(_root);
	@override late final _TranslationsMyToolsCatalogAppUpdaterEs appUpdater = _TranslationsMyToolsCatalogAppUpdaterEs._(_root);
	@override late final _TranslationsMyToolsCatalogSimilarImagesEs similarImages = _TranslationsMyToolsCatalogSimilarImagesEs._(_root);
	@override late final _TranslationsMyToolsCatalogPrivacyItemsEs privacyItems = _TranslationsMyToolsCatalogPrivacyItemsEs._(_root);
	@override late final _TranslationsMyToolsCatalogTrashBinsEs trashBins = _TranslationsMyToolsCatalogTrashBinsEs._(_root);
	@override late final _TranslationsMyToolsCatalogDuplicateFinderEs duplicateFinder = _TranslationsMyToolsCatalogDuplicateFinderEs._(_root);
	@override late final _TranslationsMyToolsCatalogApplicationPermissionsEs applicationPermissions = _TranslationsMyToolsCatalogApplicationPermissionsEs._(_root);
	@override late final _TranslationsMyToolsCatalogSystemJunkEs systemJunk = _TranslationsMyToolsCatalogSystemJunkEs._(_root);
	@override late final _TranslationsMyToolsCatalogTimeMachineSnapshotEs timeMachineSnapshot = _TranslationsMyToolsCatalogTimeMachineSnapshotEs._(_root);
	@override late final _TranslationsMyToolsCatalogMaintenanceTasksEs maintenanceTasks = _TranslationsMyToolsCatalogMaintenanceTasksEs._(_root);
	@override late final _TranslationsMyToolsCatalogLoginItemsEs loginItems = _TranslationsMyToolsCatalogLoginItemsEs._(_root);
	@override late final _TranslationsMyToolsCatalogMailAttachmentsEs mailAttachments = _TranslationsMyToolsCatalogMailAttachmentsEs._(_root);
	@override late final _TranslationsMyToolsCatalogMalwareFinderEs malwareFinder = _TranslationsMyToolsCatalogMalwareFinderEs._(_root);
	@override late final _TranslationsMyToolsCatalogUninstallerEs uninstaller = _TranslationsMyToolsCatalogUninstallerEs._(_root);
}

// Path: cleanupCategories
class _TranslationsCleanupCategoriesEs implements TranslationsCleanupCategoriesEn {
	_TranslationsCleanupCategoriesEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsCleanupCategoriesUserCacheEs userCache = _TranslationsCleanupCategoriesUserCacheEs._(_root);
	@override late final _TranslationsCleanupCategoriesUserLogsEs userLogs = _TranslationsCleanupCategoriesUserLogsEs._(_root);
	@override late final _TranslationsCleanupCategoriesLanguageFilesEs languageFiles = _TranslationsCleanupCategoriesLanguageFilesEs._(_root);
	@override late final _TranslationsCleanupCategoriesSystemLogsEs systemLogs = _TranslationsCleanupCategoriesSystemLogsEs._(_root);
	@override late final _TranslationsCleanupCategoriesBrokenLoginItemsEs brokenLoginItems = _TranslationsCleanupCategoriesBrokenLoginItemsEs._(_root);
}

// Path: myClutterDashboard
class _TranslationsMyClutterDashboardEs implements TranslationsMyClutterDashboardEn {
	_TranslationsMyClutterDashboardEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get backToCategories => 'Volver a categorias';
	@override String get filesToSort => 'Tienes {count} archivos para revisar.';
	@override String get quickRecommendations => 'Usa recomendaciones rapidas o revisalos manualmente.';
	@override String get reviewAllFiles => 'Revisar todos los archivos';
	@override String get freshDuplicatesFound => '{count} duplicados recientes encontrados';
	@override String get noDuplicates => 'No se encontraron duplicados en este escaneo.';
	@override String get removeDuplicateBytes => 'Elimina {bytes} de archivos duplicados.';
	@override String get largeSimilarImagesFound => '{count} imagenes grandes similares encontradas';
	@override String get noSimilarGroups => 'No se encontraron grupos de imagenes similares.';
	@override String get nearlyIdenticalImages => 'Hay {bytes} de imagenes casi identicas.';
	@override String get largeFilesFound => '{bytes} en archivos grandes encontrados';
	@override String get noLargeFiles => 'No se encontraron archivos grandes.';
	@override String get largeFilesReady => '{count} archivos grandes listos para revisar.';
	@override String get review => 'Revisar';
}

// Path: scanResults
class _TranslationsScanResultsEs implements TranslationsScanResultsEn {
	_TranslationsScanResultsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get itemsSummary => '{count} elementos  •  {size}';
	@override String get scannedInMs => 'Escaneado en {ms}ms';
	@override String get deselectAll => 'Deseleccionar todo';
	@override String get selectAll => 'Seleccionar todo';
	@override String get noItemsMatchSearch => 'Ningun elemento coincide con tu busqueda';
	@override String get noItemsFound => 'No se encontraron elementos';
	@override String get itemsSelected => '{count} elementos seleccionados';
	@override String get rescan => 'Reescanear';
}

// Path: spaceViewStart
class _TranslationsSpaceViewStartEs implements TranslationsSpaceViewStartEn {
	_TranslationsSpaceViewStartEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get subtitle => 'Elige una carpeta raiz y escanea para ver que ocupa mas espacio.';
	@override String get defaultRootPath => 'La ruta raiz predeterminada es tu disco principal';
	@override String get exploreBubbles => 'Explora tamano de carpetas con burbujas interactivas';
	@override String get clickToDrillDown => 'Haz clic en carpetas para profundizar e inspeccionar';
}

// Path: shell
class _TranslationsShellEs implements TranslationsShellEn {
	_TranslationsShellEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get comingSoon => 'Proximamente';
}

// Path: myToolsService
class _TranslationsMyToolsServiceEs implements TranslationsMyToolsServiceEn {
	_TranslationsMyToolsServiceEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get snapshotName => 'Instantanea {id}';
	@override String get timeMachineGroup => 'Time Machine';
	@override String get timeMachineMacOnly => 'Las instantaneas de Time Machine solo estan disponibles en macOS.';
}

// Path: sections.smartCare
class _TranslationsSectionsSmartCareEs implements TranslationsSectionsSmartCareEn {
	_TranslationsSectionsSmartCareEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cuidado Inteligente';
	@override String get subtitle => 'Obtenga una vision completa\ndel estado de su sistema en un clic.';
	@override late final _TranslationsSectionsSmartCareFeaturesEs features = _TranslationsSectionsSmartCareFeaturesEs._(_root);
}

// Path: sections.cleanup
class _TranslationsSectionsCleanupEs implements TranslationsSectionsCleanupEn {
	_TranslationsSectionsCleanupEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Limpieza de Basura';
	@override String get subtitle => 'Limpie su sistema para lograr\nmaximo rendimiento y recuperar mas espacio.';
	@override late final _TranslationsSectionsCleanupFeaturesEs features = _TranslationsSectionsCleanupFeaturesEs._(_root);
}

// Path: sections.myClutter
class _TranslationsSectionsMyClutterEs implements TranslationsSectionsMyClutterEn {
	_TranslationsSectionsMyClutterEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mi Desorden';
	@override String get subtitle => 'Ordene sus archivos y reduzca\nel desorden en pocos clics.';
	@override late final _TranslationsSectionsMyClutterFeaturesEs features = _TranslationsSectionsMyClutterFeaturesEs._(_root);
}

// Path: sections.spaceView
class _TranslationsSectionsSpaceViewEs implements TranslationsSectionsSpaceViewEn {
	_TranslationsSectionsSpaceViewEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vista de Espacio';
	@override String get subtitle => 'Visualice que ocupa mas\nespacio en disco y limpie rapido.';
	@override late final _TranslationsSectionsSpaceViewFeaturesEs features = _TranslationsSectionsSpaceViewFeaturesEs._(_root);
}

// Path: sections.applications
class _TranslationsSectionsApplicationsEs implements TranslationsSectionsApplicationsEn {
	_TranslationsSectionsApplicationsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aplicaciones';
	@override String get subtitle => 'Tome control de sus aplicaciones.\nDesinstale o elimine restos antiguos.';
	@override late final _TranslationsSectionsApplicationsFeaturesEs features = _TranslationsSectionsApplicationsFeaturesEs._(_root);
}

// Path: sections.myTools
class _TranslationsSectionsMyToolsEs implements TranslationsSectionsMyToolsEn {
	_TranslationsSectionsMyToolsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mis Herramientas';
	@override String get subtitle => 'Su kit principal para el cuidado y mantenimiento del sistema.';
	@override late final _TranslationsSectionsMyToolsFeaturesEs features = _TranslationsSectionsMyToolsFeaturesEs._(_root);
}

// Path: myToolsMessages.fallback
class _TranslationsMyToolsMessagesFallbackEs implements TranslationsMyToolsMessagesFallbackEn {
	_TranslationsMyToolsMessagesFallbackEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get downloadsTidy => 'Descargas esta ordenado.';
	@override String get noOversizedStale => 'No se encontraron archivos grandes obsoletos.';
	@override String get noRecentDuplicates => 'No se encontraron duplicados recientes.';
	@override String get noSimilarLargeImages => 'No se encontraron imagenes grandes similares.';
	@override String get noAppLeftovers => 'No se encontraron restos de apps eliminables.';
	@override String get noStaleApps => 'No se encontraron apps obsoletas.';
	@override String get appsNeedReview => 'Se encontraron apps que requieren revision.';
	@override String get noSystemJunkCandidates => 'No hay candidatos de limpieza en basura del sistema.';
	@override String get noBrokenStartup => 'No se encontraron entradas rotas de inicio/fondo.';
	@override String get noBackgroundItems => 'No se encontraron elementos en segundo plano.';
	@override String get noPrivacyTraces => 'No se encontraron rastros de privacidad en ubicaciones conocidas.';
	@override String get trashAlreadyEmpty => 'La papelera ya esta vacia.';
	@override String get noPermissionCache => 'No se encontraron archivos de cache de permisos.';
	@override String get noTimeMachineSnapshots => 'No se encontraron instantaneas locales de Time Machine.';
	@override String get noMaintenanceCandidates => 'No se encontraron candidatos de mantenimiento.';
	@override String get noMailAttachments => 'No se encontraron adjuntos de correo eliminables.';
	@override String get noSuspiciousFiles => 'No se detectaron archivos sospechosos.';
}

// Path: myToolsCatalog.appLeftovers
class _TranslationsMyToolsCatalogAppLeftoversEs implements TranslationsMyToolsCatalogAppLeftoversEn {
	_TranslationsMyToolsCatalogAppLeftoversEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Restos de Apps';
	@override String get description => 'Localiza y elimina restos de apps incluso si la app principal ya no existe.';
}

// Path: myToolsCatalog.backgroundItems
class _TranslationsMyToolsCatalogBackgroundItemsEs implements TranslationsMyToolsCatalogBackgroundItemsEn {
	_TranslationsMyToolsCatalogBackgroundItemsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Elementos en Segundo Plano';
	@override String get description => 'Gestiona apps y procesos en segundo plano que se ejecutan en tu Mac.';
}

// Path: myToolsCatalog.downloads
class _TranslationsMyToolsCatalogDownloadsEs implements TranslationsMyToolsCatalogDownloadsEn {
	_TranslationsMyToolsCatalogDownloadsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Descargas';
	@override String get description => 'Revisa y limpia archivos de un solo uso en Descargas para mantener orden.';
}

// Path: myToolsCatalog.largeOld
class _TranslationsMyToolsCatalogLargeOldEs implements TranslationsMyToolsCatalogLargeOldEn {
	_TranslationsMyToolsCatalogLargeOldEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Archivos Grandes y Antiguos';
	@override String get description => 'Encuentra y elimina archivos grandes sin uso que ocupan espacio.';
}

// Path: myToolsCatalog.appUpdater
class _TranslationsMyToolsCatalogAppUpdaterEs implements TranslationsMyToolsCatalogAppUpdaterEn {
	_TranslationsMyToolsCatalogAppUpdaterEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Actualizador de Apps';
	@override String get description => 'Supervisa versiones recientes y confiables de tus aplicaciones.';
}

// Path: myToolsCatalog.similarImages
class _TranslationsMyToolsCatalogSimilarImagesEs implements TranslationsMyToolsCatalogSimilarImagesEn {
	_TranslationsMyToolsCatalogSimilarImagesEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Imagenes Similares';
	@override String get description => 'Revisa fotos similares y conserva solo las mejores.';
}

// Path: myToolsCatalog.privacyItems
class _TranslationsMyToolsCatalogPrivacyItemsEs implements TranslationsMyToolsCatalogPrivacyItemsEn {
	_TranslationsMyToolsCatalogPrivacyItemsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Elementos de Privacidad';
	@override String get description => 'Elimina historial y rastros de actividad para proteger privacidad.';
}

// Path: myToolsCatalog.trashBins
class _TranslationsMyToolsCatalogTrashBinsEs implements TranslationsMyToolsCatalogTrashBinsEn {
	_TranslationsMyToolsCatalogTrashBinsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Papeleras';
	@override String get description => 'Vacia todas las papeleras disponibles en tu Mac.';
}

// Path: myToolsCatalog.duplicateFinder
class _TranslationsMyToolsCatalogDuplicateFinderEs implements TranslationsMyToolsCatalogDuplicateFinderEn {
	_TranslationsMyToolsCatalogDuplicateFinderEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Buscador de Duplicados';
	@override String get description => 'Elimina archivos duplicados guardados en distintas ubicaciones.';
}

// Path: myToolsCatalog.applicationPermissions
class _TranslationsMyToolsCatalogApplicationPermissionsEs implements TranslationsMyToolsCatalogApplicationPermissionsEn {
	_TranslationsMyToolsCatalogApplicationPermissionsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Permisos de Aplicaciones';
	@override String get description => 'Gestiona como las apps acceden a funciones y dispositivos del sistema.';
}

// Path: myToolsCatalog.systemJunk
class _TranslationsMyToolsCatalogSystemJunkEs implements TranslationsMyToolsCatalogSystemJunkEn {
	_TranslationsMyToolsCatalogSystemJunkEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Basura del Sistema';
	@override String get description => 'Elimina archivos redundantes que saturan almacenamiento y rendimiento.';
}

// Path: myToolsCatalog.timeMachineSnapshot
class _TranslationsMyToolsCatalogTimeMachineSnapshotEs implements TranslationsMyToolsCatalogTimeMachineSnapshotEn {
	_TranslationsMyToolsCatalogTimeMachineSnapshotEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Instantanea de Time Machine';
	@override String get description => 'Elimina instantaneas locales de Time Machine sin afectar respaldos.';
}

// Path: myToolsCatalog.maintenanceTasks
class _TranslationsMyToolsCatalogMaintenanceTasksEs implements TranslationsMyToolsCatalogMaintenanceTasksEn {
	_TranslationsMyToolsCatalogMaintenanceTasksEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tareas de Mantenimiento';
	@override String get description => 'Ejecuta tareas recomendadas para llevar tu Mac al maximo.';
}

// Path: myToolsCatalog.loginItems
class _TranslationsMyToolsCatalogLoginItemsEs implements TranslationsMyToolsCatalogLoginItemsEn {
	_TranslationsMyToolsCatalogLoginItemsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Elementos de Inicio';
	@override String get description => 'Gestiona apps que se abren automaticamente al iniciar tu Mac.';
}

// Path: myToolsCatalog.mailAttachments
class _TranslationsMyToolsCatalogMailAttachmentsEs implements TranslationsMyToolsCatalogMailAttachmentsEn {
	_TranslationsMyToolsCatalogMailAttachmentsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Adjuntos de Correo';
	@override String get description => 'Elimina adjuntos locales para liberar espacio conservando archivos modificados.';
}

// Path: myToolsCatalog.malwareFinder
class _TranslationsMyToolsCatalogMalwareFinderEs implements TranslationsMyToolsCatalogMalwareFinderEn {
	_TranslationsMyToolsCatalogMalwareFinderEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detector de Malware';
	@override String get description => 'Identifica y elimina elementos maliciosos para mantener segura tu Mac.';
}

// Path: myToolsCatalog.uninstaller
class _TranslationsMyToolsCatalogUninstallerEs implements TranslationsMyToolsCatalogUninstallerEn {
	_TranslationsMyToolsCatalogUninstallerEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Desinstalador';
	@override String get description => 'Elimina aplicaciones completas junto con archivos relacionados.';
}

// Path: cleanupCategories.userCache
class _TranslationsCleanupCategoriesUserCacheEs implements TranslationsCleanupCategoriesUserCacheEn {
	_TranslationsCleanupCategoriesUserCacheEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get name => 'Archivos de Cache de Usuario';
	@override String get description => 'Los archivos de cache ayudan al inicio, pero se acumulan y pueden causar fallos o baja de rendimiento.';
}

// Path: cleanupCategories.userLogs
class _TranslationsCleanupCategoriesUserLogsEs implements TranslationsCleanupCategoriesUserLogsEn {
	_TranslationsCleanupCategoriesUserLogsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get name => 'Archivos de Registro de Usuario';
	@override String get description => 'Los registros creados por macOS y apps pueden crecer y ocupar mucho espacio con el tiempo.';
}

// Path: cleanupCategories.languageFiles
class _TranslationsCleanupCategoriesLanguageFilesEs implements TranslationsCleanupCategoriesLanguageFilesEn {
	_TranslationsCleanupCategoriesLanguageFilesEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get name => 'Archivos de Idioma';
	@override String get description => 'Recursos de idioma no usados incluidos en apps. Eliminarlos libera espacio sin afectar funciones.';
}

// Path: cleanupCategories.systemLogs
class _TranslationsCleanupCategoriesSystemLogsEs implements TranslationsCleanupCategoriesSystemLogsEn {
	_TranslationsCleanupCategoriesSystemLogsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get name => 'Archivos de Registro del Sistema';
	@override String get description => 'Registros del sistema creados por servicios de macOS. Son seguros de eliminar porque se recrean cuando hace falta.';
}

// Path: cleanupCategories.brokenLoginItems
class _TranslationsCleanupCategoriesBrokenLoginItemsEs implements TranslationsCleanupCategoriesBrokenLoginItemsEn {
	_TranslationsCleanupCategoriesBrokenLoginItemsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get name => 'Elementos de Inicio Rotos';
	@override String get description => 'Elementos que apuntan a apps o archivos inexistentes. Eliminarlos mejora el tiempo de inicio.';
}

// Path: sections.smartCare.features
class _TranslationsSectionsSmartCareFeaturesEs implements TranslationsSectionsSmartCareFeaturesEn {
	_TranslationsSectionsSmartCareFeaturesEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get systemStatus => 'Estado del Sistema';
	@override String get storageUsage => 'Uso de Almacenamiento';
	@override String get quickActions => 'Acciones Rapidas';
}

// Path: sections.cleanup.features
class _TranslationsSectionsCleanupFeaturesEs implements TranslationsSectionsCleanupFeaturesEn {
	_TranslationsSectionsCleanupFeaturesEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get systemJunk => 'Basura del Sistema';
	@override String get userCache => 'Cache de Usuario';
	@override String get tempFiles => 'Archivos Temporales';
}

// Path: sections.myClutter.features
class _TranslationsSectionsMyClutterFeaturesEs implements TranslationsSectionsMyClutterFeaturesEn {
	_TranslationsSectionsMyClutterFeaturesEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get largeFiles => 'Archivos Grandes';
	@override String get duplicates => 'Duplicados';
	@override String get largeSimilarImages => 'Imagenes Similares Grandes';
}

// Path: sections.spaceView.features
class _TranslationsSectionsSpaceViewFeaturesEs implements TranslationsSectionsSpaceViewFeaturesEn {
	_TranslationsSectionsSpaceViewFeaturesEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get visualStorageMap => 'Mapa Visual de Almacenamiento';
	@override String get largeFoldersOverview => 'Resumen de Carpetas Grandes';
	@override String get hiddenFilesUncovered => 'Archivos Ocultos Detectados';
}

// Path: sections.applications.features
class _TranslationsSectionsApplicationsFeaturesEs implements TranslationsSectionsApplicationsFeaturesEn {
	_TranslationsSectionsApplicationsFeaturesEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get appUninstaller => 'Desinstalador de Apps';
	@override String get largeApps => 'Apps Grandes';
	@override String get fileLeftovers => 'Restos de Archivos';
}

// Path: sections.myTools.features
class _TranslationsSectionsMyToolsFeaturesEs implements TranslationsSectionsMyToolsFeaturesEn {
	_TranslationsSectionsMyToolsFeaturesEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get targetedScanners => 'Escaneos Dirigidos';
	@override String get quickActions => 'Acciones Rapidas';
	@override String get liveFiltering => 'Filtrado en Vivo';
}

/// The flat map containing all translations for locale <es>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'PristineCleaner',
			'language.label' => 'Idioma',
			'language.english' => 'Ingles',
			'language.spanish' => 'Espanol',
			'language.italian' => 'Italiano',
			'navigation.smartCare' => 'Cuidado Inteligente',
			'navigation.cleanup' => 'Limpieza',
			'navigation.myClutter' => 'Mi Desorden',
			'navigation.spaceView' => 'Vista de Espacio',
			'navigation.applications' => 'Aplicaciones',
			'navigation.myTools' => 'Mis Herramientas',
			'navigation.myActivity' => 'Mi Actividad',
			'sections.smartCare.title' => 'Cuidado Inteligente',
			'sections.smartCare.subtitle' => 'Obtenga una vision completa\ndel estado de su sistema en un clic.',
			'sections.smartCare.features.systemStatus' => 'Estado del Sistema',
			'sections.smartCare.features.storageUsage' => 'Uso de Almacenamiento',
			'sections.smartCare.features.quickActions' => 'Acciones Rapidas',
			'sections.cleanup.title' => 'Limpieza de Basura',
			'sections.cleanup.subtitle' => 'Limpie su sistema para lograr\nmaximo rendimiento y recuperar mas espacio.',
			'sections.cleanup.features.systemJunk' => 'Basura del Sistema',
			'sections.cleanup.features.userCache' => 'Cache de Usuario',
			'sections.cleanup.features.tempFiles' => 'Archivos Temporales',
			'sections.myClutter.title' => 'Mi Desorden',
			'sections.myClutter.subtitle' => 'Ordene sus archivos y reduzca\nel desorden en pocos clics.',
			'sections.myClutter.features.largeFiles' => 'Archivos Grandes',
			'sections.myClutter.features.duplicates' => 'Duplicados',
			'sections.myClutter.features.largeSimilarImages' => 'Imagenes Similares Grandes',
			'sections.spaceView.title' => 'Vista de Espacio',
			'sections.spaceView.subtitle' => 'Visualice que ocupa mas\nespacio en disco y limpie rapido.',
			'sections.spaceView.features.visualStorageMap' => 'Mapa Visual de Almacenamiento',
			'sections.spaceView.features.largeFoldersOverview' => 'Resumen de Carpetas Grandes',
			'sections.spaceView.features.hiddenFilesUncovered' => 'Archivos Ocultos Detectados',
			'sections.applications.title' => 'Aplicaciones',
			'sections.applications.subtitle' => 'Tome control de sus aplicaciones.\nDesinstale o elimine restos antiguos.',
			'sections.applications.features.appUninstaller' => 'Desinstalador de Apps',
			'sections.applications.features.largeApps' => 'Apps Grandes',
			'sections.applications.features.fileLeftovers' => 'Restos de Archivos',
			'sections.myTools.title' => 'Mis Herramientas',
			'sections.myTools.subtitle' => 'Su kit principal para el cuidado y mantenimiento del sistema.',
			'sections.myTools.features.targetedScanners' => 'Escaneos Dirigidos',
			'sections.myTools.features.quickActions' => 'Acciones Rapidas',
			'sections.myTools.features.liveFiltering' => 'Filtrado en Vivo',
			'progress.countingFiles' => 'Contando archivos...',
			'progress.countingApplications' => 'Contando aplicaciones...',
			'progress.countingFolders' => 'Contando carpetas...',
			'errors.itemsFailedToRemove' => 'No se pudieron eliminar {count} elemento(s).',
			'buttons.scan' => 'Escanear',
			'buttons.stop' => 'Detener',
			'buttons.done' => 'Listo',
			'buttons.clean' => 'Limpiar',
			'buttons.cleanUp' => 'Limpiar',
			'buttons.close' => 'Cerrar',
			'buttons.refresh' => 'Actualizar',
			'buttons.rescan' => 'Reescanear',
			'buttons.startOver' => 'Empezar de nuevo',
			'buttons.selectAll' => 'Seleccionar todo',
			'buttons.clearSelection' => 'Limpiar seleccion',
			'buttons.keepScanning' => 'Seguir escaneando',
			'buttons.keepRemoving' => 'Seguir eliminando',
			'tooltips.search' => 'Buscar',
			'tooltips.openInFinder' => 'Abrir en Finder',
			'dialogs.stopScanningTitle' => 'Detener escaneo?',
			'dialogs.stopScanningMessage' => 'Esto cancelara el escaneo actual y descartara cualquier progreso parcial.',
			'dialogs.stopRemovalTitle' => 'Detener eliminacion?',
			'dialogs.stopRemovalMessage' => 'El archivo actual terminara y luego se omitiran los restantes.',
			'removal.barrierLabel' => 'Progreso de eliminacion',
			'removal.preparing' => 'Preparando...',
			'removal.removingFrom' => 'Eliminando de {title}',
			'removal.stoppingAfterCurrentFile' => 'Deteniendo despues del archivo actual...',
			'removal.keepWindowOpen' => 'Mantenga esta ventana abierta mientras se ejecuta la eliminacion.',
			'removal.processedSummary' => '{processed} de {total} procesados',
			'removal.deletedFreed' => '{deleted} eliminados • {bytes} liberados',
			'removal.currentItem' => 'Actual: {name}',
			'removal.stopping' => 'Deteniendo...',
			'removal.removalFailed' => 'Error al eliminar',
			'removal.removalFailedDetails' => 'Ocurrio un problema al eliminar los archivos seleccionados.',
			'removal.removalStopped' => 'Eliminacion detenida',
			'removal.removalComplete' => 'Eliminacion completada',
			'removal.deletedSummary' => '{title} elimino {count} elemento(s)',
			'removal.freedSummary' => '{bytes} liberados',
			'removal.failedToRemoveSummary' => 'No se pudieron eliminar {count} elemento(s).',
			'removal.deletedFiles' => 'Archivos eliminados',
			'removal.noFilesDeleted' => 'No se eliminaron archivos.',
			'done.allCleanedTitle' => 'Todo limpio!',
			'done.movedToTrashMessage' => 'Los archivos seleccionados se movieron a la papelera.',
			'done.applicationsRemovedTitle' => 'Aplicaciones eliminadas!',
			'done.appsMovedToTrashMessage' => 'Las apps seleccionadas se movieron a la papelera.',
			'cleanupManager.title' => 'Administrador de Limpieza',
			'cleanupManager.systemJunkHeader' => 'Basura del Sistema',
			'cleanupManager.systemJunkDescription' => 'Archivos redundantes que saturan el almacenamiento y reducen el rendimiento.',
			'cleanupManager.selectLabel' => 'Seleccion',
			'cleanupManager.selectAllOption' => 'Todo',
			'cleanupManager.selectNoneOption' => 'Ninguno',
			'cleanupManager.noItems' => 'Sin elementos',
			'cleanupManager.noItemsFound' => 'No se encontraron elementos',
			'cleanupManager.itemsSelected' => '{count} elementos seleccionados',
			'projectDirectory.chooseFolder' => 'Elegir carpeta...',
			'projectDirectory.chooseProjectDirectory' => 'Elegir directorio del proyecto',
			'projectDirectory.chooseParentFolder' => 'Elegir carpeta raiz',
			'projectDirectory.noFolder' => 'Sin carpeta',
			'searchAndSort.searchHint' => 'Buscar...',
			'searchAndSort.sortBy' => 'Ordenar por',
			'searchAndSort.size' => 'Tamano',
			'searchAndSort.name' => 'Nombre',
			'searchAndSort.ascending' => 'Ascendente',
			'searchAndSort.descending' => 'Descendente',
			'spaceView.noFoldersFound' => 'No se encontraron carpetas en este nivel',
			'spaceView.noBubblesToRender' => 'No hay burbujas para mostrar',
			'spaceView.otherItems' => 'Otros elementos',
			'smartCare.refresh' => 'Actualizar',
			'smartCare.unableToReadDiskInfo' => 'No se pudo leer la informacion del disco',
			'smartCare.totalStorage' => 'Almacenamiento Total',
			'smartCare.used' => 'Usado',
			'smartCare.available' => 'Disponible',
			'smartCare.percentUsed' => '{percent}% usado',
			'myToolsPage.title' => 'Mis Herramientas',
			'myToolsPage.subtitle' => 'Tus herramientas clave para mantener tu Mac limpia, segura y fluida.',
			'myToolsPage.backToTools' => 'Volver a herramientas',
			'myToolsMessages.itemsWithSize' => '{count} elemento(s) • {size}',
			'myToolsMessages.scanCancelled' => 'el escaneo fue cancelado.',
			'myToolsMessages.selectAtLeastOne' => 'Selecciona al menos un elemento para limpiar.',
			'myToolsMessages.failedToClean' => 'No se pudieron limpiar {count} elemento(s).',
			'myToolsMessages.everythingSelectedCleaned' => 'Todo lo seleccionado fue limpiado.',
			'myToolsMessages.cleanupUpdated' => 'Limpieza actualizada.',
			'myToolsMessages.cleanedCount' => 'Se limpiaron {count} elemento(s).',
			'myToolsMessages.stoppedPrefix' => 'Detenido. ',
			'myToolsMessages.removedCount' => 'Se eliminaron {count} elemento(s).',
			'myToolsMessages.failedCountShort' => ' {count} fallaron.',
			'myToolsMessages.scanComplete' => 'Escaneo completado.',
			'myToolsMessages.somethingWentWrong' => 'Algo salio mal.',
			'myToolsMessages.fallback.downloadsTidy' => 'Descargas esta ordenado.',
			'myToolsMessages.fallback.noOversizedStale' => 'No se encontraron archivos grandes obsoletos.',
			'myToolsMessages.fallback.noRecentDuplicates' => 'No se encontraron duplicados recientes.',
			'myToolsMessages.fallback.noSimilarLargeImages' => 'No se encontraron imagenes grandes similares.',
			'myToolsMessages.fallback.noAppLeftovers' => 'No se encontraron restos de apps eliminables.',
			'myToolsMessages.fallback.noStaleApps' => 'No se encontraron apps obsoletas.',
			'myToolsMessages.fallback.appsNeedReview' => 'Se encontraron apps que requieren revision.',
			'myToolsMessages.fallback.noSystemJunkCandidates' => 'No hay candidatos de limpieza en basura del sistema.',
			'myToolsMessages.fallback.noBrokenStartup' => 'No se encontraron entradas rotas de inicio/fondo.',
			'myToolsMessages.fallback.noBackgroundItems' => 'No se encontraron elementos en segundo plano.',
			'myToolsMessages.fallback.noPrivacyTraces' => 'No se encontraron rastros de privacidad en ubicaciones conocidas.',
			'myToolsMessages.fallback.trashAlreadyEmpty' => 'La papelera ya esta vacia.',
			'myToolsMessages.fallback.noPermissionCache' => 'No se encontraron archivos de cache de permisos.',
			'myToolsMessages.fallback.noTimeMachineSnapshots' => 'No se encontraron instantaneas locales de Time Machine.',
			'myToolsMessages.fallback.noMaintenanceCandidates' => 'No se encontraron candidatos de mantenimiento.',
			'myToolsMessages.fallback.noMailAttachments' => 'No se encontraron adjuntos de correo eliminables.',
			'myToolsMessages.fallback.noSuspiciousFiles' => 'No se detectaron archivos sospechosos.',
			'myToolsCatalog.appLeftovers.title' => 'Restos de Apps',
			'myToolsCatalog.appLeftovers.description' => 'Localiza y elimina restos de apps incluso si la app principal ya no existe.',
			'myToolsCatalog.backgroundItems.title' => 'Elementos en Segundo Plano',
			'myToolsCatalog.backgroundItems.description' => 'Gestiona apps y procesos en segundo plano que se ejecutan en tu Mac.',
			'myToolsCatalog.downloads.title' => 'Descargas',
			'myToolsCatalog.downloads.description' => 'Revisa y limpia archivos de un solo uso en Descargas para mantener orden.',
			'myToolsCatalog.largeOld.title' => 'Archivos Grandes y Antiguos',
			'myToolsCatalog.largeOld.description' => 'Encuentra y elimina archivos grandes sin uso que ocupan espacio.',
			'myToolsCatalog.appUpdater.title' => 'Actualizador de Apps',
			'myToolsCatalog.appUpdater.description' => 'Supervisa versiones recientes y confiables de tus aplicaciones.',
			'myToolsCatalog.similarImages.title' => 'Imagenes Similares',
			'myToolsCatalog.similarImages.description' => 'Revisa fotos similares y conserva solo las mejores.',
			'myToolsCatalog.privacyItems.title' => 'Elementos de Privacidad',
			'myToolsCatalog.privacyItems.description' => 'Elimina historial y rastros de actividad para proteger privacidad.',
			'myToolsCatalog.trashBins.title' => 'Papeleras',
			'myToolsCatalog.trashBins.description' => 'Vacia todas las papeleras disponibles en tu Mac.',
			'myToolsCatalog.duplicateFinder.title' => 'Buscador de Duplicados',
			'myToolsCatalog.duplicateFinder.description' => 'Elimina archivos duplicados guardados en distintas ubicaciones.',
			'myToolsCatalog.applicationPermissions.title' => 'Permisos de Aplicaciones',
			'myToolsCatalog.applicationPermissions.description' => 'Gestiona como las apps acceden a funciones y dispositivos del sistema.',
			'myToolsCatalog.systemJunk.title' => 'Basura del Sistema',
			'myToolsCatalog.systemJunk.description' => 'Elimina archivos redundantes que saturan almacenamiento y rendimiento.',
			'myToolsCatalog.timeMachineSnapshot.title' => 'Instantanea de Time Machine',
			'myToolsCatalog.timeMachineSnapshot.description' => 'Elimina instantaneas locales de Time Machine sin afectar respaldos.',
			'myToolsCatalog.maintenanceTasks.title' => 'Tareas de Mantenimiento',
			'myToolsCatalog.maintenanceTasks.description' => 'Ejecuta tareas recomendadas para llevar tu Mac al maximo.',
			'myToolsCatalog.loginItems.title' => 'Elementos de Inicio',
			'myToolsCatalog.loginItems.description' => 'Gestiona apps que se abren automaticamente al iniciar tu Mac.',
			'myToolsCatalog.mailAttachments.title' => 'Adjuntos de Correo',
			'myToolsCatalog.mailAttachments.description' => 'Elimina adjuntos locales para liberar espacio conservando archivos modificados.',
			'myToolsCatalog.malwareFinder.title' => 'Detector de Malware',
			'myToolsCatalog.malwareFinder.description' => 'Identifica y elimina elementos maliciosos para mantener segura tu Mac.',
			'myToolsCatalog.uninstaller.title' => 'Desinstalador',
			'myToolsCatalog.uninstaller.description' => 'Elimina aplicaciones completas junto con archivos relacionados.',
			'cleanupCategories.userCache.name' => 'Archivos de Cache de Usuario',
			'cleanupCategories.userCache.description' => 'Los archivos de cache ayudan al inicio, pero se acumulan y pueden causar fallos o baja de rendimiento.',
			'cleanupCategories.userLogs.name' => 'Archivos de Registro de Usuario',
			'cleanupCategories.userLogs.description' => 'Los registros creados por macOS y apps pueden crecer y ocupar mucho espacio con el tiempo.',
			'cleanupCategories.languageFiles.name' => 'Archivos de Idioma',
			'cleanupCategories.languageFiles.description' => 'Recursos de idioma no usados incluidos en apps. Eliminarlos libera espacio sin afectar funciones.',
			'cleanupCategories.systemLogs.name' => 'Archivos de Registro del Sistema',
			'cleanupCategories.systemLogs.description' => 'Registros del sistema creados por servicios de macOS. Son seguros de eliminar porque se recrean cuando hace falta.',
			'cleanupCategories.brokenLoginItems.name' => 'Elementos de Inicio Rotos',
			'cleanupCategories.brokenLoginItems.description' => 'Elementos que apuntan a apps o archivos inexistentes. Eliminarlos mejora el tiempo de inicio.',
			'myClutterDashboard.backToCategories' => 'Volver a categorias',
			'myClutterDashboard.filesToSort' => 'Tienes {count} archivos para revisar.',
			'myClutterDashboard.quickRecommendations' => 'Usa recomendaciones rapidas o revisalos manualmente.',
			'myClutterDashboard.reviewAllFiles' => 'Revisar todos los archivos',
			'myClutterDashboard.freshDuplicatesFound' => '{count} duplicados recientes encontrados',
			'myClutterDashboard.noDuplicates' => 'No se encontraron duplicados en este escaneo.',
			'myClutterDashboard.removeDuplicateBytes' => 'Elimina {bytes} de archivos duplicados.',
			'myClutterDashboard.largeSimilarImagesFound' => '{count} imagenes grandes similares encontradas',
			'myClutterDashboard.noSimilarGroups' => 'No se encontraron grupos de imagenes similares.',
			'myClutterDashboard.nearlyIdenticalImages' => 'Hay {bytes} de imagenes casi identicas.',
			'myClutterDashboard.largeFilesFound' => '{bytes} en archivos grandes encontrados',
			'myClutterDashboard.noLargeFiles' => 'No se encontraron archivos grandes.',
			'myClutterDashboard.largeFilesReady' => '{count} archivos grandes listos para revisar.',
			'myClutterDashboard.review' => 'Revisar',
			'scanResults.itemsSummary' => '{count} elementos  •  {size}',
			'scanResults.scannedInMs' => 'Escaneado en {ms}ms',
			'scanResults.deselectAll' => 'Deseleccionar todo',
			'scanResults.selectAll' => 'Seleccionar todo',
			'scanResults.noItemsMatchSearch' => 'Ningun elemento coincide con tu busqueda',
			'scanResults.noItemsFound' => 'No se encontraron elementos',
			'scanResults.itemsSelected' => '{count} elementos seleccionados',
			'scanResults.rescan' => 'Reescanear',
			'spaceViewStart.subtitle' => 'Elige una carpeta raiz y escanea para ver que ocupa mas espacio.',
			'spaceViewStart.defaultRootPath' => 'La ruta raiz predeterminada es tu disco principal',
			'spaceViewStart.exploreBubbles' => 'Explora tamano de carpetas con burbujas interactivas',
			'spaceViewStart.clickToDrillDown' => 'Haz clic en carpetas para profundizar e inspeccionar',
			'shell.comingSoon' => 'Proximamente',
			'myToolsService.snapshotName' => 'Instantanea {id}',
			'myToolsService.timeMachineGroup' => 'Time Machine',
			'myToolsService.timeMachineMacOnly' => 'Las instantaneas de Time Machine solo estan disponibles en macOS.',
			_ => null,
		};
	}
}
