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
class TranslationsPt with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.pt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsPt _root = this; // ignore: unused_field

	@override 
	TranslationsPt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPt(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppPt app = _TranslationsAppPt._(_root);
	@override late final _TranslationsLanguagePt language = _TranslationsLanguagePt._(_root);
	@override late final _TranslationsNavigationPt navigation = _TranslationsNavigationPt._(_root);
	@override late final _TranslationsSectionsPt sections = _TranslationsSectionsPt._(_root);
	@override late final _TranslationsProgressPt progress = _TranslationsProgressPt._(_root);
	@override late final _TranslationsErrorsPt errors = _TranslationsErrorsPt._(_root);
	@override late final _TranslationsButtonsPt buttons = _TranslationsButtonsPt._(_root);
	@override late final _TranslationsTooltipsPt tooltips = _TranslationsTooltipsPt._(_root);
	@override late final _TranslationsDialogsPt dialogs = _TranslationsDialogsPt._(_root);
	@override late final _TranslationsRemovalPt removal = _TranslationsRemovalPt._(_root);
	@override late final _TranslationsDonePt done = _TranslationsDonePt._(_root);
	@override late final _TranslationsDonatePt donate = _TranslationsDonatePt._(_root);
	@override late final _TranslationsCleanupManagerPt cleanupManager = _TranslationsCleanupManagerPt._(_root);
	@override late final _TranslationsProjectDirectoryPt projectDirectory = _TranslationsProjectDirectoryPt._(_root);
	@override late final _TranslationsSearchAndSortPt searchAndSort = _TranslationsSearchAndSortPt._(_root);
	@override late final _TranslationsSpaceViewPt spaceView = _TranslationsSpaceViewPt._(_root);
	@override late final _TranslationsHomePt home = _TranslationsHomePt._(_root);
	@override late final _TranslationsMyToolsPagePt myToolsPage = _TranslationsMyToolsPagePt._(_root);
	@override late final _TranslationsMyToolsMessagesPt myToolsMessages = _TranslationsMyToolsMessagesPt._(_root);
	@override late final _TranslationsMyToolsCatalogPt myToolsCatalog = _TranslationsMyToolsCatalogPt._(_root);
	@override late final _TranslationsCleanupCategoriesPt cleanupCategories = _TranslationsCleanupCategoriesPt._(_root);
	@override late final _TranslationsMyClutterDashboardPt myClutterDashboard = _TranslationsMyClutterDashboardPt._(_root);
	@override late final _TranslationsScanResultsPt scanResults = _TranslationsScanResultsPt._(_root);
	@override late final _TranslationsSpaceViewStartPt spaceViewStart = _TranslationsSpaceViewStartPt._(_root);
	@override late final _TranslationsShellPt shell = _TranslationsShellPt._(_root);
	@override late final _TranslationsMyToolsServicePt myToolsService = _TranslationsMyToolsServicePt._(_root);
}

// Path: app
class _TranslationsAppPt implements TranslationsAppEn {
	_TranslationsAppPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'PristineCleaner';
}

// Path: language
class _TranslationsLanguagePt implements TranslationsLanguageEn {
	_TranslationsLanguagePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get label => 'Linguagem';
	@override String get english => 'Inglês';
	@override String get spanish => 'Espanhol';
	@override String get italian => 'italiano';
	@override String get french => 'Francês';
	@override String get hebrew => 'hebraico';
	@override String get greek => 'grego';
	@override String get portuguese => 'Português';
	@override String get mandarin => 'Mandarim';
}

// Path: navigation
class _TranslationsNavigationPt implements TranslationsNavigationEn {
	_TranslationsNavigationPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Lar';
	@override String get cleanup => 'Limpar';
	@override String get myClutter => 'Minha desordem';
	@override String get spaceView => 'Visualização do espaço';
	@override String get applications => 'Aplicações';
	@override String get myTools => 'Minhas ferramentas';
	@override String get myActivity => 'Minha atividade';
	@override String get donate => 'Doar';
}

// Path: sections
class _TranslationsSectionsPt implements TranslationsSectionsEn {
	_TranslationsSectionsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSectionsHomePt home = _TranslationsSectionsHomePt._(_root);
	@override late final _TranslationsSectionsCleanupPt cleanup = _TranslationsSectionsCleanupPt._(_root);
	@override late final _TranslationsSectionsMyClutterPt myClutter = _TranslationsSectionsMyClutterPt._(_root);
	@override late final _TranslationsSectionsSpaceViewPt spaceView = _TranslationsSectionsSpaceViewPt._(_root);
	@override late final _TranslationsSectionsApplicationsPt applications = _TranslationsSectionsApplicationsPt._(_root);
	@override late final _TranslationsSectionsMyToolsPt myTools = _TranslationsSectionsMyToolsPt._(_root);
}

// Path: progress
class _TranslationsProgressPt implements TranslationsProgressEn {
	_TranslationsProgressPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get countingFiles => 'Contando arquivos...';
	@override String get countingApplications => 'Contando aplicações...';
	@override String get countingFolders => 'Contando pastas...';
}

// Path: errors
class _TranslationsErrorsPt implements TranslationsErrorsEn {
	_TranslationsErrorsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get itemsFailedToRemove => '{count} itens não foram removidos.';
}

// Path: buttons
class _TranslationsButtonsPt implements TranslationsButtonsEn {
	_TranslationsButtonsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get scan => 'Digitalizar';
	@override String get stop => 'Parar';
	@override String get done => 'Feito';
	@override String get clean => 'Limpar';
	@override String get cleanUp => 'Limpar';
	@override String get close => 'Fechar';
	@override String get refresh => 'Atualizar';
	@override String get rescan => 'Digitalizar novamente';
	@override String get startOver => 'Recomeçar';
	@override String get selectAll => 'Selecionar tudo';
	@override String get clearSelection => 'Limpar seleção';
	@override String get keepScanning => 'Continue digitalizando';
	@override String get keepRemoving => 'Continue removendo';
}

// Path: tooltips
class _TranslationsTooltipsPt implements TranslationsTooltipsEn {
	_TranslationsTooltipsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get search => 'Procurar';
	@override String get openInFinder => 'Abrir no Finder';
}

// Path: dialogs
class _TranslationsDialogsPt implements TranslationsDialogsEn {
	_TranslationsDialogsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get stopScanningTitle => 'Parar de digitalizar?';
	@override String get stopScanningMessage => 'Isto cancelará a verificação atual e descartará qualquer progresso parcial.';
	@override String get stopRemovalTitle => 'Interromper a remoção?';
	@override String get stopRemovalMessage => 'O arquivo atual será concluído e os arquivos restantes serão ignorados.';
}

// Path: removal
class _TranslationsRemovalPt implements TranslationsRemovalEn {
	_TranslationsRemovalPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get barrierLabel => 'Progresso da remoção';
	@override String get preparing => 'Preparando...';
	@override String get removingFrom => 'Removendo de {title}';
	@override String get stoppingAfterCurrentFile => 'Parando após o arquivo atual...';
	@override String get keepWindowOpen => 'Por favor, mantenha esta janela aberta enquanto a remoção é executada.';
	@override String get processedSummary => '{processed} de {total} processado';
	@override String get deletedFreed => '{deleted} excluído • {bytes} liberado';
	@override String get currentItem => 'Atual: {name}';
	@override String get stopping => 'Parando...';
	@override String get removalFailed => 'Falha na remoção';
	@override String get removalFailedDetails => 'Algo deu errado ao remover os arquivos selecionados.';
	@override String get removalStopped => 'Remoção interrompida';
	@override String get removalComplete => 'Remoção concluída';
	@override String get deletedSummary => '{title} item(s) {count} excluído(s)';
	@override String get freedSummary => '{bytes} liberado';
	@override String get failedToRemoveSummary => '{count} itens não foram removidos.';
	@override String get deletedFiles => 'Arquivos excluídos';
	@override String get noFilesDeleted => 'Nenhum arquivo foi excluído.';
}

// Path: done
class _TranslationsDonePt implements TranslationsDoneEn {
	_TranslationsDonePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get allCleanedTitle => 'Tudo limpo!';
	@override String get movedToTrashMessage => 'Os arquivos selecionados foram movidos para a Lixeira.';
	@override String get applicationsRemovedTitle => 'Aplicativos removidos!';
	@override String get appsMovedToTrashMessage => 'Os aplicativos selecionados foram movidos para a Lixeira.';
}

// Path: donate
class _TranslationsDonatePt implements TranslationsDonateEn {
	_TranslationsDonatePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Apoie o PristineCleaner';
	@override String get subtitle => 'Se o PristineCleaner ajuda voce a manter seu sistema limpo, voce pode apoiar o desenvolvimento com uma pequena doacao.';
	@override String get buyMeACoffee => 'Buy Me a Coffee';
	@override String get paypalDonate => 'Doar com PayPal';
	@override String get openLinkFailed => 'Nao foi possivel abrir o link de doacao.';
}

// Path: cleanupManager
class _TranslationsCleanupManagerPt implements TranslationsCleanupManagerEn {
	_TranslationsCleanupManagerPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gerenciador de limpeza';
	@override String get systemJunkHeader => 'Lixo do sistema';
	@override String get systemJunkDescription => 'Arquivos redundantes que obstruem o armazenamento do dispositivo e impedem o desempenho ideal.';
	@override String get selectLabel => 'Selecione';
	@override String get selectAllOption => 'Todos';
	@override String get selectNoneOption => 'Nenhum';
	@override String get noItems => 'Nenhum item';
	@override String get noItemsFound => 'Nenhum item encontrado';
	@override String get itemsSelected => '{count} itens selecionados';
}

// Path: projectDirectory
class _TranslationsProjectDirectoryPt implements TranslationsProjectDirectoryEn {
	_TranslationsProjectDirectoryPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get chooseFolder => 'Escolha a pasta...';
	@override String get chooseProjectDirectory => 'Escolha o diretório do projeto';
	@override String get chooseParentFolder => 'Escolha a pasta pai';
	@override String get noFolder => 'No folder';
}

// Path: searchAndSort
class _TranslationsSearchAndSortPt implements TranslationsSearchAndSortEn {
	_TranslationsSearchAndSortPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get searchHint => 'Procurar...';
	@override String get sortBy => 'Ordenar por';
	@override String get size => 'Tamanho';
	@override String get name => 'Nome';
	@override String get ascending => 'Ascendente';
	@override String get descending => 'Descendente';
}

// Path: spaceView
class _TranslationsSpaceViewPt implements TranslationsSpaceViewEn {
	_TranslationsSpaceViewPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get noFoldersFound => 'Nenhuma pasta encontrada para este nível';
	@override String get noBubblesToRender => 'Sem bolhas para renderizar';
	@override String get otherItems => 'Outros itens';
}

// Path: home
class _TranslationsHomePt implements TranslationsHomeEn {
	_TranslationsHomePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get refresh => 'Atualizar';
	@override String get unableToReadDiskInfo => 'Não é possível ler as informações do disco';
	@override String get totalStorage => 'Armazenamento total';
	@override String get used => 'Usado';
	@override String get available => 'Disponível';
	@override String get percentUsed => '{percent}% usado';
	@override String get cpuUsage => 'Uso da CPU';
	@override String get ramUsage => 'Uso de RAM';
	@override String get memoryPercentUsed => '{percent}% RAM usada';
	@override String get unableToReadSystemInfo => 'Não é possível ler as informações do sistema';
}

// Path: myToolsPage
class _TranslationsMyToolsPagePt implements TranslationsMyToolsPageEn {
	_TranslationsMyToolsPagePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Minhas ferramentas';
	@override String get subtitle => 'Suas ferramentas essenciais para manter seu Mac limpo, seguro e funcionando perfeitamente.';
	@override String get backToTools => 'Voltar para ferramentas';
}

// Path: myToolsMessages
class _TranslationsMyToolsMessagesPt implements TranslationsMyToolsMessagesEn {
	_TranslationsMyToolsMessagesPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get itemsWithSize => '{count} item(s) • {size}';
	@override String get scanCancelled => 'a verificação foi cancelada.';
	@override String get selectAtLeastOne => 'Selecione pelo menos um item para limpar.';
	@override String get failedToClean => 'Falha ao limpar item(s) {count}.';
	@override String get everythingSelectedCleaned => 'Tudo selecionado foi limpo.';
	@override String get cleanupUpdated => 'Limpeza atualizada.';
	@override String get cleanedCount => 'Itens {count} limpos.';
	@override String get stoppedPrefix => 'Parou.';
	@override String get removedCount => 'Itens {count} removidos.';
	@override String get failedCountShort => '{count} falhou.';
	@override String get scanComplete => 'Digitalização concluída.';
	@override String get somethingWentWrong => 'Algo deu errado.';
	@override late final _TranslationsMyToolsMessagesFallbackPt fallback = _TranslationsMyToolsMessagesFallbackPt._(_root);
}

// Path: myToolsCatalog
class _TranslationsMyToolsCatalogPt implements TranslationsMyToolsCatalogEn {
	_TranslationsMyToolsCatalogPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMyToolsCatalogAppLeftoversPt appLeftovers = _TranslationsMyToolsCatalogAppLeftoversPt._(_root);
	@override late final _TranslationsMyToolsCatalogBackgroundItemsPt backgroundItems = _TranslationsMyToolsCatalogBackgroundItemsPt._(_root);
	@override late final _TranslationsMyToolsCatalogDownloadsPt downloads = _TranslationsMyToolsCatalogDownloadsPt._(_root);
	@override late final _TranslationsMyToolsCatalogLargeOldPt largeOld = _TranslationsMyToolsCatalogLargeOldPt._(_root);
	@override late final _TranslationsMyToolsCatalogSimilarImagesPt similarImages = _TranslationsMyToolsCatalogSimilarImagesPt._(_root);
	@override late final _TranslationsMyToolsCatalogTrashBinsPt trashBins = _TranslationsMyToolsCatalogTrashBinsPt._(_root);
	@override late final _TranslationsMyToolsCatalogDuplicateFinderPt duplicateFinder = _TranslationsMyToolsCatalogDuplicateFinderPt._(_root);
	@override late final _TranslationsMyToolsCatalogApplicationPermissionsPt applicationPermissions = _TranslationsMyToolsCatalogApplicationPermissionsPt._(_root);
	@override late final _TranslationsMyToolsCatalogSystemJunkPt systemJunk = _TranslationsMyToolsCatalogSystemJunkPt._(_root);
	@override late final _TranslationsMyToolsCatalogTimeMachineSnapshotPt timeMachineSnapshot = _TranslationsMyToolsCatalogTimeMachineSnapshotPt._(_root);
	@override late final _TranslationsMyToolsCatalogLoginItemsPt loginItems = _TranslationsMyToolsCatalogLoginItemsPt._(_root);
	@override late final _TranslationsMyToolsCatalogMailAttachmentsPt mailAttachments = _TranslationsMyToolsCatalogMailAttachmentsPt._(_root);
	@override late final _TranslationsMyToolsCatalogMalwareFinderPt malwareFinder = _TranslationsMyToolsCatalogMalwareFinderPt._(_root);
	@override late final _TranslationsMyToolsCatalogUninstallerPt uninstaller = _TranslationsMyToolsCatalogUninstallerPt._(_root);
}

// Path: cleanupCategories
class _TranslationsCleanupCategoriesPt implements TranslationsCleanupCategoriesEn {
	_TranslationsCleanupCategoriesPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsCleanupCategoriesUserCachePt userCache = _TranslationsCleanupCategoriesUserCachePt._(_root);
	@override late final _TranslationsCleanupCategoriesUserLogsPt userLogs = _TranslationsCleanupCategoriesUserLogsPt._(_root);
	@override late final _TranslationsCleanupCategoriesLanguageFilesPt languageFiles = _TranslationsCleanupCategoriesLanguageFilesPt._(_root);
	@override late final _TranslationsCleanupCategoriesSystemLogsPt systemLogs = _TranslationsCleanupCategoriesSystemLogsPt._(_root);
	@override late final _TranslationsCleanupCategoriesBrokenLoginItemsPt brokenLoginItems = _TranslationsCleanupCategoriesBrokenLoginItemsPt._(_root);
}

// Path: myClutterDashboard
class _TranslationsMyClutterDashboardPt implements TranslationsMyClutterDashboardEn {
	_TranslationsMyClutterDashboardPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get backToCategories => 'Voltar às categorias';
	@override String get filesToSort => 'Você tem {count} arquivos para classificar.';
	@override String get quickRecommendations => 'Use recomendações rápidas ou revise-as manualmente.';
	@override String get reviewAllFiles => 'Revise todos os arquivos';
	@override String get freshDuplicatesFound => '{count} Novas duplicatas encontradas';
	@override String get noDuplicates => 'Nenhuma duplicata encontrada nesta verificação.';
	@override String get removeDuplicateBytes => 'Remova {bytes} de arquivos duplicados.';
	@override String get largeSimilarImagesFound => '{count} Grandes imagens semelhantes encontradas';
	@override String get noSimilarGroups => 'Nenhum grupo de imagens semelhantes encontrado.';
	@override String get nearlyIdenticalImages => 'Existem {bytes} de imagens quase idênticas.';
	@override String get largeFilesFound => '{bytes} de arquivos grandes encontrados';
	@override String get noLargeFiles => 'Nenhum arquivo grande encontrado.';
	@override String get largeFilesReady => '{count} arquivos grandes estão prontos para revisão.';
	@override String get review => 'Análise';
}

// Path: scanResults
class _TranslationsScanResultsPt implements TranslationsScanResultsEn {
	_TranslationsScanResultsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get itemsSummary => '{count} itens • {size}';
	@override String get scannedInMs => 'Digitalizado em {ms}ms';
	@override String get deselectAll => 'Desmarcar tudo';
	@override String get selectAll => 'Selecionar tudo';
	@override String get noItemsMatchSearch => 'Nenhum item corresponde à sua pesquisa';
	@override String get noItemsFound => 'Nenhum item encontrado';
	@override String get itemsSelected => '{count} itens selecionados';
	@override String get rescan => 'Digitalizar novamente';
}

// Path: spaceViewStart
class _TranslationsSpaceViewStartPt implements TranslationsSpaceViewStartEn {
	_TranslationsSpaceViewStartPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get subtitle => 'Escolha uma pasta pai e digitalize para mapear o que está ocupando mais espaço.';
	@override String get defaultRootPath => 'O caminho raiz padrão é o seu disco rígido principal';
	@override String get exploreBubbles => 'Explore tamanhos de pastas por meio de bolhas interativas';
	@override String get clickToDrillDown => 'Clique nas pastas para detalhar e inspecionar mais profundamente';
}

// Path: shell
class _TranslationsShellPt implements TranslationsShellEn {
	_TranslationsShellPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get comingSoon => 'Em breve';
}

// Path: myToolsService
class _TranslationsMyToolsServicePt implements TranslationsMyToolsServiceEn {
	_TranslationsMyToolsServicePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get snapshotName => 'Instantâneo {id}';
	@override String get timeMachineGroup => 'Máquina do Tempo';
	@override String get timeMachineMacOnly => 'Os instantâneos do Time Machine estão disponíveis apenas no macOS.';
}

// Path: sections.home
class _TranslationsSectionsHomePt implements TranslationsSectionsHomeEn {
	_TranslationsSectionsHomePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lar';
	@override String get subtitle => 'Obtenha uma visão geral completa da integridade\no seu sistema com um clique.';
	@override late final _TranslationsSectionsHomeFeaturesPt features = _TranslationsSectionsHomeFeaturesPt._(_root);
}

// Path: sections.cleanup
class _TranslationsSectionsCleanupPt implements TranslationsSectionsCleanupEn {
	_TranslationsSectionsCleanupPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Limpeza de lixo';
	@override String get subtitle => 'Limpe seu sistema para alcançar o desempenho\nmáximo e recuperar mais espaço livre.';
	@override late final _TranslationsSectionsCleanupFeaturesPt features = _TranslationsSectionsCleanupFeaturesPt._(_root);
}

// Path: sections.myClutter
class _TranslationsSectionsMyClutterPt implements TranslationsSectionsMyClutterEn {
	_TranslationsSectionsMyClutterPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Minha desordem';
	@override String get subtitle => 'Classifique seus arquivos e reduza\na bagunça com apenas alguns cliques.';
	@override late final _TranslationsSectionsMyClutterFeaturesPt features = _TranslationsSectionsMyClutterFeaturesPt._(_root);
}

// Path: sections.spaceView
class _TranslationsSectionsSpaceViewPt implements TranslationsSectionsSpaceViewEn {
	_TranslationsSectionsSpaceViewPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Visualização do espaço';
	@override String get subtitle => 'Visualize o que está ocupando mais\nde espaço em disco e limpe rapidamente.';
	@override late final _TranslationsSectionsSpaceViewFeaturesPt features = _TranslationsSectionsSpaceViewFeaturesPt._(_root);
}

// Path: sections.applications
class _TranslationsSectionsApplicationsPt implements TranslationsSectionsApplicationsEn {
	_TranslationsSectionsApplicationsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aplicações';
	@override String get subtitle => 'Assuma o controle de seus aplicativos.\nDesinstale ou remova sobras antigas.';
	@override late final _TranslationsSectionsApplicationsFeaturesPt features = _TranslationsSectionsApplicationsFeaturesPt._(_root);
}

// Path: sections.myTools
class _TranslationsSectionsMyToolsPt implements TranslationsSectionsMyToolsEn {
	_TranslationsSectionsMyToolsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Minhas ferramentas';
	@override String get subtitle => 'Seu kit de ferramentas ideal para cuidados e manutenção do sistema.';
	@override late final _TranslationsSectionsMyToolsFeaturesPt features = _TranslationsSectionsMyToolsFeaturesPt._(_root);
}

// Path: myToolsMessages.fallback
class _TranslationsMyToolsMessagesFallbackPt implements TranslationsMyToolsMessagesFallbackEn {
	_TranslationsMyToolsMessagesFallbackPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get downloadsTidy => 'Os downloads são organizados.';
	@override String get noOversizedStale => 'Nenhum arquivo obsoleto superdimensionado foi encontrado.';
	@override String get noRecentDuplicates => 'Nenhuma duplicata recente encontrada.';
	@override String get noSimilarLargeImages => 'Nenhuma imagem grande semelhante encontrada.';
	@override String get noAppLeftovers => 'Não foram encontradas sobras de aplicativos removíveis.';
	@override String get noStaleApps => 'Nenhum aplicativo obsoleto foi encontrado.';
	@override String get appsNeedReview => 'Foram encontrados aplicativos que podem precisar de revisão.';
	@override String get noSystemJunkCandidates => 'Não há candidatos para limpeza no lixo do sistema.';
	@override String get noBrokenStartup => 'Nenhuma entrada quebrada de inicialização/segundo plano foi encontrada.';
	@override String get noBackgroundItems => 'Nenhum item de plano de fundo foi encontrado.';
	@override String get noPrivacyTraces => 'Nenhum vestígio de privacidade encontrado em locais conhecidos.';
	@override String get trashAlreadyEmpty => 'A lixeira já está vazia.';
	@override String get noPermissionCache => 'Nenhum arquivo de cache de permissão foi encontrado.';
	@override String get noTimeMachineSnapshots => 'Nenhum snapshot local do Time Machine foi encontrado.';
	@override String get noMaintenanceCandidates => 'Nenhum candidato à manutenção foi encontrado.';
	@override String get noMailAttachments => 'Nenhum anexo de e-mail removível foi encontrado.';
	@override String get noSuspiciousFiles => 'Nenhum arquivo suspeito foi detectado.';
}

// Path: myToolsCatalog.appLeftovers
class _TranslationsMyToolsCatalogAppLeftoversPt implements TranslationsMyToolsCatalogAppLeftoversEn {
	_TranslationsMyToolsCatalogAppLeftoversPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sobras de aplicativos';
	@override String get description => 'Localize e remova sobras de aplicativos, mesmo que o aplicativo principal já tenha desaparecido.';
}

// Path: myToolsCatalog.backgroundItems
class _TranslationsMyToolsCatalogBackgroundItemsPt implements TranslationsMyToolsCatalogBackgroundItemsEn {
	_TranslationsMyToolsCatalogBackgroundItemsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Itens de plano de fundo';
	@override String get description => 'Gerencie aplicativos e processos em segundo plano em execução no seu Mac.';
}

// Path: myToolsCatalog.downloads
class _TranslationsMyToolsCatalogDownloadsPt implements TranslationsMyToolsCatalogDownloadsEn {
	_TranslationsMyToolsCatalogDownloadsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Transferências';
	@override String get description => 'Revise e limpe arquivos de uso único em Downloads para manter as pastas organizadas.';
}

// Path: myToolsCatalog.largeOld
class _TranslationsMyToolsCatalogLargeOldPt implements TranslationsMyToolsCatalogLargeOldEn {
	_TranslationsMyToolsCatalogLargeOldPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Arquivos grandes e antigos';
	@override String get description => 'Encontre e remova arquivos grandes e não utilizados que ocupam espaço no seu Mac.';
}

// Path: myToolsCatalog.similarImages
class _TranslationsMyToolsCatalogSimilarImagesPt implements TranslationsMyToolsCatalogSimilarImagesEn {
	_TranslationsMyToolsCatalogSimilarImagesPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Imagens semelhantes';
	@override String get description => 'Revise fotos semelhantes e guarde apenas as melhores.';
}

// Path: myToolsCatalog.trashBins
class _TranslationsMyToolsCatalogTrashBinsPt implements TranslationsMyToolsCatalogTrashBinsEn {
	_TranslationsMyToolsCatalogTrashBinsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lixeiras';
	@override String get description => 'Esvazie todas as lixeiras disponíveis no seu Mac.';
}

// Path: myToolsCatalog.duplicateFinder
class _TranslationsMyToolsCatalogDuplicateFinderPt implements TranslationsMyToolsCatalogDuplicateFinderEn {
	_TranslationsMyToolsCatalogDuplicateFinderPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Localizador de duplicatas';
	@override String get description => 'Remova arquivos duplicados armazenados em locais diferentes do seu Mac.';
}

// Path: myToolsCatalog.applicationPermissions
class _TranslationsMyToolsCatalogApplicationPermissionsPt implements TranslationsMyToolsCatalogApplicationPermissionsEn {
	_TranslationsMyToolsCatalogApplicationPermissionsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Permissões de aplicativos';
	@override String get description => 'Gerencie como os aplicativos acessam recursos, dispositivos e funcionalidades do sistema.';
}

// Path: myToolsCatalog.systemJunk
class _TranslationsMyToolsCatalogSystemJunkPt implements TranslationsMyToolsCatalogSystemJunkEn {
	_TranslationsMyToolsCatalogSystemJunkPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lixo do sistema';
	@override String get description => 'Remova arquivos redundantes que obstruem o armazenamento do dispositivo e impedem o desempenho ideal.';
}

// Path: myToolsCatalog.timeMachineSnapshot
class _TranslationsMyToolsCatalogTimeMachineSnapshotPt implements TranslationsMyToolsCatalogTimeMachineSnapshotEn {
	_TranslationsMyToolsCatalogTimeMachineSnapshotPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Instantâneo da máquina do tempo';
	@override String get description => 'Remova snapshots locais do Time Machine sem afetar seus backups.';
}

// Path: myToolsCatalog.loginItems
class _TranslationsMyToolsCatalogLoginItemsPt implements TranslationsMyToolsCatalogLoginItemsEn {
	_TranslationsMyToolsCatalogLoginItemsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Itens de login';
	@override String get description => 'Gerencie aplicativos que abrem automaticamente quando você inicia o Mac.';
}

// Path: myToolsCatalog.mailAttachments
class _TranslationsMyToolsCatalogMailAttachmentsPt implements TranslationsMyToolsCatalogMailAttachmentsEn {
	_TranslationsMyToolsCatalogMailAttachmentsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Anexos de correio';
	@override String get description => 'Remova anexos de e-mail armazenados localmente para liberar espaço enquanto mantém os arquivos modificados.';
}

// Path: myToolsCatalog.malwareFinder
class _TranslationsMyToolsCatalogMalwareFinderPt implements TranslationsMyToolsCatalogMalwareFinderEn {
	_TranslationsMyToolsCatalogMalwareFinderPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Localizador de malware';
	@override String get description => 'Identifique e remova itens maliciosos para manter seu Mac seguro.';
}

// Path: myToolsCatalog.uninstaller
class _TranslationsMyToolsCatalogUninstallerPt implements TranslationsMyToolsCatalogUninstallerEn {
	_TranslationsMyToolsCatalogUninstallerPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Desinstalador';
	@override String get description => 'Remova corretamente aplicativos inteiros com todos os arquivos relacionados.';
}

// Path: cleanupCategories.userCache
class _TranslationsCleanupCategoriesUserCachePt implements TranslationsCleanupCategoriesUserCacheEn {
	_TranslationsCleanupCategoriesUserCachePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get name => 'Arquivos de cache do usuário';
	@override String get description => 'Originalmente destinados a melhorar os tempos de inicialização, os arquivos de cache dos seus aplicativos acabam se acumulando e resultando em funcionamento inadequado ou queda geral no desempenho.';
}

// Path: cleanupCategories.userLogs
class _TranslationsCleanupCategoriesUserLogsPt implements TranslationsCleanupCategoriesUserLogsEn {
	_TranslationsCleanupCategoriesUserLogsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get name => 'Arquivos de log do usuário';
	@override String get description => 'Os arquivos de log são criados pelo macOS e seus aplicativos para registrar eventos e erros. Com o tempo, eles podem crescer e ocupar um espaço significativo.';
}

// Path: cleanupCategories.languageFiles
class _TranslationsCleanupCategoriesLanguageFilesPt implements TranslationsCleanupCategoriesLanguageFilesEn {
	_TranslationsCleanupCategoriesLanguageFilesPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get name => 'Arquivos de idioma';
	@override String get description => 'Recursos de localização não utilizados incluídos em aplicativos. A remoção de idiomas que você não usa libera armazenamento sem afetar a funcionalidade.';
}

// Path: cleanupCategories.systemLogs
class _TranslationsCleanupCategoriesSystemLogsPt implements TranslationsCleanupCategoriesSystemLogsEn {
	_TranslationsCleanupCategoriesSystemLogsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get name => 'Arquivos de log do sistema';
	@override String get description => 'Arquivos de log de todo o sistema escritos por serviços e daemons do macOS. Esses arquivos podem ser removidos com segurança, pois o sistema os recria quando necessário.';
}

// Path: cleanupCategories.brokenLoginItems
class _TranslationsCleanupCategoriesBrokenLoginItemsPt implements TranslationsCleanupCategoriesBrokenLoginItemsEn {
	_TranslationsCleanupCategoriesBrokenLoginItemsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get name => 'Itens de login quebrados';
	@override String get description => 'Itens de login que apontam para aplicativos ou arquivos que não existem mais em seu disco. Removê-los acelera o tempo de login.';
}

// Path: sections.home.features
class _TranslationsSectionsHomeFeaturesPt implements TranslationsSectionsHomeFeaturesEn {
	_TranslationsSectionsHomeFeaturesPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get systemStatus => 'Status do sistema';
	@override String get storageUsage => 'Uso de armazenamento';
	@override String get quickActions => 'Ações rápidas';
}

// Path: sections.cleanup.features
class _TranslationsSectionsCleanupFeaturesPt implements TranslationsSectionsCleanupFeaturesEn {
	_TranslationsSectionsCleanupFeaturesPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get systemJunk => 'Lixo do sistema';
	@override String get userCache => 'Cache do usuário';
	@override String get tempFiles => 'Arquivos temporários';
}

// Path: sections.myClutter.features
class _TranslationsSectionsMyClutterFeaturesPt implements TranslationsSectionsMyClutterFeaturesEn {
	_TranslationsSectionsMyClutterFeaturesPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get largeFiles => 'Arquivos grandes';
	@override String get duplicates => 'Duplicatas';
	@override String get largeSimilarImages => 'Grandes Imagens Semelhantes';
}

// Path: sections.spaceView.features
class _TranslationsSectionsSpaceViewFeaturesPt implements TranslationsSectionsSpaceViewFeaturesEn {
	_TranslationsSectionsSpaceViewFeaturesPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get visualStorageMap => 'Mapa de armazenamento visual';
	@override String get largeFoldersOverview => 'Visão geral de pastas grandes';
	@override String get hiddenFilesUncovered => 'Arquivos ocultos descobertos';
}

// Path: sections.applications.features
class _TranslationsSectionsApplicationsFeaturesPt implements TranslationsSectionsApplicationsFeaturesEn {
	_TranslationsSectionsApplicationsFeaturesPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get appUninstaller => 'Desinstalador de aplicativos';
	@override String get largeApps => 'Aplicativos grandes';
	@override String get fileLeftovers => 'Sobras de arquivo';
}

// Path: sections.myTools.features
class _TranslationsSectionsMyToolsFeaturesPt implements TranslationsSectionsMyToolsFeaturesEn {
	_TranslationsSectionsMyToolsFeaturesPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get targetedScanners => 'Scanners direcionados';
	@override String get quickActions => 'Ações rápidas';
	@override String get liveFiltering => 'Filtragem ao vivo';
}

/// The flat map containing all translations for locale <pt>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'PristineCleaner',
			'language.label' => 'Linguagem',
			'language.english' => 'Inglês',
			'language.spanish' => 'Espanhol',
			'language.italian' => 'italiano',
			'language.french' => 'Francês',
			'language.hebrew' => 'hebraico',
			'language.greek' => 'grego',
			'language.portuguese' => 'Português',
			'language.mandarin' => 'Mandarim',
			'navigation.home' => 'Lar',
			'navigation.cleanup' => 'Limpar',
			'navigation.myClutter' => 'Minha desordem',
			'navigation.spaceView' => 'Visualização do espaço',
			'navigation.applications' => 'Aplicações',
			'navigation.myTools' => 'Minhas ferramentas',
			'navigation.myActivity' => 'Minha atividade',
			'navigation.donate' => 'Doar',
			'sections.home.title' => 'Lar',
			'sections.home.subtitle' => 'Obtenha uma visão geral completa da integridade\no seu sistema com um clique.',
			'sections.home.features.systemStatus' => 'Status do sistema',
			'sections.home.features.storageUsage' => 'Uso de armazenamento',
			'sections.home.features.quickActions' => 'Ações rápidas',
			'sections.cleanup.title' => 'Limpeza de lixo',
			'sections.cleanup.subtitle' => 'Limpe seu sistema para alcançar o desempenho\nmáximo e recuperar mais espaço livre.',
			'sections.cleanup.features.systemJunk' => 'Lixo do sistema',
			'sections.cleanup.features.userCache' => 'Cache do usuário',
			'sections.cleanup.features.tempFiles' => 'Arquivos temporários',
			'sections.myClutter.title' => 'Minha desordem',
			'sections.myClutter.subtitle' => 'Classifique seus arquivos e reduza\na bagunça com apenas alguns cliques.',
			'sections.myClutter.features.largeFiles' => 'Arquivos grandes',
			'sections.myClutter.features.duplicates' => 'Duplicatas',
			'sections.myClutter.features.largeSimilarImages' => 'Grandes Imagens Semelhantes',
			'sections.spaceView.title' => 'Visualização do espaço',
			'sections.spaceView.subtitle' => 'Visualize o que está ocupando mais\nde espaço em disco e limpe rapidamente.',
			'sections.spaceView.features.visualStorageMap' => 'Mapa de armazenamento visual',
			'sections.spaceView.features.largeFoldersOverview' => 'Visão geral de pastas grandes',
			'sections.spaceView.features.hiddenFilesUncovered' => 'Arquivos ocultos descobertos',
			'sections.applications.title' => 'Aplicações',
			'sections.applications.subtitle' => 'Assuma o controle de seus aplicativos.\nDesinstale ou remova sobras antigas.',
			'sections.applications.features.appUninstaller' => 'Desinstalador de aplicativos',
			'sections.applications.features.largeApps' => 'Aplicativos grandes',
			'sections.applications.features.fileLeftovers' => 'Sobras de arquivo',
			'sections.myTools.title' => 'Minhas ferramentas',
			'sections.myTools.subtitle' => 'Seu kit de ferramentas ideal para cuidados e manutenção do sistema.',
			'sections.myTools.features.targetedScanners' => 'Scanners direcionados',
			'sections.myTools.features.quickActions' => 'Ações rápidas',
			'sections.myTools.features.liveFiltering' => 'Filtragem ao vivo',
			'progress.countingFiles' => 'Contando arquivos...',
			'progress.countingApplications' => 'Contando aplicações...',
			'progress.countingFolders' => 'Contando pastas...',
			'errors.itemsFailedToRemove' => '{count} itens não foram removidos.',
			'buttons.scan' => 'Digitalizar',
			'buttons.stop' => 'Parar',
			'buttons.done' => 'Feito',
			'buttons.clean' => 'Limpar',
			'buttons.cleanUp' => 'Limpar',
			'buttons.close' => 'Fechar',
			'buttons.refresh' => 'Atualizar',
			'buttons.rescan' => 'Digitalizar novamente',
			'buttons.startOver' => 'Recomeçar',
			'buttons.selectAll' => 'Selecionar tudo',
			'buttons.clearSelection' => 'Limpar seleção',
			'buttons.keepScanning' => 'Continue digitalizando',
			'buttons.keepRemoving' => 'Continue removendo',
			'tooltips.search' => 'Procurar',
			'tooltips.openInFinder' => 'Abrir no Finder',
			'dialogs.stopScanningTitle' => 'Parar de digitalizar?',
			'dialogs.stopScanningMessage' => 'Isto cancelará a verificação atual e descartará qualquer progresso parcial.',
			'dialogs.stopRemovalTitle' => 'Interromper a remoção?',
			'dialogs.stopRemovalMessage' => 'O arquivo atual será concluído e os arquivos restantes serão ignorados.',
			'removal.barrierLabel' => 'Progresso da remoção',
			'removal.preparing' => 'Preparando...',
			'removal.removingFrom' => 'Removendo de {title}',
			'removal.stoppingAfterCurrentFile' => 'Parando após o arquivo atual...',
			'removal.keepWindowOpen' => 'Por favor, mantenha esta janela aberta enquanto a remoção é executada.',
			'removal.processedSummary' => '{processed} de {total} processado',
			'removal.deletedFreed' => '{deleted} excluído • {bytes} liberado',
			'removal.currentItem' => 'Atual: {name}',
			'removal.stopping' => 'Parando...',
			'removal.removalFailed' => 'Falha na remoção',
			'removal.removalFailedDetails' => 'Algo deu errado ao remover os arquivos selecionados.',
			'removal.removalStopped' => 'Remoção interrompida',
			'removal.removalComplete' => 'Remoção concluída',
			'removal.deletedSummary' => '{title} item(s) {count} excluído(s)',
			'removal.freedSummary' => '{bytes} liberado',
			'removal.failedToRemoveSummary' => '{count} itens não foram removidos.',
			'removal.deletedFiles' => 'Arquivos excluídos',
			'removal.noFilesDeleted' => 'Nenhum arquivo foi excluído.',
			'done.allCleanedTitle' => 'Tudo limpo!',
			'done.movedToTrashMessage' => 'Os arquivos selecionados foram movidos para a Lixeira.',
			'done.applicationsRemovedTitle' => 'Aplicativos removidos!',
			'done.appsMovedToTrashMessage' => 'Os aplicativos selecionados foram movidos para a Lixeira.',
			'donate.title' => 'Apoie o PristineCleaner',
			'donate.subtitle' => 'Se o PristineCleaner ajuda voce a manter seu sistema limpo, voce pode apoiar o desenvolvimento com uma pequena doacao.',
			'donate.buyMeACoffee' => 'Buy Me a Coffee',
			'donate.paypalDonate' => 'Doar com PayPal',
			'donate.openLinkFailed' => 'Nao foi possivel abrir o link de doacao.',
			'cleanupManager.title' => 'Gerenciador de limpeza',
			'cleanupManager.systemJunkHeader' => 'Lixo do sistema',
			'cleanupManager.systemJunkDescription' => 'Arquivos redundantes que obstruem o armazenamento do dispositivo e impedem o desempenho ideal.',
			'cleanupManager.selectLabel' => 'Selecione',
			'cleanupManager.selectAllOption' => 'Todos',
			'cleanupManager.selectNoneOption' => 'Nenhum',
			'cleanupManager.noItems' => 'Nenhum item',
			'cleanupManager.noItemsFound' => 'Nenhum item encontrado',
			'cleanupManager.itemsSelected' => '{count} itens selecionados',
			'projectDirectory.chooseFolder' => 'Escolha a pasta...',
			'projectDirectory.chooseProjectDirectory' => 'Escolha o diretório do projeto',
			'projectDirectory.chooseParentFolder' => 'Escolha a pasta pai',
			'projectDirectory.noFolder' => 'No folder',
			'searchAndSort.searchHint' => 'Procurar...',
			'searchAndSort.sortBy' => 'Ordenar por',
			'searchAndSort.size' => 'Tamanho',
			'searchAndSort.name' => 'Nome',
			'searchAndSort.ascending' => 'Ascendente',
			'searchAndSort.descending' => 'Descendente',
			'spaceView.noFoldersFound' => 'Nenhuma pasta encontrada para este nível',
			'spaceView.noBubblesToRender' => 'Sem bolhas para renderizar',
			'spaceView.otherItems' => 'Outros itens',
			'home.refresh' => 'Atualizar',
			'home.unableToReadDiskInfo' => 'Não é possível ler as informações do disco',
			'home.totalStorage' => 'Armazenamento total',
			'home.used' => 'Usado',
			'home.available' => 'Disponível',
			'home.percentUsed' => '{percent}% usado',
			'home.cpuUsage' => 'Uso da CPU',
			'home.ramUsage' => 'Uso de RAM',
			'home.memoryPercentUsed' => '{percent}% RAM usada',
			'home.unableToReadSystemInfo' => 'Não é possível ler as informações do sistema',
			'myToolsPage.title' => 'Minhas ferramentas',
			'myToolsPage.subtitle' => 'Suas ferramentas essenciais para manter seu Mac limpo, seguro e funcionando perfeitamente.',
			'myToolsPage.backToTools' => 'Voltar para ferramentas',
			'myToolsMessages.itemsWithSize' => '{count} item(s) • {size}',
			'myToolsMessages.scanCancelled' => 'a verificação foi cancelada.',
			'myToolsMessages.selectAtLeastOne' => 'Selecione pelo menos um item para limpar.',
			'myToolsMessages.failedToClean' => 'Falha ao limpar item(s) {count}.',
			'myToolsMessages.everythingSelectedCleaned' => 'Tudo selecionado foi limpo.',
			'myToolsMessages.cleanupUpdated' => 'Limpeza atualizada.',
			'myToolsMessages.cleanedCount' => 'Itens {count} limpos.',
			'myToolsMessages.stoppedPrefix' => 'Parou.',
			'myToolsMessages.removedCount' => 'Itens {count} removidos.',
			'myToolsMessages.failedCountShort' => '{count} falhou.',
			'myToolsMessages.scanComplete' => 'Digitalização concluída.',
			'myToolsMessages.somethingWentWrong' => 'Algo deu errado.',
			'myToolsMessages.fallback.downloadsTidy' => 'Os downloads são organizados.',
			'myToolsMessages.fallback.noOversizedStale' => 'Nenhum arquivo obsoleto superdimensionado foi encontrado.',
			'myToolsMessages.fallback.noRecentDuplicates' => 'Nenhuma duplicata recente encontrada.',
			'myToolsMessages.fallback.noSimilarLargeImages' => 'Nenhuma imagem grande semelhante encontrada.',
			'myToolsMessages.fallback.noAppLeftovers' => 'Não foram encontradas sobras de aplicativos removíveis.',
			'myToolsMessages.fallback.noStaleApps' => 'Nenhum aplicativo obsoleto foi encontrado.',
			'myToolsMessages.fallback.appsNeedReview' => 'Foram encontrados aplicativos que podem precisar de revisão.',
			'myToolsMessages.fallback.noSystemJunkCandidates' => 'Não há candidatos para limpeza no lixo do sistema.',
			'myToolsMessages.fallback.noBrokenStartup' => 'Nenhuma entrada quebrada de inicialização/segundo plano foi encontrada.',
			'myToolsMessages.fallback.noBackgroundItems' => 'Nenhum item de plano de fundo foi encontrado.',
			'myToolsMessages.fallback.noPrivacyTraces' => 'Nenhum vestígio de privacidade encontrado em locais conhecidos.',
			'myToolsMessages.fallback.trashAlreadyEmpty' => 'A lixeira já está vazia.',
			'myToolsMessages.fallback.noPermissionCache' => 'Nenhum arquivo de cache de permissão foi encontrado.',
			'myToolsMessages.fallback.noTimeMachineSnapshots' => 'Nenhum snapshot local do Time Machine foi encontrado.',
			'myToolsMessages.fallback.noMaintenanceCandidates' => 'Nenhum candidato à manutenção foi encontrado.',
			'myToolsMessages.fallback.noMailAttachments' => 'Nenhum anexo de e-mail removível foi encontrado.',
			'myToolsMessages.fallback.noSuspiciousFiles' => 'Nenhum arquivo suspeito foi detectado.',
			'myToolsCatalog.appLeftovers.title' => 'Sobras de aplicativos',
			'myToolsCatalog.appLeftovers.description' => 'Localize e remova sobras de aplicativos, mesmo que o aplicativo principal já tenha desaparecido.',
			'myToolsCatalog.backgroundItems.title' => 'Itens de plano de fundo',
			'myToolsCatalog.backgroundItems.description' => 'Gerencie aplicativos e processos em segundo plano em execução no seu Mac.',
			'myToolsCatalog.downloads.title' => 'Transferências',
			'myToolsCatalog.downloads.description' => 'Revise e limpe arquivos de uso único em Downloads para manter as pastas organizadas.',
			'myToolsCatalog.largeOld.title' => 'Arquivos grandes e antigos',
			'myToolsCatalog.largeOld.description' => 'Encontre e remova arquivos grandes e não utilizados que ocupam espaço no seu Mac.',
			'myToolsCatalog.similarImages.title' => 'Imagens semelhantes',
			'myToolsCatalog.similarImages.description' => 'Revise fotos semelhantes e guarde apenas as melhores.',
			'myToolsCatalog.trashBins.title' => 'Lixeiras',
			'myToolsCatalog.trashBins.description' => 'Esvazie todas as lixeiras disponíveis no seu Mac.',
			'myToolsCatalog.duplicateFinder.title' => 'Localizador de duplicatas',
			'myToolsCatalog.duplicateFinder.description' => 'Remova arquivos duplicados armazenados em locais diferentes do seu Mac.',
			'myToolsCatalog.applicationPermissions.title' => 'Permissões de aplicativos',
			'myToolsCatalog.applicationPermissions.description' => 'Gerencie como os aplicativos acessam recursos, dispositivos e funcionalidades do sistema.',
			'myToolsCatalog.systemJunk.title' => 'Lixo do sistema',
			'myToolsCatalog.systemJunk.description' => 'Remova arquivos redundantes que obstruem o armazenamento do dispositivo e impedem o desempenho ideal.',
			'myToolsCatalog.timeMachineSnapshot.title' => 'Instantâneo da máquina do tempo',
			'myToolsCatalog.timeMachineSnapshot.description' => 'Remova snapshots locais do Time Machine sem afetar seus backups.',
			'myToolsCatalog.loginItems.title' => 'Itens de login',
			'myToolsCatalog.loginItems.description' => 'Gerencie aplicativos que abrem automaticamente quando você inicia o Mac.',
			'myToolsCatalog.mailAttachments.title' => 'Anexos de correio',
			'myToolsCatalog.mailAttachments.description' => 'Remova anexos de e-mail armazenados localmente para liberar espaço enquanto mantém os arquivos modificados.',
			'myToolsCatalog.malwareFinder.title' => 'Localizador de malware',
			'myToolsCatalog.malwareFinder.description' => 'Identifique e remova itens maliciosos para manter seu Mac seguro.',
			'myToolsCatalog.uninstaller.title' => 'Desinstalador',
			'myToolsCatalog.uninstaller.description' => 'Remova corretamente aplicativos inteiros com todos os arquivos relacionados.',
			'cleanupCategories.userCache.name' => 'Arquivos de cache do usuário',
			'cleanupCategories.userCache.description' => 'Originalmente destinados a melhorar os tempos de inicialização, os arquivos de cache dos seus aplicativos acabam se acumulando e resultando em funcionamento inadequado ou queda geral no desempenho.',
			'cleanupCategories.userLogs.name' => 'Arquivos de log do usuário',
			'cleanupCategories.userLogs.description' => 'Os arquivos de log são criados pelo macOS e seus aplicativos para registrar eventos e erros. Com o tempo, eles podem crescer e ocupar um espaço significativo.',
			'cleanupCategories.languageFiles.name' => 'Arquivos de idioma',
			'cleanupCategories.languageFiles.description' => 'Recursos de localização não utilizados incluídos em aplicativos. A remoção de idiomas que você não usa libera armazenamento sem afetar a funcionalidade.',
			'cleanupCategories.systemLogs.name' => 'Arquivos de log do sistema',
			'cleanupCategories.systemLogs.description' => 'Arquivos de log de todo o sistema escritos por serviços e daemons do macOS. Esses arquivos podem ser removidos com segurança, pois o sistema os recria quando necessário.',
			'cleanupCategories.brokenLoginItems.name' => 'Itens de login quebrados',
			'cleanupCategories.brokenLoginItems.description' => 'Itens de login que apontam para aplicativos ou arquivos que não existem mais em seu disco. Removê-los acelera o tempo de login.',
			'myClutterDashboard.backToCategories' => 'Voltar às categorias',
			'myClutterDashboard.filesToSort' => 'Você tem {count} arquivos para classificar.',
			'myClutterDashboard.quickRecommendations' => 'Use recomendações rápidas ou revise-as manualmente.',
			'myClutterDashboard.reviewAllFiles' => 'Revise todos os arquivos',
			'myClutterDashboard.freshDuplicatesFound' => '{count} Novas duplicatas encontradas',
			'myClutterDashboard.noDuplicates' => 'Nenhuma duplicata encontrada nesta verificação.',
			'myClutterDashboard.removeDuplicateBytes' => 'Remova {bytes} de arquivos duplicados.',
			'myClutterDashboard.largeSimilarImagesFound' => '{count} Grandes imagens semelhantes encontradas',
			'myClutterDashboard.noSimilarGroups' => 'Nenhum grupo de imagens semelhantes encontrado.',
			'myClutterDashboard.nearlyIdenticalImages' => 'Existem {bytes} de imagens quase idênticas.',
			'myClutterDashboard.largeFilesFound' => '{bytes} de arquivos grandes encontrados',
			'myClutterDashboard.noLargeFiles' => 'Nenhum arquivo grande encontrado.',
			'myClutterDashboard.largeFilesReady' => '{count} arquivos grandes estão prontos para revisão.',
			'myClutterDashboard.review' => 'Análise',
			'scanResults.itemsSummary' => '{count} itens • {size}',
			'scanResults.scannedInMs' => 'Digitalizado em {ms}ms',
			'scanResults.deselectAll' => 'Desmarcar tudo',
			'scanResults.selectAll' => 'Selecionar tudo',
			'scanResults.noItemsMatchSearch' => 'Nenhum item corresponde à sua pesquisa',
			'scanResults.noItemsFound' => 'Nenhum item encontrado',
			'scanResults.itemsSelected' => '{count} itens selecionados',
			'scanResults.rescan' => 'Digitalizar novamente',
			'spaceViewStart.subtitle' => 'Escolha uma pasta pai e digitalize para mapear o que está ocupando mais espaço.',
			'spaceViewStart.defaultRootPath' => 'O caminho raiz padrão é o seu disco rígido principal',
			'spaceViewStart.exploreBubbles' => 'Explore tamanhos de pastas por meio de bolhas interativas',
			'spaceViewStart.clickToDrillDown' => 'Clique nas pastas para detalhar e inspecionar mais profundamente',
			'shell.comingSoon' => 'Em breve',
			'myToolsService.snapshotName' => 'Instantâneo {id}',
			'myToolsService.timeMachineGroup' => 'Máquina do Tempo',
			'myToolsService.timeMachineMacOnly' => 'Os instantâneos do Time Machine estão disponíveis apenas no macOS.',
			_ => null,
		};
	}
}
