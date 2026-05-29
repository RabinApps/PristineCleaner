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
	@override late final _Translations$app$pt app = _Translations$app$pt._(_root);
	@override late final _Translations$language$pt language = _Translations$language$pt._(_root);
	@override late final _Translations$navigation$pt navigation = _Translations$navigation$pt._(_root);
	@override late final _Translations$sections$pt sections = _Translations$sections$pt._(_root);
	@override late final _Translations$progress$pt progress = _Translations$progress$pt._(_root);
	@override late final _Translations$errors$pt errors = _Translations$errors$pt._(_root);
	@override late final _Translations$buttons$pt buttons = _Translations$buttons$pt._(_root);
	@override late final _Translations$tooltips$pt tooltips = _Translations$tooltips$pt._(_root);
	@override late final _Translations$dialogs$pt dialogs = _Translations$dialogs$pt._(_root);
	@override late final _Translations$removal$pt removal = _Translations$removal$pt._(_root);
	@override late final _Translations$done$pt done = _Translations$done$pt._(_root);
	@override late final _Translations$donate$pt donate = _Translations$donate$pt._(_root);
	@override late final _Translations$cleanupManager$pt cleanupManager = _Translations$cleanupManager$pt._(_root);
	@override late final _Translations$projectDirectory$pt projectDirectory = _Translations$projectDirectory$pt._(_root);
	@override late final _Translations$searchAndSort$pt searchAndSort = _Translations$searchAndSort$pt._(_root);
	@override late final _Translations$spaceView$pt spaceView = _Translations$spaceView$pt._(_root);
	@override late final _Translations$home$pt home = _Translations$home$pt._(_root);
	@override late final _Translations$myToolsPage$pt myToolsPage = _Translations$myToolsPage$pt._(_root);
	@override late final _Translations$myToolsMessages$pt myToolsMessages = _Translations$myToolsMessages$pt._(_root);
	@override late final _Translations$myToolsCatalog$pt myToolsCatalog = _Translations$myToolsCatalog$pt._(_root);
	@override late final _Translations$cleanupCategories$pt cleanupCategories = _Translations$cleanupCategories$pt._(_root);
	@override late final _Translations$myClutterDashboard$pt myClutterDashboard = _Translations$myClutterDashboard$pt._(_root);
	@override late final _Translations$scanResults$pt scanResults = _Translations$scanResults$pt._(_root);
	@override late final _Translations$spaceViewStart$pt spaceViewStart = _Translations$spaceViewStart$pt._(_root);
	@override late final _Translations$shell$pt shell = _Translations$shell$pt._(_root);
	@override late final _Translations$myToolsService$pt myToolsService = _Translations$myToolsService$pt._(_root);
}

// Path: app
class _Translations$app$pt implements Translations$app$en {
	_Translations$app$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'PristineCleaner';
}

// Path: language
class _Translations$language$pt implements Translations$language$en {
	_Translations$language$pt._(this._root);

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
class _Translations$navigation$pt implements Translations$navigation$en {
	_Translations$navigation$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Lar';
	@override String get cleanup => 'Limpar';
	@override String get myClutter => 'Minha desordem';
	@override String get spaceView => 'Visualização do espaço';
	@override String get applications => 'Aplicações';
	@override String get myTools => 'Minhas ferramentas';
	@override String get donate => 'Doar';
}

// Path: sections
class _Translations$sections$pt implements Translations$sections$en {
	_Translations$sections$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sections$home$pt home = _Translations$sections$home$pt._(_root);
	@override late final _Translations$sections$cleanup$pt cleanup = _Translations$sections$cleanup$pt._(_root);
	@override late final _Translations$sections$myClutter$pt myClutter = _Translations$sections$myClutter$pt._(_root);
	@override late final _Translations$sections$spaceView$pt spaceView = _Translations$sections$spaceView$pt._(_root);
	@override late final _Translations$sections$applications$pt applications = _Translations$sections$applications$pt._(_root);
	@override late final _Translations$sections$myTools$pt myTools = _Translations$sections$myTools$pt._(_root);
}

// Path: progress
class _Translations$progress$pt implements Translations$progress$en {
	_Translations$progress$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get countingFiles => 'Contando arquivos...';
	@override String get countingApplications => 'Contando aplicações...';
	@override String get countingFolders => 'Contando pastas...';
}

// Path: errors
class _Translations$errors$pt implements Translations$errors$en {
	_Translations$errors$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get itemsFailedToRemove => '{count} itens não foram removidos.';
}

// Path: buttons
class _Translations$buttons$pt implements Translations$buttons$en {
	_Translations$buttons$pt._(this._root);

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
class _Translations$tooltips$pt implements Translations$tooltips$en {
	_Translations$tooltips$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get search => 'Procurar';
	@override String get openInFinder => 'Abrir no Finder';
}

// Path: dialogs
class _Translations$dialogs$pt implements Translations$dialogs$en {
	_Translations$dialogs$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get stopScanningTitle => 'Parar de digitalizar?';
	@override String get stopScanningMessage => 'Isto cancelará a verificação atual e descartará qualquer progresso parcial.';
	@override String get stopRemovalTitle => 'Interromper a remoção?';
	@override String get stopRemovalMessage => 'O arquivo atual será concluído e os arquivos restantes serão ignorados.';
}

// Path: removal
class _Translations$removal$pt implements Translations$removal$en {
	_Translations$removal$pt._(this._root);

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
class _Translations$done$pt implements Translations$done$en {
	_Translations$done$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get allCleanedTitle => 'Tudo limpo!';
	@override String get movedToTrashMessage => 'Os arquivos selecionados foram movidos para a Lixeira.';
	@override String get applicationsRemovedTitle => 'Aplicativos removidos!';
	@override String get appsMovedToTrashMessage => 'Os aplicativos selecionados foram movidos para a Lixeira.';
}

// Path: donate
class _Translations$donate$pt implements Translations$donate$en {
	_Translations$donate$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Apoie o PristineCleaner';
	@override String get subtitle => 'Se o PristineCleaner ajuda voce a manter seu sistema limpo, voce pode apoiar o desenvolvimento com uma pequena doacao.';
	@override String get buyMeACoffee => 'Buy Me a Coffee';
	@override String get paypalDonate => 'Doar com PayPal';
	@override String get openLinkFailed => 'Nao foi possivel abrir o link de doacao.';
}

// Path: cleanupManager
class _Translations$cleanupManager$pt implements Translations$cleanupManager$en {
	_Translations$cleanupManager$pt._(this._root);

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
class _Translations$projectDirectory$pt implements Translations$projectDirectory$en {
	_Translations$projectDirectory$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get chooseFolder => 'Escolha a pasta...';
	@override String get chooseProjectDirectory => 'Escolha o diretório do projeto';
	@override String get chooseParentFolder => 'Escolha a pasta pai';
	@override String get noFolder => 'No folder';
}

// Path: searchAndSort
class _Translations$searchAndSort$pt implements Translations$searchAndSort$en {
	_Translations$searchAndSort$pt._(this._root);

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
class _Translations$spaceView$pt implements Translations$spaceView$en {
	_Translations$spaceView$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get noFoldersFound => 'Nenhuma pasta encontrada para este nível';
	@override String get noBubblesToRender => 'Sem bolhas para renderizar';
	@override String get otherItems => 'Outros itens';
}

// Path: home
class _Translations$home$pt implements Translations$home$en {
	_Translations$home$pt._(this._root);

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
class _Translations$myToolsPage$pt implements Translations$myToolsPage$en {
	_Translations$myToolsPage$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Minhas ferramentas';
	@override String get subtitle => 'Suas ferramentas essenciais para manter seu Mac limpo, seguro e funcionando perfeitamente.';
	@override String get backToTools => 'Voltar para ferramentas';
}

// Path: myToolsMessages
class _Translations$myToolsMessages$pt implements Translations$myToolsMessages$en {
	_Translations$myToolsMessages$pt._(this._root);

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
	@override late final _Translations$myToolsMessages$fallback$pt fallback = _Translations$myToolsMessages$fallback$pt._(_root);
}

// Path: myToolsCatalog
class _Translations$myToolsCatalog$pt implements Translations$myToolsCatalog$en {
	_Translations$myToolsCatalog$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final _Translations$myToolsCatalog$appLeftovers$pt appLeftovers = _Translations$myToolsCatalog$appLeftovers$pt._(_root);
	@override late final _Translations$myToolsCatalog$backgroundItems$pt backgroundItems = _Translations$myToolsCatalog$backgroundItems$pt._(_root);
	@override late final _Translations$myToolsCatalog$downloads$pt downloads = _Translations$myToolsCatalog$downloads$pt._(_root);
	@override late final _Translations$myToolsCatalog$largeOld$pt largeOld = _Translations$myToolsCatalog$largeOld$pt._(_root);
	@override late final _Translations$myToolsCatalog$similarImages$pt similarImages = _Translations$myToolsCatalog$similarImages$pt._(_root);
	@override late final _Translations$myToolsCatalog$trashBins$pt trashBins = _Translations$myToolsCatalog$trashBins$pt._(_root);
	@override late final _Translations$myToolsCatalog$duplicateFinder$pt duplicateFinder = _Translations$myToolsCatalog$duplicateFinder$pt._(_root);
	@override late final _Translations$myToolsCatalog$applicationPermissions$pt applicationPermissions = _Translations$myToolsCatalog$applicationPermissions$pt._(_root);
	@override late final _Translations$myToolsCatalog$systemJunk$pt systemJunk = _Translations$myToolsCatalog$systemJunk$pt._(_root);
	@override late final _Translations$myToolsCatalog$timeMachineSnapshot$pt timeMachineSnapshot = _Translations$myToolsCatalog$timeMachineSnapshot$pt._(_root);
	@override late final _Translations$myToolsCatalog$loginItems$pt loginItems = _Translations$myToolsCatalog$loginItems$pt._(_root);
	@override late final _Translations$myToolsCatalog$mailAttachments$pt mailAttachments = _Translations$myToolsCatalog$mailAttachments$pt._(_root);
	@override late final _Translations$myToolsCatalog$malwareFinder$pt malwareFinder = _Translations$myToolsCatalog$malwareFinder$pt._(_root);
	@override late final _Translations$myToolsCatalog$uninstaller$pt uninstaller = _Translations$myToolsCatalog$uninstaller$pt._(_root);
}

// Path: cleanupCategories
class _Translations$cleanupCategories$pt implements Translations$cleanupCategories$en {
	_Translations$cleanupCategories$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final _Translations$cleanupCategories$userCache$pt userCache = _Translations$cleanupCategories$userCache$pt._(_root);
	@override late final _Translations$cleanupCategories$userLogs$pt userLogs = _Translations$cleanupCategories$userLogs$pt._(_root);
	@override late final _Translations$cleanupCategories$languageFiles$pt languageFiles = _Translations$cleanupCategories$languageFiles$pt._(_root);
	@override late final _Translations$cleanupCategories$systemLogs$pt systemLogs = _Translations$cleanupCategories$systemLogs$pt._(_root);
	@override late final _Translations$cleanupCategories$brokenLoginItems$pt brokenLoginItems = _Translations$cleanupCategories$brokenLoginItems$pt._(_root);
}

// Path: myClutterDashboard
class _Translations$myClutterDashboard$pt implements Translations$myClutterDashboard$en {
	_Translations$myClutterDashboard$pt._(this._root);

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
class _Translations$scanResults$pt implements Translations$scanResults$en {
	_Translations$scanResults$pt._(this._root);

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
class _Translations$spaceViewStart$pt implements Translations$spaceViewStart$en {
	_Translations$spaceViewStart$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get subtitle => 'Escolha uma pasta pai e digitalize para mapear o que está ocupando mais espaço.';
	@override String get defaultRootPath => 'O caminho raiz padrão é o seu disco rígido principal';
	@override String get exploreBubbles => 'Explore tamanhos de pastas por meio de bolhas interativas';
	@override String get clickToDrillDown => 'Clique nas pastas para detalhar e inspecionar mais profundamente';
}

// Path: shell
class _Translations$shell$pt implements Translations$shell$en {
	_Translations$shell$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get comingSoon => 'Em breve';
}

// Path: myToolsService
class _Translations$myToolsService$pt implements Translations$myToolsService$en {
	_Translations$myToolsService$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get snapshotName => 'Instantâneo {id}';
	@override String get timeMachineGroup => 'Máquina do Tempo';
	@override String get timeMachineMacOnly => 'Os instantâneos do Time Machine estão disponíveis apenas no macOS.';
}

// Path: sections.home
class _Translations$sections$home$pt implements Translations$sections$home$en {
	_Translations$sections$home$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lar';
	@override String get subtitle => 'Obtenha uma visão geral completa da integridade\no seu sistema com um clique.';
	@override late final _Translations$sections$home$features$pt features = _Translations$sections$home$features$pt._(_root);
}

// Path: sections.cleanup
class _Translations$sections$cleanup$pt implements Translations$sections$cleanup$en {
	_Translations$sections$cleanup$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Limpeza de lixo';
	@override String get subtitle => 'Limpe seu sistema para alcançar o desempenho\nmáximo e recuperar mais espaço livre.';
	@override late final _Translations$sections$cleanup$features$pt features = _Translations$sections$cleanup$features$pt._(_root);
}

// Path: sections.myClutter
class _Translations$sections$myClutter$pt implements Translations$sections$myClutter$en {
	_Translations$sections$myClutter$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Minha desordem';
	@override String get subtitle => 'Classifique seus arquivos e reduza\na bagunça com apenas alguns cliques.';
	@override late final _Translations$sections$myClutter$features$pt features = _Translations$sections$myClutter$features$pt._(_root);
}

// Path: sections.spaceView
class _Translations$sections$spaceView$pt implements Translations$sections$spaceView$en {
	_Translations$sections$spaceView$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Visualização do espaço';
	@override String get subtitle => 'Visualize o que está ocupando mais\nde espaço em disco e limpe rapidamente.';
	@override late final _Translations$sections$spaceView$features$pt features = _Translations$sections$spaceView$features$pt._(_root);
}

// Path: sections.applications
class _Translations$sections$applications$pt implements Translations$sections$applications$en {
	_Translations$sections$applications$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aplicações';
	@override String get subtitle => 'Assuma o controle de seus aplicativos.\nDesinstale ou remova sobras antigas.';
	@override late final _Translations$sections$applications$features$pt features = _Translations$sections$applications$features$pt._(_root);
}

// Path: sections.myTools
class _Translations$sections$myTools$pt implements Translations$sections$myTools$en {
	_Translations$sections$myTools$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Minhas ferramentas';
	@override String get subtitle => 'Seu kit de ferramentas ideal para cuidados e manutenção do sistema.';
	@override late final _Translations$sections$myTools$features$pt features = _Translations$sections$myTools$features$pt._(_root);
}

// Path: myToolsMessages.fallback
class _Translations$myToolsMessages$fallback$pt implements Translations$myToolsMessages$fallback$en {
	_Translations$myToolsMessages$fallback$pt._(this._root);

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
class _Translations$myToolsCatalog$appLeftovers$pt implements Translations$myToolsCatalog$appLeftovers$en {
	_Translations$myToolsCatalog$appLeftovers$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sobras de aplicativos';
	@override String get description => 'Localize e remova sobras de aplicativos, mesmo que o aplicativo principal já tenha desaparecido.';
}

// Path: myToolsCatalog.backgroundItems
class _Translations$myToolsCatalog$backgroundItems$pt implements Translations$myToolsCatalog$backgroundItems$en {
	_Translations$myToolsCatalog$backgroundItems$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Itens de plano de fundo';
	@override String get description => 'Gerencie aplicativos e processos em segundo plano em execução no seu Mac.';
}

// Path: myToolsCatalog.downloads
class _Translations$myToolsCatalog$downloads$pt implements Translations$myToolsCatalog$downloads$en {
	_Translations$myToolsCatalog$downloads$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Transferências';
	@override String get description => 'Revise e limpe arquivos de uso único em Downloads para manter as pastas organizadas.';
}

// Path: myToolsCatalog.largeOld
class _Translations$myToolsCatalog$largeOld$pt implements Translations$myToolsCatalog$largeOld$en {
	_Translations$myToolsCatalog$largeOld$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Arquivos grandes e antigos';
	@override String get description => 'Encontre e remova arquivos grandes e não utilizados que ocupam espaço no seu Mac.';
}

// Path: myToolsCatalog.similarImages
class _Translations$myToolsCatalog$similarImages$pt implements Translations$myToolsCatalog$similarImages$en {
	_Translations$myToolsCatalog$similarImages$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Imagens semelhantes';
	@override String get description => 'Revise fotos semelhantes e guarde apenas as melhores.';
}

// Path: myToolsCatalog.trashBins
class _Translations$myToolsCatalog$trashBins$pt implements Translations$myToolsCatalog$trashBins$en {
	_Translations$myToolsCatalog$trashBins$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lixeiras';
	@override String get description => 'Esvazie todas as lixeiras disponíveis no seu Mac.';
}

// Path: myToolsCatalog.duplicateFinder
class _Translations$myToolsCatalog$duplicateFinder$pt implements Translations$myToolsCatalog$duplicateFinder$en {
	_Translations$myToolsCatalog$duplicateFinder$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Localizador de duplicatas';
	@override String get description => 'Remova arquivos duplicados armazenados em locais diferentes do seu Mac.';
}

// Path: myToolsCatalog.applicationPermissions
class _Translations$myToolsCatalog$applicationPermissions$pt implements Translations$myToolsCatalog$applicationPermissions$en {
	_Translations$myToolsCatalog$applicationPermissions$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Permissões de aplicativos';
	@override String get description => 'Gerencie como os aplicativos acessam recursos, dispositivos e funcionalidades do sistema.';
}

// Path: myToolsCatalog.systemJunk
class _Translations$myToolsCatalog$systemJunk$pt implements Translations$myToolsCatalog$systemJunk$en {
	_Translations$myToolsCatalog$systemJunk$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lixo do sistema';
	@override String get description => 'Remova arquivos redundantes que obstruem o armazenamento do dispositivo e impedem o desempenho ideal.';
}

// Path: myToolsCatalog.timeMachineSnapshot
class _Translations$myToolsCatalog$timeMachineSnapshot$pt implements Translations$myToolsCatalog$timeMachineSnapshot$en {
	_Translations$myToolsCatalog$timeMachineSnapshot$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Instantâneo da máquina do tempo';
	@override String get description => 'Remova snapshots locais do Time Machine sem afetar seus backups.';
}

// Path: myToolsCatalog.loginItems
class _Translations$myToolsCatalog$loginItems$pt implements Translations$myToolsCatalog$loginItems$en {
	_Translations$myToolsCatalog$loginItems$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Itens de login';
	@override String get description => 'Gerencie aplicativos que abrem automaticamente quando você inicia o Mac.';
}

// Path: myToolsCatalog.mailAttachments
class _Translations$myToolsCatalog$mailAttachments$pt implements Translations$myToolsCatalog$mailAttachments$en {
	_Translations$myToolsCatalog$mailAttachments$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Anexos de correio';
	@override String get description => 'Remova anexos de e-mail armazenados localmente para liberar espaço enquanto mantém os arquivos modificados.';
}

// Path: myToolsCatalog.malwareFinder
class _Translations$myToolsCatalog$malwareFinder$pt implements Translations$myToolsCatalog$malwareFinder$en {
	_Translations$myToolsCatalog$malwareFinder$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Localizador de malware';
	@override String get description => 'Identifique e remova itens maliciosos para manter seu Mac seguro.';
}

// Path: myToolsCatalog.uninstaller
class _Translations$myToolsCatalog$uninstaller$pt implements Translations$myToolsCatalog$uninstaller$en {
	_Translations$myToolsCatalog$uninstaller$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Desinstalador';
	@override String get description => 'Remova corretamente aplicativos inteiros com todos os arquivos relacionados.';
}

// Path: cleanupCategories.userCache
class _Translations$cleanupCategories$userCache$pt implements Translations$cleanupCategories$userCache$en {
	_Translations$cleanupCategories$userCache$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get name => 'Arquivos de cache do usuário';
	@override String get description => 'Originalmente destinados a melhorar os tempos de inicialização, os arquivos de cache dos seus aplicativos acabam se acumulando e resultando em funcionamento inadequado ou queda geral no desempenho.';
}

// Path: cleanupCategories.userLogs
class _Translations$cleanupCategories$userLogs$pt implements Translations$cleanupCategories$userLogs$en {
	_Translations$cleanupCategories$userLogs$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get name => 'Arquivos de log do usuário';
	@override String get description => 'Os arquivos de log são criados pelo macOS e seus aplicativos para registrar eventos e erros. Com o tempo, eles podem crescer e ocupar um espaço significativo.';
}

// Path: cleanupCategories.languageFiles
class _Translations$cleanupCategories$languageFiles$pt implements Translations$cleanupCategories$languageFiles$en {
	_Translations$cleanupCategories$languageFiles$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get name => 'Arquivos de idioma';
	@override String get description => 'Recursos de localização não utilizados incluídos em aplicativos. A remoção de idiomas que você não usa libera armazenamento sem afetar a funcionalidade.';
}

// Path: cleanupCategories.systemLogs
class _Translations$cleanupCategories$systemLogs$pt implements Translations$cleanupCategories$systemLogs$en {
	_Translations$cleanupCategories$systemLogs$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get name => 'Arquivos de log do sistema';
	@override String get description => 'Arquivos de log de todo o sistema escritos por serviços e daemons do macOS. Esses arquivos podem ser removidos com segurança, pois o sistema os recria quando necessário.';
}

// Path: cleanupCategories.brokenLoginItems
class _Translations$cleanupCategories$brokenLoginItems$pt implements Translations$cleanupCategories$brokenLoginItems$en {
	_Translations$cleanupCategories$brokenLoginItems$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get name => 'Itens de login quebrados';
	@override String get description => 'Itens de login que apontam para aplicativos ou arquivos que não existem mais em seu disco. Removê-los acelera o tempo de login.';
}

// Path: sections.home.features
class _Translations$sections$home$features$pt implements Translations$sections$home$features$en {
	_Translations$sections$home$features$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get systemStatus => 'Status do sistema';
	@override String get storageUsage => 'Uso de armazenamento';
	@override String get quickActions => 'Ações rápidas';
}

// Path: sections.cleanup.features
class _Translations$sections$cleanup$features$pt implements Translations$sections$cleanup$features$en {
	_Translations$sections$cleanup$features$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get systemJunk => 'Lixo do sistema';
	@override String get userCache => 'Cache do usuário';
	@override String get tempFiles => 'Arquivos temporários';
}

// Path: sections.myClutter.features
class _Translations$sections$myClutter$features$pt implements Translations$sections$myClutter$features$en {
	_Translations$sections$myClutter$features$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get largeFiles => 'Arquivos grandes';
	@override String get duplicates => 'Duplicatas';
	@override String get largeSimilarImages => 'Grandes Imagens Semelhantes';
}

// Path: sections.spaceView.features
class _Translations$sections$spaceView$features$pt implements Translations$sections$spaceView$features$en {
	_Translations$sections$spaceView$features$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get visualStorageMap => 'Mapa de armazenamento visual';
	@override String get largeFoldersOverview => 'Visão geral de pastas grandes';
	@override String get hiddenFilesUncovered => 'Arquivos ocultos descobertos';
}

// Path: sections.applications.features
class _Translations$sections$applications$features$pt implements Translations$sections$applications$features$en {
	_Translations$sections$applications$features$pt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get appUninstaller => 'Desinstalador de aplicativos';
	@override String get largeApps => 'Aplicativos grandes';
	@override String get fileLeftovers => 'Sobras de arquivo';
}

// Path: sections.myTools.features
class _Translations$sections$myTools$features$pt implements Translations$sections$myTools$features$en {
	_Translations$sections$myTools$features$pt._(this._root);

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
