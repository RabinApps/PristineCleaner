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
class TranslationsEs extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$es app = _Translations$app$es._(_root);
	@override late final _Translations$language$es language = _Translations$language$es._(_root);
	@override late final _Translations$navigation$es navigation = _Translations$navigation$es._(_root);
	@override late final _Translations$settings$es settings = _Translations$settings$es._(_root);
	@override late final _Translations$sections$es sections = _Translations$sections$es._(_root);
	@override late final _Translations$progress$es progress = _Translations$progress$es._(_root);
	@override late final _Translations$errors$es errors = _Translations$errors$es._(_root);
	@override late final _Translations$buttons$es buttons = _Translations$buttons$es._(_root);
	@override late final _Translations$tooltips$es tooltips = _Translations$tooltips$es._(_root);
	@override late final _Translations$dialogs$es dialogs = _Translations$dialogs$es._(_root);
	@override late final _Translations$removal$es removal = _Translations$removal$es._(_root);
	@override late final _Translations$done$es done = _Translations$done$es._(_root);
	@override late final _Translations$donate$es donate = _Translations$donate$es._(_root);
	@override late final _Translations$cleanupManager$es cleanupManager = _Translations$cleanupManager$es._(_root);
	@override late final _Translations$projectDirectory$es projectDirectory = _Translations$projectDirectory$es._(_root);
	@override late final _Translations$searchAndSort$es searchAndSort = _Translations$searchAndSort$es._(_root);
	@override late final _Translations$spaceView$es spaceView = _Translations$spaceView$es._(_root);
	@override late final _Translations$home$es home = _Translations$home$es._(_root);
	@override late final _Translations$myToolsPage$es myToolsPage = _Translations$myToolsPage$es._(_root);
	@override late final _Translations$myToolsMessages$es myToolsMessages = _Translations$myToolsMessages$es._(_root);
	@override late final _Translations$myToolsCatalog$es myToolsCatalog = _Translations$myToolsCatalog$es._(_root);
	@override late final _Translations$cleanupCategories$es cleanupCategories = _Translations$cleanupCategories$es._(_root);
	@override late final _Translations$myClutterDashboard$es myClutterDashboard = _Translations$myClutterDashboard$es._(_root);
	@override late final _Translations$scanResults$es scanResults = _Translations$scanResults$es._(_root);
	@override late final _Translations$spaceViewStart$es spaceViewStart = _Translations$spaceViewStart$es._(_root);
	@override late final _Translations$shell$es shell = _Translations$shell$es._(_root);
	@override late final _Translations$myToolsService$es myToolsService = _Translations$myToolsService$es._(_root);
}

// Path: app
class _Translations$app$es extends Translations$app$en {
	_Translations$app$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'PristineCleaner';
}

// Path: language
class _Translations$language$es extends Translations$language$en {
	_Translations$language$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'Idioma';
	@override String get english => 'Ingles';
	@override String get spanish => 'Espanol';
	@override String get italian => 'Italiano';
	@override String get french => 'Frances';
	@override String get hebrew => 'Hebreo';
	@override String get greek => 'Griego';
	@override String get portuguese => 'Portugues';
	@override String get mandarin => 'Mandarin';
}

// Path: navigation
class _Translations$navigation$es extends Translations$navigation$en {
	_Translations$navigation$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Hogar';
	@override String get cleanup => 'Limpieza';
	@override String get myClutter => 'Mi Desorden';
	@override String get spaceView => 'Vista de Espacio';
	@override String get applications => 'Aplicaciones';
	@override String get myTools => 'Mis Herramientas';
	@override String get donate => 'Donar';
	@override String get settings => 'Ajustes';
}

// Path: settings
class _Translations$settings$es extends Translations$settings$en {
	_Translations$settings$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ajustes';
	@override String get subtitle => 'Ajusta PristineCleaner a tu forma de trabajar.';
	@override String get sectionLanguage => 'Idioma';
	@override String get sectionUpdates => 'Actualizaciones';
	@override String get sectionBehavior => 'Comportamiento';
	@override String get autoCheckUpdates => 'Buscar actualizaciones al iniciar';
	@override String get autoCheckUpdatesSub => 'Busca nuevas versiones automáticamente al abrir la app.';
	@override String get checkForUpdates => 'Buscar actualizaciones';
	@override String get launchAtLogin => 'Abrir al iniciar sesión';
	@override String get launchAtLoginSub => 'Abre PristineCleaner automáticamente al iniciar sesión.';
	@override String get confirmBeforeRemoving => 'Confirmar antes de eliminar';
	@override String get confirmBeforeRemovingSub => 'Muestra un diálogo de confirmación antes de eliminar archivos.';
}

// Path: sections
class _Translations$sections$es extends Translations$sections$en {
	_Translations$sections$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sections$home$es home = _Translations$sections$home$es._(_root);
	@override late final _Translations$sections$cleanup$es cleanup = _Translations$sections$cleanup$es._(_root);
	@override late final _Translations$sections$myClutter$es myClutter = _Translations$sections$myClutter$es._(_root);
	@override late final _Translations$sections$spaceView$es spaceView = _Translations$sections$spaceView$es._(_root);
	@override late final _Translations$sections$applications$es applications = _Translations$sections$applications$es._(_root);
	@override late final _Translations$sections$myTools$es myTools = _Translations$sections$myTools$es._(_root);
}

// Path: progress
class _Translations$progress$es extends Translations$progress$en {
	_Translations$progress$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get countingFiles => 'Contando archivos...';
	@override String get countingApplications => 'Contando aplicaciones...';
	@override String get countingFolders => 'Contando carpetas...';
}

// Path: errors
class _Translations$errors$es extends Translations$errors$en {
	_Translations$errors$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get itemsFailedToRemove => 'No se pudieron eliminar {count} elemento(s).';
}

// Path: buttons
class _Translations$buttons$es extends Translations$buttons$en {
	_Translations$buttons$es._(TranslationsEs root) : this._root = root, super.internal(root);

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
class _Translations$tooltips$es extends Translations$tooltips$en {
	_Translations$tooltips$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get search => 'Buscar';
	@override String get openInFinder => 'Abrir en Finder';
}

// Path: dialogs
class _Translations$dialogs$es extends Translations$dialogs$en {
	_Translations$dialogs$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get stopScanningTitle => 'Detener escaneo?';
	@override String get stopScanningMessage => 'Esto cancelara el escaneo actual y descartara cualquier progreso parcial.';
	@override String get exitConfirmationTitle => 'Confirmar salida';
	@override String get exitConfirmationMessage => 'Se está ejecutando un escaneo. ¿Seguro que quieres salir?';
	@override String get exitConfirmationWait => 'Esperar';
	@override String get exitConfirmationQuit => 'Salir de todos modos';
	@override String get stopRemovalTitle => 'Detener eliminacion?';
	@override String get stopRemovalMessage => 'El archivo actual terminara y luego se omitiran los restantes.';
	@override String get confirmRemovalTitle => '¿Eliminar los elementos seleccionados?';
	@override String get confirmRemovalMessage => '{count} elemento(s) se moverán a la Papelera.';
	@override String get confirmRemovalMessagePermanent => '{count} elemento(s) se eliminarán permanentemente. Esto no se puede deshacer.';
	@override String get confirmRemovalCancel => 'Cancelar';
	@override String get confirmRemovalConfirm => 'Eliminar';
}

// Path: removal
class _Translations$removal$es extends Translations$removal$en {
	_Translations$removal$es._(TranslationsEs root) : this._root = root, super.internal(root);

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
class _Translations$done$es extends Translations$done$en {
	_Translations$done$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get allCleanedTitle => 'Todo limpio!';
	@override String get movedToTrashMessage => 'Los archivos seleccionados se movieron a la papelera.';
	@override String get applicationsRemovedTitle => 'Aplicaciones eliminadas!';
	@override String get appsMovedToTrashMessage => 'Las apps seleccionadas se movieron a la papelera.';
}

// Path: donate
class _Translations$donate$es extends Translations$donate$en {
	_Translations$donate$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Apoya PristineCleaner';
	@override String get subtitle => 'Si PristineCleaner te ayuda a mantener tu sistema limpio, puedes apoyar su desarrollo con una pequena donacion.';
	@override String get buyMeACoffee => 'Buy Me a Coffee';
	@override String get paypalDonate => 'Donar con PayPal';
	@override String get openLinkFailed => 'No se pudo abrir el enlace de donacion.';
}

// Path: cleanupManager
class _Translations$cleanupManager$es extends Translations$cleanupManager$en {
	_Translations$cleanupManager$es._(TranslationsEs root) : this._root = root, super.internal(root);

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
class _Translations$projectDirectory$es extends Translations$projectDirectory$en {
	_Translations$projectDirectory$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get chooseFolder => 'Elegir carpeta...';
	@override String get chooseProjectDirectory => 'Elegir directorio del proyecto';
	@override String get chooseParentFolder => 'Elegir carpeta raiz';
	@override String get noFolder => 'Sin carpeta';
}

// Path: searchAndSort
class _Translations$searchAndSort$es extends Translations$searchAndSort$en {
	_Translations$searchAndSort$es._(TranslationsEs root) : this._root = root, super.internal(root);

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
class _Translations$spaceView$es extends Translations$spaceView$en {
	_Translations$spaceView$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get noFoldersFound => 'No se encontraron carpetas en este nivel';
	@override String get noBubblesToRender => 'No hay burbujas para mostrar';
	@override String get otherItems => 'Otros elementos';
}

// Path: home
class _Translations$home$es extends Translations$home$en {
	_Translations$home$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get refresh => 'Refrescar';
	@override String get unableToReadDiskInfo => 'No se puede leer la información del disco';
	@override String get totalStorage => 'Almacenamiento total';
	@override String get used => 'Usado';
	@override String get available => 'Disponible';
	@override String get percentUsed => '{percent}% usado';
	@override String get cpuUsage => 'Uso de CPU';
	@override String get ramUsage => 'Uso de RAM';
	@override String get memoryPercentUsed => '{percent}% RAM utilizada';
	@override String get unableToReadSystemInfo => 'No se puede leer la información del sistema';
}

// Path: myToolsPage
class _Translations$myToolsPage$es extends Translations$myToolsPage$en {
	_Translations$myToolsPage$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mis Herramientas';
	@override String get subtitle => 'Tus herramientas clave para mantener tu Mac limpia, segura y fluida.';
	@override String get backToTools => 'Volver a herramientas';
}

// Path: myToolsMessages
class _Translations$myToolsMessages$es extends Translations$myToolsMessages$en {
	_Translations$myToolsMessages$es._(TranslationsEs root) : this._root = root, super.internal(root);

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
	@override late final _Translations$myToolsMessages$fallback$es fallback = _Translations$myToolsMessages$fallback$es._(_root);
}

// Path: myToolsCatalog
class _Translations$myToolsCatalog$es extends Translations$myToolsCatalog$en {
	_Translations$myToolsCatalog$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _Translations$myToolsCatalog$appLeftovers$es appLeftovers = _Translations$myToolsCatalog$appLeftovers$es._(_root);
	@override late final _Translations$myToolsCatalog$backgroundItems$es backgroundItems = _Translations$myToolsCatalog$backgroundItems$es._(_root);
	@override late final _Translations$myToolsCatalog$downloads$es downloads = _Translations$myToolsCatalog$downloads$es._(_root);
	@override late final _Translations$myToolsCatalog$largeOld$es largeOld = _Translations$myToolsCatalog$largeOld$es._(_root);
	@override late final _Translations$myToolsCatalog$similarImages$es similarImages = _Translations$myToolsCatalog$similarImages$es._(_root);
	@override late final _Translations$myToolsCatalog$trashBins$es trashBins = _Translations$myToolsCatalog$trashBins$es._(_root);
	@override late final _Translations$myToolsCatalog$duplicateFinder$es duplicateFinder = _Translations$myToolsCatalog$duplicateFinder$es._(_root);
	@override late final _Translations$myToolsCatalog$applicationPermissions$es applicationPermissions = _Translations$myToolsCatalog$applicationPermissions$es._(_root);
	@override late final _Translations$myToolsCatalog$systemJunk$es systemJunk = _Translations$myToolsCatalog$systemJunk$es._(_root);
	@override late final _Translations$myToolsCatalog$timeMachineSnapshot$es timeMachineSnapshot = _Translations$myToolsCatalog$timeMachineSnapshot$es._(_root);
	@override late final _Translations$myToolsCatalog$loginItems$es loginItems = _Translations$myToolsCatalog$loginItems$es._(_root);
	@override late final _Translations$myToolsCatalog$mailAttachments$es mailAttachments = _Translations$myToolsCatalog$mailAttachments$es._(_root);
	@override late final _Translations$myToolsCatalog$malwareFinder$es malwareFinder = _Translations$myToolsCatalog$malwareFinder$es._(_root);
	@override late final _Translations$myToolsCatalog$uninstaller$es uninstaller = _Translations$myToolsCatalog$uninstaller$es._(_root);
}

// Path: cleanupCategories
class _Translations$cleanupCategories$es extends Translations$cleanupCategories$en {
	_Translations$cleanupCategories$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _Translations$cleanupCategories$userCache$es userCache = _Translations$cleanupCategories$userCache$es._(_root);
	@override late final _Translations$cleanupCategories$userLogs$es userLogs = _Translations$cleanupCategories$userLogs$es._(_root);
	@override late final _Translations$cleanupCategories$languageFiles$es languageFiles = _Translations$cleanupCategories$languageFiles$es._(_root);
	@override late final _Translations$cleanupCategories$systemLogs$es systemLogs = _Translations$cleanupCategories$systemLogs$es._(_root);
	@override late final _Translations$cleanupCategories$brokenLoginItems$es brokenLoginItems = _Translations$cleanupCategories$brokenLoginItems$es._(_root);
}

// Path: myClutterDashboard
class _Translations$myClutterDashboard$es extends Translations$myClutterDashboard$en {
	_Translations$myClutterDashboard$es._(TranslationsEs root) : this._root = root, super.internal(root);

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
class _Translations$scanResults$es extends Translations$scanResults$en {
	_Translations$scanResults$es._(TranslationsEs root) : this._root = root, super.internal(root);

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
class _Translations$spaceViewStart$es extends Translations$spaceViewStart$en {
	_Translations$spaceViewStart$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get subtitle => 'Elige una carpeta raiz y escanea para ver que ocupa mas espacio.';
	@override String get defaultRootPath => 'La ruta raiz predeterminada es tu disco principal';
	@override String get exploreBubbles => 'Explora tamano de carpetas con burbujas interactivas';
	@override String get clickToDrillDown => 'Haz clic en carpetas para profundizar e inspeccionar';
}

// Path: shell
class _Translations$shell$es extends Translations$shell$en {
	_Translations$shell$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get comingSoon => 'Proximamente';
}

// Path: myToolsService
class _Translations$myToolsService$es extends Translations$myToolsService$en {
	_Translations$myToolsService$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get snapshotName => 'Instantanea {id}';
	@override String get timeMachineGroup => 'Time Machine';
	@override String get timeMachineMacOnly => 'Las instantaneas de Time Machine solo estan disponibles en macOS.';
}

// Path: sections.home
class _Translations$sections$home$es extends Translations$sections$home$en {
	_Translations$sections$home$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hogar';
	@override String get subtitle => 'Vea los signos vitales de su computadora de un vistazo\ny detecte los problemas antes de que crezcan.';
	@override late final _Translations$sections$home$features$es features = _Translations$sections$home$features$es._(_root);
}

// Path: sections.cleanup
class _Translations$sections$cleanup$es extends Translations$sections$cleanup$en {
	_Translations$sections$cleanup$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Limpieza de Basura';
	@override String get subtitle => 'Elimine los residuos digitales para restaurar\nla velocidad, la estabilidad y el valioso espacio libre.';
	@override late final _Translations$sections$cleanup$features$es features = _Translations$sections$cleanup$features$es._(_root);
}

// Path: sections.myClutter
class _Translations$sections$myClutter$es extends Translations$sections$myClutter$en {
	_Translations$sections$myClutter$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mi Desorden';
	@override String get subtitle => 'Convierta carpetas caóticas en decisiones claras\ncon limpieza guiada en minutos.';
	@override late final _Translations$sections$myClutter$features$es features = _Translations$sections$myClutter$features$es._(_root);
}

// Path: sections.spaceView
class _Translations$sections$spaceView$es extends Translations$sections$spaceView$en {
	_Translations$sections$spaceView$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vista de Espacio';
	@override String get subtitle => 'Asigne su disco visualmente para identificar\nlo que más importa y liberar espacio más rápido.';
	@override late final _Translations$sections$spaceView$features$es features = _Translations$sections$spaceView$features$es._(_root);
}

// Path: sections.applications
class _Translations$sections$applications$es extends Translations$sections$applications$en {
	_Translations$sections$applications$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aplicaciones';
	@override String get subtitle => 'Controle el espacio que ocupa su aplicación.\nDesinstale limpiamente y elimine los restos olvidados.';
	@override late final _Translations$sections$applications$features$es features = _Translations$sections$applications$features$es._(_root);
}

// Path: sections.myTools
class _Translations$sections$myTools$es extends Translations$sections$myTools$en {
	_Translations$sections$myTools$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mis Herramientas';
	@override String get subtitle => 'Su kit principal para el cuidado y mantenimiento del sistema.';
	@override late final _Translations$sections$myTools$features$es features = _Translations$sections$myTools$features$es._(_root);
}

// Path: myToolsMessages.fallback
class _Translations$myToolsMessages$fallback$es extends Translations$myToolsMessages$fallback$en {
	_Translations$myToolsMessages$fallback$es._(TranslationsEs root) : this._root = root, super.internal(root);

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
class _Translations$myToolsCatalog$appLeftovers$es extends Translations$myToolsCatalog$appLeftovers$en {
	_Translations$myToolsCatalog$appLeftovers$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Restos de Apps';
	@override String get description => 'Localiza y elimina restos de apps incluso si la app principal ya no existe.';
}

// Path: myToolsCatalog.backgroundItems
class _Translations$myToolsCatalog$backgroundItems$es extends Translations$myToolsCatalog$backgroundItems$en {
	_Translations$myToolsCatalog$backgroundItems$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Elementos en Segundo Plano';
	@override String get description => 'Gestiona apps y procesos en segundo plano que se ejecutan en tu Mac.';
}

// Path: myToolsCatalog.downloads
class _Translations$myToolsCatalog$downloads$es extends Translations$myToolsCatalog$downloads$en {
	_Translations$myToolsCatalog$downloads$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Descargas';
	@override String get description => 'Revisa y limpia archivos de un solo uso en Descargas para mantener orden.';
}

// Path: myToolsCatalog.largeOld
class _Translations$myToolsCatalog$largeOld$es extends Translations$myToolsCatalog$largeOld$en {
	_Translations$myToolsCatalog$largeOld$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Archivos Grandes y Antiguos';
	@override String get description => 'Encuentra y elimina archivos grandes sin uso que ocupan espacio.';
}

// Path: myToolsCatalog.similarImages
class _Translations$myToolsCatalog$similarImages$es extends Translations$myToolsCatalog$similarImages$en {
	_Translations$myToolsCatalog$similarImages$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Imagenes Similares';
	@override String get description => 'Revisa fotos similares y conserva solo las mejores.';
}

// Path: myToolsCatalog.trashBins
class _Translations$myToolsCatalog$trashBins$es extends Translations$myToolsCatalog$trashBins$en {
	_Translations$myToolsCatalog$trashBins$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Papeleras';
	@override String get description => 'Vacia todas las papeleras disponibles en tu Mac.';
}

// Path: myToolsCatalog.duplicateFinder
class _Translations$myToolsCatalog$duplicateFinder$es extends Translations$myToolsCatalog$duplicateFinder$en {
	_Translations$myToolsCatalog$duplicateFinder$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Buscador de Duplicados';
	@override String get description => 'Elimina archivos duplicados guardados en distintas ubicaciones.';
}

// Path: myToolsCatalog.applicationPermissions
class _Translations$myToolsCatalog$applicationPermissions$es extends Translations$myToolsCatalog$applicationPermissions$en {
	_Translations$myToolsCatalog$applicationPermissions$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Permisos de Aplicaciones';
	@override String get description => 'Gestiona como las apps acceden a funciones y dispositivos del sistema.';
}

// Path: myToolsCatalog.systemJunk
class _Translations$myToolsCatalog$systemJunk$es extends Translations$myToolsCatalog$systemJunk$en {
	_Translations$myToolsCatalog$systemJunk$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Basura del Sistema';
	@override String get description => 'Elimina archivos redundantes que saturan almacenamiento y rendimiento.';
}

// Path: myToolsCatalog.timeMachineSnapshot
class _Translations$myToolsCatalog$timeMachineSnapshot$es extends Translations$myToolsCatalog$timeMachineSnapshot$en {
	_Translations$myToolsCatalog$timeMachineSnapshot$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Instantanea de Time Machine';
	@override String get description => 'Elimina instantaneas locales de Time Machine sin afectar respaldos.';
}

// Path: myToolsCatalog.loginItems
class _Translations$myToolsCatalog$loginItems$es extends Translations$myToolsCatalog$loginItems$en {
	_Translations$myToolsCatalog$loginItems$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Elementos de Inicio';
	@override String get description => 'Gestiona apps que se abren automaticamente al iniciar tu Mac.';
}

// Path: myToolsCatalog.mailAttachments
class _Translations$myToolsCatalog$mailAttachments$es extends Translations$myToolsCatalog$mailAttachments$en {
	_Translations$myToolsCatalog$mailAttachments$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Adjuntos de Correo';
	@override String get description => 'Elimina adjuntos locales para liberar espacio conservando archivos modificados.';
}

// Path: myToolsCatalog.malwareFinder
class _Translations$myToolsCatalog$malwareFinder$es extends Translations$myToolsCatalog$malwareFinder$en {
	_Translations$myToolsCatalog$malwareFinder$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detector de Malware';
	@override String get description => 'Identifica y elimina elementos maliciosos para mantener segura tu Mac.';
}

// Path: myToolsCatalog.uninstaller
class _Translations$myToolsCatalog$uninstaller$es extends Translations$myToolsCatalog$uninstaller$en {
	_Translations$myToolsCatalog$uninstaller$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Desinstalador';
	@override String get description => 'Elimina aplicaciones completas junto con archivos relacionados.';
}

// Path: cleanupCategories.userCache
class _Translations$cleanupCategories$userCache$es extends Translations$cleanupCategories$userCache$en {
	_Translations$cleanupCategories$userCache$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get name => 'Archivos de Cache de Usuario';
	@override String get description => 'Los archivos de cache ayudan al inicio, pero se acumulan y pueden causar fallos o baja de rendimiento.';
}

// Path: cleanupCategories.userLogs
class _Translations$cleanupCategories$userLogs$es extends Translations$cleanupCategories$userLogs$en {
	_Translations$cleanupCategories$userLogs$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get name => 'Archivos de Registro de Usuario';
	@override String get description => 'Los registros creados por macOS y apps pueden crecer y ocupar mucho espacio con el tiempo.';
}

// Path: cleanupCategories.languageFiles
class _Translations$cleanupCategories$languageFiles$es extends Translations$cleanupCategories$languageFiles$en {
	_Translations$cleanupCategories$languageFiles$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get name => 'Archivos de Idioma';
	@override String get description => 'Recursos de idioma no usados incluidos en apps. Eliminarlos libera espacio sin afectar funciones.';
}

// Path: cleanupCategories.systemLogs
class _Translations$cleanupCategories$systemLogs$es extends Translations$cleanupCategories$systemLogs$en {
	_Translations$cleanupCategories$systemLogs$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get name => 'Archivos de Registro del Sistema';
	@override String get description => 'Registros del sistema creados por servicios de macOS. Son seguros de eliminar porque se recrean cuando hace falta.';
}

// Path: cleanupCategories.brokenLoginItems
class _Translations$cleanupCategories$brokenLoginItems$es extends Translations$cleanupCategories$brokenLoginItems$en {
	_Translations$cleanupCategories$brokenLoginItems$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get name => 'Elementos de Inicio Rotos';
	@override String get description => 'Elementos que apuntan a apps o archivos inexistentes. Eliminarlos mejora el tiempo de inicio.';
}

// Path: sections.home.features
class _Translations$sections$home$features$es extends Translations$sections$home$features$en {
	_Translations$sections$home$features$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get systemStatus => 'Pulso del sistema en vivo';
	@override String get storageUsage => 'Presión de almacenamiento';
	@override String get quickActions => 'Correcciones con un solo toque';
}

// Path: sections.cleanup.features
class _Translations$sections$cleanup$features$es extends Translations$sections$cleanup$features$en {
	_Translations$sections$cleanup$features$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get systemJunk => 'Basura del sistema residual';
	@override String get userCache => 'Caché de usuario inflada';
	@override String get tempFiles => 'Archivos temporales obsoletos';
}

// Path: sections.myClutter.features
class _Translations$sections$myClutter$features$es extends Translations$sections$myClutter$features$en {
	_Translations$sections$myClutter$features$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get largeFiles => 'Archivos que consumen mucho espacio';
	@override String get duplicates => 'Clústeres duplicados';
	@override String get largeSimilarImages => 'Conjuntos de fotografías casi coincidentes';
}

// Path: sections.spaceView.features
class _Translations$sections$spaceView$features$es extends Translations$sections$spaceView$features$en {
	_Translations$sections$spaceView$features$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get visualStorageMap => 'Mapa de almacenamiento interactivo';
	@override String get largeFoldersOverview => 'Zonas activas de carpetas pesadas';
	@override String get hiddenFilesUncovered => 'Escurridores de espacio oculto';
}

// Path: sections.applications.features
class _Translations$sections$applications$features$es extends Translations$sections$applications$features$en {
	_Translations$sections$applications$features$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get appUninstaller => 'Desinstalador profundo de aplicaciones';
	@override String get largeApps => 'Aplicaciones pesadas';
	@override String get fileLeftovers => 'Archivos de soporte huérfanos';
}

// Path: sections.myTools.features
class _Translations$sections$myTools$features$es extends Translations$sections$myTools$features$en {
	_Translations$sections$myTools$features$es._(TranslationsEs root) : this._root = root, super.internal(root);

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
			'language.french' => 'Frances',
			'language.hebrew' => 'Hebreo',
			'language.greek' => 'Griego',
			'language.portuguese' => 'Portugues',
			'language.mandarin' => 'Mandarin',
			'navigation.home' => 'Hogar',
			'navigation.cleanup' => 'Limpieza',
			'navigation.myClutter' => 'Mi Desorden',
			'navigation.spaceView' => 'Vista de Espacio',
			'navigation.applications' => 'Aplicaciones',
			'navigation.myTools' => 'Mis Herramientas',
			'navigation.donate' => 'Donar',
			'navigation.settings' => 'Ajustes',
			'settings.title' => 'Ajustes',
			'settings.subtitle' => 'Ajusta PristineCleaner a tu forma de trabajar.',
			'settings.sectionLanguage' => 'Idioma',
			'settings.sectionUpdates' => 'Actualizaciones',
			'settings.sectionBehavior' => 'Comportamiento',
			'settings.autoCheckUpdates' => 'Buscar actualizaciones al iniciar',
			'settings.autoCheckUpdatesSub' => 'Busca nuevas versiones automáticamente al abrir la app.',
			'settings.checkForUpdates' => 'Buscar actualizaciones',
			'settings.launchAtLogin' => 'Abrir al iniciar sesión',
			'settings.launchAtLoginSub' => 'Abre PristineCleaner automáticamente al iniciar sesión.',
			'settings.confirmBeforeRemoving' => 'Confirmar antes de eliminar',
			'settings.confirmBeforeRemovingSub' => 'Muestra un diálogo de confirmación antes de eliminar archivos.',
			'sections.home.title' => 'Hogar',
			'sections.home.subtitle' => 'Vea los signos vitales de su computadora de un vistazo\ny detecte los problemas antes de que crezcan.',
			'sections.home.features.systemStatus' => 'Pulso del sistema en vivo',
			'sections.home.features.storageUsage' => 'Presión de almacenamiento',
			'sections.home.features.quickActions' => 'Correcciones con un solo toque',
			'sections.cleanup.title' => 'Limpieza de Basura',
			'sections.cleanup.subtitle' => 'Elimine los residuos digitales para restaurar\nla velocidad, la estabilidad y el valioso espacio libre.',
			'sections.cleanup.features.systemJunk' => 'Basura del sistema residual',
			'sections.cleanup.features.userCache' => 'Caché de usuario inflada',
			'sections.cleanup.features.tempFiles' => 'Archivos temporales obsoletos',
			'sections.myClutter.title' => 'Mi Desorden',
			'sections.myClutter.subtitle' => 'Convierta carpetas caóticas en decisiones claras\ncon limpieza guiada en minutos.',
			'sections.myClutter.features.largeFiles' => 'Archivos que consumen mucho espacio',
			'sections.myClutter.features.duplicates' => 'Clústeres duplicados',
			'sections.myClutter.features.largeSimilarImages' => 'Conjuntos de fotografías casi coincidentes',
			'sections.spaceView.title' => 'Vista de Espacio',
			'sections.spaceView.subtitle' => 'Asigne su disco visualmente para identificar\nlo que más importa y liberar espacio más rápido.',
			'sections.spaceView.features.visualStorageMap' => 'Mapa de almacenamiento interactivo',
			'sections.spaceView.features.largeFoldersOverview' => 'Zonas activas de carpetas pesadas',
			'sections.spaceView.features.hiddenFilesUncovered' => 'Escurridores de espacio oculto',
			'sections.applications.title' => 'Aplicaciones',
			'sections.applications.subtitle' => 'Controle el espacio que ocupa su aplicación.\nDesinstale limpiamente y elimine los restos olvidados.',
			'sections.applications.features.appUninstaller' => 'Desinstalador profundo de aplicaciones',
			'sections.applications.features.largeApps' => 'Aplicaciones pesadas',
			'sections.applications.features.fileLeftovers' => 'Archivos de soporte huérfanos',
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
			'dialogs.exitConfirmationTitle' => 'Confirmar salida',
			'dialogs.exitConfirmationMessage' => 'Se está ejecutando un escaneo. ¿Seguro que quieres salir?',
			'dialogs.exitConfirmationWait' => 'Esperar',
			'dialogs.exitConfirmationQuit' => 'Salir de todos modos',
			'dialogs.stopRemovalTitle' => 'Detener eliminacion?',
			'dialogs.stopRemovalMessage' => 'El archivo actual terminara y luego se omitiran los restantes.',
			'dialogs.confirmRemovalTitle' => '¿Eliminar los elementos seleccionados?',
			'dialogs.confirmRemovalMessage' => '{count} elemento(s) se moverán a la Papelera.',
			'dialogs.confirmRemovalMessagePermanent' => '{count} elemento(s) se eliminarán permanentemente. Esto no se puede deshacer.',
			'dialogs.confirmRemovalCancel' => 'Cancelar',
			'dialogs.confirmRemovalConfirm' => 'Eliminar',
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
			'donate.title' => 'Apoya PristineCleaner',
			'donate.subtitle' => 'Si PristineCleaner te ayuda a mantener tu sistema limpio, puedes apoyar su desarrollo con una pequena donacion.',
			'donate.buyMeACoffee' => 'Buy Me a Coffee',
			'donate.paypalDonate' => 'Donar con PayPal',
			'donate.openLinkFailed' => 'No se pudo abrir el enlace de donacion.',
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
			'home.refresh' => 'Refrescar',
			'home.unableToReadDiskInfo' => 'No se puede leer la información del disco',
			'home.totalStorage' => 'Almacenamiento total',
			'home.used' => 'Usado',
			'home.available' => 'Disponible',
			'home.percentUsed' => '{percent}% usado',
			'home.cpuUsage' => 'Uso de CPU',
			'home.ramUsage' => 'Uso de RAM',
			'home.memoryPercentUsed' => '{percent}% RAM utilizada',
			'home.unableToReadSystemInfo' => 'No se puede leer la información del sistema',
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
			'myToolsCatalog.similarImages.title' => 'Imagenes Similares',
			'myToolsCatalog.similarImages.description' => 'Revisa fotos similares y conserva solo las mejores.',
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
