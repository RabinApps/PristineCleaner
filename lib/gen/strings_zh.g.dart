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
class TranslationsZh with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsZh _root = this; // ignore: unused_field

	@override 
	TranslationsZh $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZh(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$zh app = _Translations$app$zh._(_root);
	@override late final _Translations$language$zh language = _Translations$language$zh._(_root);
	@override late final _Translations$navigation$zh navigation = _Translations$navigation$zh._(_root);
	@override late final _Translations$sections$zh sections = _Translations$sections$zh._(_root);
	@override late final _Translations$progress$zh progress = _Translations$progress$zh._(_root);
	@override late final _Translations$errors$zh errors = _Translations$errors$zh._(_root);
	@override late final _Translations$buttons$zh buttons = _Translations$buttons$zh._(_root);
	@override late final _Translations$tooltips$zh tooltips = _Translations$tooltips$zh._(_root);
	@override late final _Translations$dialogs$zh dialogs = _Translations$dialogs$zh._(_root);
	@override late final _Translations$removal$zh removal = _Translations$removal$zh._(_root);
	@override late final _Translations$done$zh done = _Translations$done$zh._(_root);
	@override late final _Translations$donate$zh donate = _Translations$donate$zh._(_root);
	@override late final _Translations$cleanupManager$zh cleanupManager = _Translations$cleanupManager$zh._(_root);
	@override late final _Translations$projectDirectory$zh projectDirectory = _Translations$projectDirectory$zh._(_root);
	@override late final _Translations$searchAndSort$zh searchAndSort = _Translations$searchAndSort$zh._(_root);
	@override late final _Translations$spaceView$zh spaceView = _Translations$spaceView$zh._(_root);
	@override late final _Translations$home$zh home = _Translations$home$zh._(_root);
	@override late final _Translations$myToolsPage$zh myToolsPage = _Translations$myToolsPage$zh._(_root);
	@override late final _Translations$myToolsMessages$zh myToolsMessages = _Translations$myToolsMessages$zh._(_root);
	@override late final _Translations$myToolsCatalog$zh myToolsCatalog = _Translations$myToolsCatalog$zh._(_root);
	@override late final _Translations$cleanupCategories$zh cleanupCategories = _Translations$cleanupCategories$zh._(_root);
	@override late final _Translations$myClutterDashboard$zh myClutterDashboard = _Translations$myClutterDashboard$zh._(_root);
	@override late final _Translations$scanResults$zh scanResults = _Translations$scanResults$zh._(_root);
	@override late final _Translations$spaceViewStart$zh spaceViewStart = _Translations$spaceViewStart$zh._(_root);
	@override late final _Translations$shell$zh shell = _Translations$shell$zh._(_root);
	@override late final _Translations$myToolsService$zh myToolsService = _Translations$myToolsService$zh._(_root);
}

// Path: app
class _Translations$app$zh implements Translations$app$en {
	_Translations$app$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => 'PristineCleaner';
}

// Path: language
class _Translations$language$zh implements Translations$language$en {
	_Translations$language$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get label => '语言';
	@override String get english => '英语';
	@override String get spanish => '西班牙语';
	@override String get italian => '意大利语';
	@override String get french => '法语';
	@override String get hebrew => '希伯来语';
	@override String get greek => '希腊语';
	@override String get portuguese => '葡萄牙语';
	@override String get mandarin => 'Mandarin';
}

// Path: navigation
class _Translations$navigation$zh implements Translations$navigation$en {
	_Translations$navigation$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get home => '首页';
	@override String get cleanup => '清理';
	@override String get myClutter => '我的杂乱';
	@override String get spaceView => '空间景观';
	@override String get applications => '应用领域';
	@override String get myTools => '我的工具';
	@override String get donate => '捐赠';
}

// Path: sections
class _Translations$sections$zh implements Translations$sections$en {
	_Translations$sections$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sections$home$zh home = _Translations$sections$home$zh._(_root);
	@override late final _Translations$sections$cleanup$zh cleanup = _Translations$sections$cleanup$zh._(_root);
	@override late final _Translations$sections$myClutter$zh myClutter = _Translations$sections$myClutter$zh._(_root);
	@override late final _Translations$sections$spaceView$zh spaceView = _Translations$sections$spaceView$zh._(_root);
	@override late final _Translations$sections$applications$zh applications = _Translations$sections$applications$zh._(_root);
	@override late final _Translations$sections$myTools$zh myTools = _Translations$sections$myTools$zh._(_root);
}

// Path: progress
class _Translations$progress$zh implements Translations$progress$en {
	_Translations$progress$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get countingFiles => '正在计算文件...';
	@override String get countingApplications => '正在计算应用程序...';
	@override String get countingFolders => '正在计算文件夹...';
}

// Path: errors
class _Translations$errors$zh implements Translations$errors$en {
	_Translations$errors$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get itemsFailedToRemove => '{count} 项无法删除。';
}

// Path: buttons
class _Translations$buttons$zh implements Translations$buttons$en {
	_Translations$buttons$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get scan => '扫描';
	@override String get stop => '停止';
	@override String get done => '完毕';
	@override String get clean => '干净的';
	@override String get cleanUp => '清理';
	@override String get close => '关闭';
	@override String get refresh => '刷新';
	@override String get rescan => '重新扫描';
	@override String get startOver => '重新开始';
	@override String get selectAll => '选择全部';
	@override String get clearSelection => '清除选择';
	@override String get keepScanning => '继续扫描';
	@override String get keepRemoving => '继续删除';
}

// Path: tooltips
class _Translations$tooltips$zh implements Translations$tooltips$en {
	_Translations$tooltips$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get search => '搜索';
	@override String get openInFinder => '在 Finder 中打开';
}

// Path: dialogs
class _Translations$dialogs$zh implements Translations$dialogs$en {
	_Translations$dialogs$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get stopScanningTitle => '停止扫描？';
	@override String get stopScanningMessage => '这将取消当前扫描并放弃任何部分进度。';
	@override String get stopRemovalTitle => '停止移除？';
	@override String get stopRemovalMessage => '当前文件将完成，然后剩余的文件将被跳过。';
}

// Path: removal
class _Translations$removal$zh implements Translations$removal$en {
	_Translations$removal$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get barrierLabel => '拆除进度';
	@override String get preparing => '正在准备...';
	@override String get removingFrom => '从 {title} 中删除';
	@override String get stoppingAfterCurrentFile => '在当前文件后停止...';
	@override String get keepWindowOpen => '删除运行时请保持此窗口打开。';
	@override String get processedSummary => '已处理 {total} 的 {processed}';
	@override String get deletedFreed => '{deleted} 已删除 • {bytes} 已释放';
	@override String get currentItem => '当前： {name}';
	@override String get stopping => '停止...';
	@override String get removalFailed => '删除失败';
	@override String get removalFailedDetails => '删除所选文件时出现问题。';
	@override String get removalStopped => '移除已停止';
	@override String get removalComplete => '拆除完成';
	@override String get deletedSummary => '{title} 删除了 {count} 项';
	@override String get freedSummary => '{bytes} 已释放';
	@override String get failedToRemoveSummary => '{count} 项无法删除。';
	@override String get deletedFiles => '已删除的文件';
	@override String get noFilesDeleted => '没有文件被删除。';
}

// Path: done
class _Translations$done$zh implements Translations$done$en {
	_Translations$done$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get allCleanedTitle => '全部清理干净了！';
	@override String get movedToTrashMessage => '选定的文件已移至废纸篓。';
	@override String get applicationsRemovedTitle => '应用程序已删除！';
	@override String get appsMovedToTrashMessage => '选定的应用程序已移至垃圾箱。';
}

// Path: donate
class _Translations$donate$zh implements Translations$donate$en {
	_Translations$donate$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '支持 PristineCleaner';
	@override String get subtitle => '如果 PristineCleaner 能帮助您保持系统整洁，欢迎通过小额捐赠支持开发。';
	@override String get buyMeACoffee => 'Buy Me a Coffee';
	@override String get paypalDonate => '通过 PayPal 捐赠';
	@override String get openLinkFailed => '无法打开捐赠链接。';
}

// Path: cleanupManager
class _Translations$cleanupManager$zh implements Translations$cleanupManager$en {
	_Translations$cleanupManager$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '清理经理';
	@override String get systemJunkHeader => '系统垃圾';
	@override String get systemJunkDescription => '冗余文件会堵塞设备存储并妨碍最佳性能。';
	@override String get selectLabel => '选择';
	@override String get selectAllOption => '全部';
	@override String get selectNoneOption => '没有任何';
	@override String get noItems => '没有商品';
	@override String get noItemsFound => '没有找到物品';
	@override String get itemsSelected => '{count} 已选择项目';
}

// Path: projectDirectory
class _Translations$projectDirectory$zh implements Translations$projectDirectory$en {
	_Translations$projectDirectory$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get chooseFolder => '选择文件夹...';
	@override String get chooseProjectDirectory => '选择项目目录';
	@override String get chooseParentFolder => '选择父文件夹';
	@override String get noFolder => '无文件夹';
}

// Path: searchAndSort
class _Translations$searchAndSort$zh implements Translations$searchAndSort$en {
	_Translations$searchAndSort$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get searchHint => '搜索...';
	@override String get sortBy => '排序方式';
	@override String get size => '尺寸';
	@override String get name => '姓名';
	@override String get ascending => '升序';
	@override String get descending => '降序';
}

// Path: spaceView
class _Translations$spaceView$zh implements Translations$spaceView$en {
	_Translations$spaceView$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get noFoldersFound => '找不到该级别的文件夹';
	@override String get noBubblesToRender => '没有气泡可渲染';
	@override String get otherItems => '其他项目';
}

// Path: home
class _Translations$home$zh implements Translations$home$en {
	_Translations$home$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get refresh => '刷新';
	@override String get unableToReadDiskInfo => '无法读取磁盘信息';
	@override String get totalStorage => '总存储空间';
	@override String get used => '已使用';
	@override String get available => '可用';
	@override String get percentUsed => '{percent}% 已使用';
	@override String get cpuUsage => 'CPU 使用率';
	@override String get ramUsage => '内存使用率';
	@override String get memoryPercentUsed => '内存已使用 {percent}%';
	@override String get unableToReadSystemInfo => '无法读取系统信息';
}

// Path: myToolsPage
class _Translations$myToolsPage$zh implements Translations$myToolsPage$en {
	_Translations$myToolsPage$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '我的工具';
	@override String get subtitle => '让您的 Mac 保持清洁、安全和平稳运行的首选工具。';
	@override String get backToTools => '返回工具';
}

// Path: myToolsMessages
class _Translations$myToolsMessages$zh implements Translations$myToolsMessages$en {
	_Translations$myToolsMessages$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get itemsWithSize => '{count} 项目 • {size}';
	@override String get scanCancelled => '扫描被取消。';
	@override String get selectAtLeastOne => '至少选择一项要清洁的物品。';
	@override String get failedToClean => '无法清理 {count} 项。';
	@override String get everythingSelectedCleaned => '所有选择的东西都​​被清理干净了。';
	@override String get cleanupUpdated => '清理已更新。';
	@override String get cleanedCount => '已清洁 {count} 件物品。';
	@override String get stoppedPrefix => '停了。';
	@override String get removedCount => '删除了 {count} 项。';
	@override String get failedCountShort => '{count} 失败。';
	@override String get scanComplete => '扫描完成。';
	@override String get somethingWentWrong => '出了点问题。';
	@override late final _Translations$myToolsMessages$fallback$zh fallback = _Translations$myToolsMessages$fallback$zh._(_root);
}

// Path: myToolsCatalog
class _Translations$myToolsCatalog$zh implements Translations$myToolsCatalog$en {
	_Translations$myToolsCatalog$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final _Translations$myToolsCatalog$appLeftovers$zh appLeftovers = _Translations$myToolsCatalog$appLeftovers$zh._(_root);
	@override late final _Translations$myToolsCatalog$backgroundItems$zh backgroundItems = _Translations$myToolsCatalog$backgroundItems$zh._(_root);
	@override late final _Translations$myToolsCatalog$downloads$zh downloads = _Translations$myToolsCatalog$downloads$zh._(_root);
	@override late final _Translations$myToolsCatalog$largeOld$zh largeOld = _Translations$myToolsCatalog$largeOld$zh._(_root);
	@override late final _Translations$myToolsCatalog$similarImages$zh similarImages = _Translations$myToolsCatalog$similarImages$zh._(_root);
	@override late final _Translations$myToolsCatalog$trashBins$zh trashBins = _Translations$myToolsCatalog$trashBins$zh._(_root);
	@override late final _Translations$myToolsCatalog$duplicateFinder$zh duplicateFinder = _Translations$myToolsCatalog$duplicateFinder$zh._(_root);
	@override late final _Translations$myToolsCatalog$applicationPermissions$zh applicationPermissions = _Translations$myToolsCatalog$applicationPermissions$zh._(_root);
	@override late final _Translations$myToolsCatalog$systemJunk$zh systemJunk = _Translations$myToolsCatalog$systemJunk$zh._(_root);
	@override late final _Translations$myToolsCatalog$timeMachineSnapshot$zh timeMachineSnapshot = _Translations$myToolsCatalog$timeMachineSnapshot$zh._(_root);
	@override late final _Translations$myToolsCatalog$loginItems$zh loginItems = _Translations$myToolsCatalog$loginItems$zh._(_root);
	@override late final _Translations$myToolsCatalog$mailAttachments$zh mailAttachments = _Translations$myToolsCatalog$mailAttachments$zh._(_root);
	@override late final _Translations$myToolsCatalog$malwareFinder$zh malwareFinder = _Translations$myToolsCatalog$malwareFinder$zh._(_root);
	@override late final _Translations$myToolsCatalog$uninstaller$zh uninstaller = _Translations$myToolsCatalog$uninstaller$zh._(_root);
}

// Path: cleanupCategories
class _Translations$cleanupCategories$zh implements Translations$cleanupCategories$en {
	_Translations$cleanupCategories$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final _Translations$cleanupCategories$userCache$zh userCache = _Translations$cleanupCategories$userCache$zh._(_root);
	@override late final _Translations$cleanupCategories$userLogs$zh userLogs = _Translations$cleanupCategories$userLogs$zh._(_root);
	@override late final _Translations$cleanupCategories$languageFiles$zh languageFiles = _Translations$cleanupCategories$languageFiles$zh._(_root);
	@override late final _Translations$cleanupCategories$systemLogs$zh systemLogs = _Translations$cleanupCategories$systemLogs$zh._(_root);
	@override late final _Translations$cleanupCategories$brokenLoginItems$zh brokenLoginItems = _Translations$cleanupCategories$brokenLoginItems$zh._(_root);
}

// Path: myClutterDashboard
class _Translations$myClutterDashboard$zh implements Translations$myClutterDashboard$en {
	_Translations$myClutterDashboard$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get backToCategories => '返回类别';
	@override String get filesToSort => '您有 {count} 文件需要排序。';
	@override String get quickRecommendations => '使用快速建议或手动查看它们。';
	@override String get reviewAllFiles => '查看所有文件';
	@override String get freshDuplicatesFound => '{count} 发现新的重复项';
	@override String get noDuplicates => '本次扫描中未发现重复项。';
	@override String get removeDuplicateBytes => '删除 {bytes} 重复文件。';
	@override String get largeSimilarImagesFound => '{count} 找到大类似图像';
	@override String get noSimilarGroups => '未找到类似的图像组。';
	@override String get nearlyIdenticalImages => '有 {bytes} 个几乎相同的图像。';
	@override String get largeFilesFound => '找到 {bytes} 个大文件';
	@override String get noLargeFiles => '未找到大文件。';
	@override String get largeFilesReady => '{count} 大文件已准备好供审阅。';
	@override String get review => '审查';
}

// Path: scanResults
class _Translations$scanResults$zh implements Translations$scanResults$en {
	_Translations$scanResults$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get itemsSummary => '{count} 项目 • {size}';
	@override String get scannedInMs => '在 {ms} 毫秒内扫描';
	@override String get deselectAll => '取消全选';
	@override String get selectAll => '选择全部';
	@override String get noItemsMatchSearch => '没有符合您搜索条件的商品';
	@override String get noItemsFound => '没有找到物品';
	@override String get itemsSelected => '{count} 已选择项目';
	@override String get rescan => '重新扫描';
}

// Path: spaceViewStart
class _Translations$spaceViewStart$zh implements Translations$spaceViewStart$en {
	_Translations$spaceViewStart$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get subtitle => '选择一个父文件夹，然后扫描以映射占用空间最多的文件夹。';
	@override String get defaultRootPath => '默认根路径是您的主硬盘驱动器';
	@override String get exploreBubbles => '通过交互式气泡探索文件夹大小';
	@override String get clickToDrillDown => '单击文件夹进行深入分析并进行更深入的检查';
}

// Path: shell
class _Translations$shell$zh implements Translations$shell$en {
	_Translations$shell$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get comingSoon => '即将推出';
}

// Path: myToolsService
class _Translations$myToolsService$zh implements Translations$myToolsService$en {
	_Translations$myToolsService$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get snapshotName => '快照 {id}';
	@override String get timeMachineGroup => '时间机器';
	@override String get timeMachineMacOnly => 'Time Machine 快照仅在 macOS 上可用。';
}

// Path: sections.home
class _Translations$sections$home$zh implements Translations$sections$home$en {
	_Translations$sections$home$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '首页';
	@override String get subtitle => '一键获取系统的完整运行状况概览。';
	@override late final _Translations$sections$home$features$zh features = _Translations$sections$home$features$zh._(_root);
}

// Path: sections.cleanup
class _Translations$sections$cleanup$zh implements Translations$sections$cleanup$en {
	_Translations$sections$cleanup$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '垃圾清理';
	@override String get subtitle => '清理您的系统以实现\n最佳性能并回收更多可用空间。';
	@override late final _Translations$sections$cleanup$features$zh features = _Translations$sections$cleanup$features$zh._(_root);
}

// Path: sections.myClutter
class _Translations$sections$myClutter$zh implements Translations$sections$myClutter$en {
	_Translations$sections$myClutter$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '我的杂乱';
	@override String get subtitle => '只需点击几下，即可对文件进行排序并\n减少混乱。';
	@override late final _Translations$sections$myClutter$features$zh features = _Translations$sections$myClutter$features$zh._(_root);
}

// Path: sections.spaceView
class _Translations$sections$spaceView$zh implements Translations$sections$spaceView$en {
	_Translations$sections$spaceView$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '空间景观';
	@override String get subtitle => '可视化占用磁盘空间最多的\n并快速清理。';
	@override late final _Translations$sections$spaceView$features$zh features = _Translations$sections$spaceView$features$zh._(_root);
}

// Path: sections.applications
class _Translations$sections$applications$zh implements Translations$sections$applications$en {
	_Translations$sections$applications$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '应用领域';
	@override String get subtitle => '控制您的应用程序。\n卸载或删除旧的残留物。';
	@override late final _Translations$sections$applications$features$zh features = _Translations$sections$applications$features$zh._(_root);
}

// Path: sections.myTools
class _Translations$sections$myTools$zh implements Translations$sections$myTools$en {
	_Translations$sections$myTools$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '我的工具';
	@override String get subtitle => '您的系统保养和维护首选工具包。';
	@override late final _Translations$sections$myTools$features$zh features = _Translations$sections$myTools$features$zh._(_root);
}

// Path: myToolsMessages.fallback
class _Translations$myToolsMessages$fallback$zh implements Translations$myToolsMessages$fallback$en {
	_Translations$myToolsMessages$fallback$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get downloadsTidy => '下载很整齐。';
	@override String get noOversizedStale => '未发现过大的过时文件。';
	@override String get noRecentDuplicates => '没有发现最近的重复项。';
	@override String get noSimilarLargeImages => '未找到类似的大图像。';
	@override String get noAppLeftovers => '未发现可移动应用程序残留物。';
	@override String get noStaleApps => '未发现过时的应用程序。';
	@override String get appsNeedReview => '发现可能需要审查的应用程序。';
	@override String get noSystemJunkCandidates => '系统垃圾中没有清理候选者。';
	@override String get noBrokenStartup => '未找到损坏的启动/后台条目。';
	@override String get noBackgroundItems => '未找到背景项目。';
	@override String get noPrivacyTraces => '在已知地点未发现隐私痕迹。';
	@override String get trashAlreadyEmpty => '垃圾桶已经空了。';
	@override String get noPermissionCache => '未找到权限缓存文件。';
	@override String get noTimeMachineSnapshots => '未找到本地时间机器快照。';
	@override String get noMaintenanceCandidates => '未找到维护候选人。';
	@override String get noMailAttachments => '未找到可移动的邮件附件。';
	@override String get noSuspiciousFiles => '未检测到可疑文件。';
}

// Path: myToolsCatalog.appLeftovers
class _Translations$myToolsCatalog$appLeftovers$zh implements Translations$myToolsCatalog$appLeftovers$en {
	_Translations$myToolsCatalog$appLeftovers$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '应用程序剩菜';
	@override String get description => '即使主应用程序已经消失，也可以找到并删除应用程序剩余部分。';
}

// Path: myToolsCatalog.backgroundItems
class _Translations$myToolsCatalog$backgroundItems$zh implements Translations$myToolsCatalog$backgroundItems$en {
	_Translations$myToolsCatalog$backgroundItems$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '背景项目';
	@override String get description => '管理 Mac 上运行的后台应用程序和进程。';
}

// Path: myToolsCatalog.downloads
class _Translations$myToolsCatalog$downloads$zh implements Translations$myToolsCatalog$downloads$en {
	_Translations$myToolsCatalog$downloads$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '下载';
	@override String get description => '查看并清理下载中的一次性文件，以保持文件夹整洁。';
}

// Path: myToolsCatalog.largeOld
class _Translations$myToolsCatalog$largeOld$zh implements Translations$myToolsCatalog$largeOld$en {
	_Translations$myToolsCatalog$largeOld$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '大文件和旧文件';
	@override String get description => '查找并删除占用 Mac 空间的大型未使用文件。';
}

// Path: myToolsCatalog.similarImages
class _Translations$myToolsCatalog$similarImages$zh implements Translations$myToolsCatalog$similarImages$en {
	_Translations$myToolsCatalog$similarImages$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '类似图像';
	@override String get description => '查看类似的照片并只保留最好的照片。';
}

// Path: myToolsCatalog.trashBins
class _Translations$myToolsCatalog$trashBins$zh implements Translations$myToolsCatalog$trashBins$en {
	_Translations$myToolsCatalog$trashBins$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '垃圾桶';
	@override String get description => '清空 Mac 上所有可用的垃圾箱。';
}

// Path: myToolsCatalog.duplicateFinder
class _Translations$myToolsCatalog$duplicateFinder$zh implements Translations$myToolsCatalog$duplicateFinder$en {
	_Translations$myToolsCatalog$duplicateFinder$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '重复查找器';
	@override String get description => '删除存储在 Mac 上不同位置的重复文件。';
}

// Path: myToolsCatalog.applicationPermissions
class _Translations$myToolsCatalog$applicationPermissions$zh implements Translations$myToolsCatalog$applicationPermissions$en {
	_Translations$myToolsCatalog$applicationPermissions$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '应用程序权限';
	@override String get description => '管理应用程序访问系统特性、设备和功能的方式。';
}

// Path: myToolsCatalog.systemJunk
class _Translations$myToolsCatalog$systemJunk$zh implements Translations$myToolsCatalog$systemJunk$en {
	_Translations$myToolsCatalog$systemJunk$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '系统垃圾';
	@override String get description => '删除堵塞设备存储并妨碍最佳性能的冗余文件。';
}

// Path: myToolsCatalog.timeMachineSnapshot
class _Translations$myToolsCatalog$timeMachineSnapshot$zh implements Translations$myToolsCatalog$timeMachineSnapshot$en {
	_Translations$myToolsCatalog$timeMachineSnapshot$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '时间机器快照';
	@override String get description => '删除本地 Time Machine 快照而不影响您的备份。';
}

// Path: myToolsCatalog.loginItems
class _Translations$myToolsCatalog$loginItems$zh implements Translations$myToolsCatalog$loginItems$en {
	_Translations$myToolsCatalog$loginItems$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '登录项目';
	@override String get description => '管理启动 Mac 时自动打开的应用程序。';
}

// Path: myToolsCatalog.mailAttachments
class _Translations$myToolsCatalog$mailAttachments$zh implements Translations$myToolsCatalog$mailAttachments$en {
	_Translations$myToolsCatalog$mailAttachments$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '邮件附件';
	@override String get description => '删除本地存储的电子邮件附件以释放空间，同时保留修改的文件。';
}

// Path: myToolsCatalog.malwareFinder
class _Translations$myToolsCatalog$malwareFinder$zh implements Translations$myToolsCatalog$malwareFinder$en {
	_Translations$myToolsCatalog$malwareFinder$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '恶意软件查找器';
	@override String get description => '识别并删除恶意项目以确保您的 Mac 安全。';
}

// Path: myToolsCatalog.uninstaller
class _Translations$myToolsCatalog$uninstaller$zh implements Translations$myToolsCatalog$uninstaller$en {
	_Translations$myToolsCatalog$uninstaller$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '卸载程序';
	@override String get description => '正确删除整个应用程序及其所有相关文件。';
}

// Path: cleanupCategories.userCache
class _Translations$cleanupCategories$userCache$zh implements Translations$cleanupCategories$userCache$en {
	_Translations$cleanupCategories$userCache$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get name => '用户缓存文件';
	@override String get description => '最初的目的是缩短启动时间，但应用程序的缓存文件最终会累积并导致功能不正常或整体性能下降。';
}

// Path: cleanupCategories.userLogs
class _Translations$cleanupCategories$userLogs$zh implements Translations$cleanupCategories$userLogs$en {
	_Translations$cleanupCategories$userLogs$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get name => '用户日志文件';
	@override String get description => '日志文件由 macOS 及其应用程序创建，用于记录事件和错误。随着时间的推移，它们会变大并占据很大的空间。';
}

// Path: cleanupCategories.languageFiles
class _Translations$cleanupCategories$languageFiles$zh implements Translations$cleanupCategories$languageFiles$en {
	_Translations$cleanupCategories$languageFiles$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get name => '语言文件';
	@override String get description => '与应用程序捆绑在一起的未使用的本地化资源。删除不使用的语言可以释放存储空间，而不会影响功能。';
}

// Path: cleanupCategories.systemLogs
class _Translations$cleanupCategories$systemLogs$zh implements Translations$cleanupCategories$systemLogs$en {
	_Translations$cleanupCategories$systemLogs$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get name => '系统日志文件';
	@override String get description => '由 macOS 服务和守护程序写入的系统范围日志文件。这些文件可以安全删除，因为系统会在需要时重新创建它们。';
}

// Path: cleanupCategories.brokenLoginItems
class _Translations$cleanupCategories$brokenLoginItems$zh implements Translations$cleanupCategories$brokenLoginItems$en {
	_Translations$cleanupCategories$brokenLoginItems$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get name => '损坏的登录项目';
	@override String get description => '指向磁盘上不再存在的应用程序或文件的登录项。删除它们可以加快登录时间。';
}

// Path: sections.home.features
class _Translations$sections$home$features$zh implements Translations$sections$home$features$en {
	_Translations$sections$home$features$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get systemStatus => '系统状态';
	@override String get storageUsage => '存储使用情况';
	@override String get quickActions => '快速操作';
}

// Path: sections.cleanup.features
class _Translations$sections$cleanup$features$zh implements Translations$sections$cleanup$features$en {
	_Translations$sections$cleanup$features$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get systemJunk => '系统垃圾';
	@override String get userCache => '用户缓存';
	@override String get tempFiles => '临时文件';
}

// Path: sections.myClutter.features
class _Translations$sections$myClutter$features$zh implements Translations$sections$myClutter$features$en {
	_Translations$sections$myClutter$features$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get largeFiles => '大文件';
	@override String get duplicates => '重复项';
	@override String get largeSimilarImages => '大类似图像';
}

// Path: sections.spaceView.features
class _Translations$sections$spaceView$features$zh implements Translations$sections$spaceView$features$en {
	_Translations$sections$spaceView$features$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get visualStorageMap => '视觉存储图';
	@override String get largeFoldersOverview => '大文件夹概述';
	@override String get hiddenFilesUncovered => '发现隐藏文件';
}

// Path: sections.applications.features
class _Translations$sections$applications$features$zh implements Translations$sections$applications$features$en {
	_Translations$sections$applications$features$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get appUninstaller => '应用程序卸载程序';
	@override String get largeApps => '大型应用程序';
	@override String get fileLeftovers => '文件剩菜';
}

// Path: sections.myTools.features
class _Translations$sections$myTools$features$zh implements Translations$sections$myTools$features$en {
	_Translations$sections$myTools$features$zh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get targetedScanners => '目标扫描仪';
	@override String get quickActions => '快速行动';
	@override String get liveFiltering => '实时过滤';
}

/// The flat map containing all translations for locale <zh>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZh {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'PristineCleaner',
			'language.label' => '语言',
			'language.english' => '英语',
			'language.spanish' => '西班牙语',
			'language.italian' => '意大利语',
			'language.french' => '法语',
			'language.hebrew' => '希伯来语',
			'language.greek' => '希腊语',
			'language.portuguese' => '葡萄牙语',
			'language.mandarin' => 'Mandarin',
			'navigation.home' => '首页',
			'navigation.cleanup' => '清理',
			'navigation.myClutter' => '我的杂乱',
			'navigation.spaceView' => '空间景观',
			'navigation.applications' => '应用领域',
			'navigation.myTools' => '我的工具',
			'navigation.donate' => '捐赠',
			'sections.home.title' => '首页',
			'sections.home.subtitle' => '一键获取系统的完整运行状况概览。',
			'sections.home.features.systemStatus' => '系统状态',
			'sections.home.features.storageUsage' => '存储使用情况',
			'sections.home.features.quickActions' => '快速操作',
			'sections.cleanup.title' => '垃圾清理',
			'sections.cleanup.subtitle' => '清理您的系统以实现\n最佳性能并回收更多可用空间。',
			'sections.cleanup.features.systemJunk' => '系统垃圾',
			'sections.cleanup.features.userCache' => '用户缓存',
			'sections.cleanup.features.tempFiles' => '临时文件',
			'sections.myClutter.title' => '我的杂乱',
			'sections.myClutter.subtitle' => '只需点击几下，即可对文件进行排序并\n减少混乱。',
			'sections.myClutter.features.largeFiles' => '大文件',
			'sections.myClutter.features.duplicates' => '重复项',
			'sections.myClutter.features.largeSimilarImages' => '大类似图像',
			'sections.spaceView.title' => '空间景观',
			'sections.spaceView.subtitle' => '可视化占用磁盘空间最多的\n并快速清理。',
			'sections.spaceView.features.visualStorageMap' => '视觉存储图',
			'sections.spaceView.features.largeFoldersOverview' => '大文件夹概述',
			'sections.spaceView.features.hiddenFilesUncovered' => '发现隐藏文件',
			'sections.applications.title' => '应用领域',
			'sections.applications.subtitle' => '控制您的应用程序。\n卸载或删除旧的残留物。',
			'sections.applications.features.appUninstaller' => '应用程序卸载程序',
			'sections.applications.features.largeApps' => '大型应用程序',
			'sections.applications.features.fileLeftovers' => '文件剩菜',
			'sections.myTools.title' => '我的工具',
			'sections.myTools.subtitle' => '您的系统保养和维护首选工具包。',
			'sections.myTools.features.targetedScanners' => '目标扫描仪',
			'sections.myTools.features.quickActions' => '快速行动',
			'sections.myTools.features.liveFiltering' => '实时过滤',
			'progress.countingFiles' => '正在计算文件...',
			'progress.countingApplications' => '正在计算应用程序...',
			'progress.countingFolders' => '正在计算文件夹...',
			'errors.itemsFailedToRemove' => '{count} 项无法删除。',
			'buttons.scan' => '扫描',
			'buttons.stop' => '停止',
			'buttons.done' => '完毕',
			'buttons.clean' => '干净的',
			'buttons.cleanUp' => '清理',
			'buttons.close' => '关闭',
			'buttons.refresh' => '刷新',
			'buttons.rescan' => '重新扫描',
			'buttons.startOver' => '重新开始',
			'buttons.selectAll' => '选择全部',
			'buttons.clearSelection' => '清除选择',
			'buttons.keepScanning' => '继续扫描',
			'buttons.keepRemoving' => '继续删除',
			'tooltips.search' => '搜索',
			'tooltips.openInFinder' => '在 Finder 中打开',
			'dialogs.stopScanningTitle' => '停止扫描？',
			'dialogs.stopScanningMessage' => '这将取消当前扫描并放弃任何部分进度。',
			'dialogs.stopRemovalTitle' => '停止移除？',
			'dialogs.stopRemovalMessage' => '当前文件将完成，然后剩余的文件将被跳过。',
			'removal.barrierLabel' => '拆除进度',
			'removal.preparing' => '正在准备...',
			'removal.removingFrom' => '从 {title} 中删除',
			'removal.stoppingAfterCurrentFile' => '在当前文件后停止...',
			'removal.keepWindowOpen' => '删除运行时请保持此窗口打开。',
			'removal.processedSummary' => '已处理 {total} 的 {processed}',
			'removal.deletedFreed' => '{deleted} 已删除 • {bytes} 已释放',
			'removal.currentItem' => '当前： {name}',
			'removal.stopping' => '停止...',
			'removal.removalFailed' => '删除失败',
			'removal.removalFailedDetails' => '删除所选文件时出现问题。',
			'removal.removalStopped' => '移除已停止',
			'removal.removalComplete' => '拆除完成',
			'removal.deletedSummary' => '{title} 删除了 {count} 项',
			'removal.freedSummary' => '{bytes} 已释放',
			'removal.failedToRemoveSummary' => '{count} 项无法删除。',
			'removal.deletedFiles' => '已删除的文件',
			'removal.noFilesDeleted' => '没有文件被删除。',
			'done.allCleanedTitle' => '全部清理干净了！',
			'done.movedToTrashMessage' => '选定的文件已移至废纸篓。',
			'done.applicationsRemovedTitle' => '应用程序已删除！',
			'done.appsMovedToTrashMessage' => '选定的应用程序已移至垃圾箱。',
			'donate.title' => '支持 PristineCleaner',
			'donate.subtitle' => '如果 PristineCleaner 能帮助您保持系统整洁，欢迎通过小额捐赠支持开发。',
			'donate.buyMeACoffee' => 'Buy Me a Coffee',
			'donate.paypalDonate' => '通过 PayPal 捐赠',
			'donate.openLinkFailed' => '无法打开捐赠链接。',
			'cleanupManager.title' => '清理经理',
			'cleanupManager.systemJunkHeader' => '系统垃圾',
			'cleanupManager.systemJunkDescription' => '冗余文件会堵塞设备存储并妨碍最佳性能。',
			'cleanupManager.selectLabel' => '选择',
			'cleanupManager.selectAllOption' => '全部',
			'cleanupManager.selectNoneOption' => '没有任何',
			'cleanupManager.noItems' => '没有商品',
			'cleanupManager.noItemsFound' => '没有找到物品',
			'cleanupManager.itemsSelected' => '{count} 已选择项目',
			'projectDirectory.chooseFolder' => '选择文件夹...',
			'projectDirectory.chooseProjectDirectory' => '选择项目目录',
			'projectDirectory.chooseParentFolder' => '选择父文件夹',
			'projectDirectory.noFolder' => '无文件夹',
			'searchAndSort.searchHint' => '搜索...',
			'searchAndSort.sortBy' => '排序方式',
			'searchAndSort.size' => '尺寸',
			'searchAndSort.name' => '姓名',
			'searchAndSort.ascending' => '升序',
			'searchAndSort.descending' => '降序',
			'spaceView.noFoldersFound' => '找不到该级别的文件夹',
			'spaceView.noBubblesToRender' => '没有气泡可渲染',
			'spaceView.otherItems' => '其他项目',
			'home.refresh' => '刷新',
			'home.unableToReadDiskInfo' => '无法读取磁盘信息',
			'home.totalStorage' => '总存储空间',
			'home.used' => '已使用',
			'home.available' => '可用',
			'home.percentUsed' => '{percent}% 已使用',
			'home.cpuUsage' => 'CPU 使用率',
			'home.ramUsage' => '内存使用率',
			'home.memoryPercentUsed' => '内存已使用 {percent}%',
			'home.unableToReadSystemInfo' => '无法读取系统信息',
			'myToolsPage.title' => '我的工具',
			'myToolsPage.subtitle' => '让您的 Mac 保持清洁、安全和平稳运行的首选工具。',
			'myToolsPage.backToTools' => '返回工具',
			'myToolsMessages.itemsWithSize' => '{count} 项目 • {size}',
			'myToolsMessages.scanCancelled' => '扫描被取消。',
			'myToolsMessages.selectAtLeastOne' => '至少选择一项要清洁的物品。',
			'myToolsMessages.failedToClean' => '无法清理 {count} 项。',
			'myToolsMessages.everythingSelectedCleaned' => '所有选择的东西都​​被清理干净了。',
			'myToolsMessages.cleanupUpdated' => '清理已更新。',
			'myToolsMessages.cleanedCount' => '已清洁 {count} 件物品。',
			'myToolsMessages.stoppedPrefix' => '停了。',
			'myToolsMessages.removedCount' => '删除了 {count} 项。',
			'myToolsMessages.failedCountShort' => '{count} 失败。',
			'myToolsMessages.scanComplete' => '扫描完成。',
			'myToolsMessages.somethingWentWrong' => '出了点问题。',
			'myToolsMessages.fallback.downloadsTidy' => '下载很整齐。',
			'myToolsMessages.fallback.noOversizedStale' => '未发现过大的过时文件。',
			'myToolsMessages.fallback.noRecentDuplicates' => '没有发现最近的重复项。',
			'myToolsMessages.fallback.noSimilarLargeImages' => '未找到类似的大图像。',
			'myToolsMessages.fallback.noAppLeftovers' => '未发现可移动应用程序残留物。',
			'myToolsMessages.fallback.noStaleApps' => '未发现过时的应用程序。',
			'myToolsMessages.fallback.appsNeedReview' => '发现可能需要审查的应用程序。',
			'myToolsMessages.fallback.noSystemJunkCandidates' => '系统垃圾中没有清理候选者。',
			'myToolsMessages.fallback.noBrokenStartup' => '未找到损坏的启动/后台条目。',
			'myToolsMessages.fallback.noBackgroundItems' => '未找到背景项目。',
			'myToolsMessages.fallback.noPrivacyTraces' => '在已知地点未发现隐私痕迹。',
			'myToolsMessages.fallback.trashAlreadyEmpty' => '垃圾桶已经空了。',
			'myToolsMessages.fallback.noPermissionCache' => '未找到权限缓存文件。',
			'myToolsMessages.fallback.noTimeMachineSnapshots' => '未找到本地时间机器快照。',
			'myToolsMessages.fallback.noMaintenanceCandidates' => '未找到维护候选人。',
			'myToolsMessages.fallback.noMailAttachments' => '未找到可移动的邮件附件。',
			'myToolsMessages.fallback.noSuspiciousFiles' => '未检测到可疑文件。',
			'myToolsCatalog.appLeftovers.title' => '应用程序剩菜',
			'myToolsCatalog.appLeftovers.description' => '即使主应用程序已经消失，也可以找到并删除应用程序剩余部分。',
			'myToolsCatalog.backgroundItems.title' => '背景项目',
			'myToolsCatalog.backgroundItems.description' => '管理 Mac 上运行的后台应用程序和进程。',
			'myToolsCatalog.downloads.title' => '下载',
			'myToolsCatalog.downloads.description' => '查看并清理下载中的一次性文件，以保持文件夹整洁。',
			'myToolsCatalog.largeOld.title' => '大文件和旧文件',
			'myToolsCatalog.largeOld.description' => '查找并删除占用 Mac 空间的大型未使用文件。',
			'myToolsCatalog.similarImages.title' => '类似图像',
			'myToolsCatalog.similarImages.description' => '查看类似的照片并只保留最好的照片。',
			'myToolsCatalog.trashBins.title' => '垃圾桶',
			'myToolsCatalog.trashBins.description' => '清空 Mac 上所有可用的垃圾箱。',
			'myToolsCatalog.duplicateFinder.title' => '重复查找器',
			'myToolsCatalog.duplicateFinder.description' => '删除存储在 Mac 上不同位置的重复文件。',
			'myToolsCatalog.applicationPermissions.title' => '应用程序权限',
			'myToolsCatalog.applicationPermissions.description' => '管理应用程序访问系统特性、设备和功能的方式。',
			'myToolsCatalog.systemJunk.title' => '系统垃圾',
			'myToolsCatalog.systemJunk.description' => '删除堵塞设备存储并妨碍最佳性能的冗余文件。',
			'myToolsCatalog.timeMachineSnapshot.title' => '时间机器快照',
			'myToolsCatalog.timeMachineSnapshot.description' => '删除本地 Time Machine 快照而不影响您的备份。',
			'myToolsCatalog.loginItems.title' => '登录项目',
			'myToolsCatalog.loginItems.description' => '管理启动 Mac 时自动打开的应用程序。',
			'myToolsCatalog.mailAttachments.title' => '邮件附件',
			'myToolsCatalog.mailAttachments.description' => '删除本地存储的电子邮件附件以释放空间，同时保留修改的文件。',
			'myToolsCatalog.malwareFinder.title' => '恶意软件查找器',
			'myToolsCatalog.malwareFinder.description' => '识别并删除恶意项目以确保您的 Mac 安全。',
			'myToolsCatalog.uninstaller.title' => '卸载程序',
			'myToolsCatalog.uninstaller.description' => '正确删除整个应用程序及其所有相关文件。',
			'cleanupCategories.userCache.name' => '用户缓存文件',
			'cleanupCategories.userCache.description' => '最初的目的是缩短启动时间，但应用程序的缓存文件最终会累积并导致功能不正常或整体性能下降。',
			'cleanupCategories.userLogs.name' => '用户日志文件',
			'cleanupCategories.userLogs.description' => '日志文件由 macOS 及其应用程序创建，用于记录事件和错误。随着时间的推移，它们会变大并占据很大的空间。',
			'cleanupCategories.languageFiles.name' => '语言文件',
			'cleanupCategories.languageFiles.description' => '与应用程序捆绑在一起的未使用的本地化资源。删除不使用的语言可以释放存储空间，而不会影响功能。',
			'cleanupCategories.systemLogs.name' => '系统日志文件',
			'cleanupCategories.systemLogs.description' => '由 macOS 服务和守护程序写入的系统范围日志文件。这些文件可以安全删除，因为系统会在需要时重新创建它们。',
			'cleanupCategories.brokenLoginItems.name' => '损坏的登录项目',
			'cleanupCategories.brokenLoginItems.description' => '指向磁盘上不再存在的应用程序或文件的登录项。删除它们可以加快登录时间。',
			'myClutterDashboard.backToCategories' => '返回类别',
			'myClutterDashboard.filesToSort' => '您有 {count} 文件需要排序。',
			'myClutterDashboard.quickRecommendations' => '使用快速建议或手动查看它们。',
			'myClutterDashboard.reviewAllFiles' => '查看所有文件',
			'myClutterDashboard.freshDuplicatesFound' => '{count} 发现新的重复项',
			'myClutterDashboard.noDuplicates' => '本次扫描中未发现重复项。',
			'myClutterDashboard.removeDuplicateBytes' => '删除 {bytes} 重复文件。',
			'myClutterDashboard.largeSimilarImagesFound' => '{count} 找到大类似图像',
			'myClutterDashboard.noSimilarGroups' => '未找到类似的图像组。',
			'myClutterDashboard.nearlyIdenticalImages' => '有 {bytes} 个几乎相同的图像。',
			'myClutterDashboard.largeFilesFound' => '找到 {bytes} 个大文件',
			'myClutterDashboard.noLargeFiles' => '未找到大文件。',
			'myClutterDashboard.largeFilesReady' => '{count} 大文件已准备好供审阅。',
			'myClutterDashboard.review' => '审查',
			'scanResults.itemsSummary' => '{count} 项目 • {size}',
			'scanResults.scannedInMs' => '在 {ms} 毫秒内扫描',
			'scanResults.deselectAll' => '取消全选',
			'scanResults.selectAll' => '选择全部',
			'scanResults.noItemsMatchSearch' => '没有符合您搜索条件的商品',
			'scanResults.noItemsFound' => '没有找到物品',
			'scanResults.itemsSelected' => '{count} 已选择项目',
			'scanResults.rescan' => '重新扫描',
			'spaceViewStart.subtitle' => '选择一个父文件夹，然后扫描以映射占用空间最多的文件夹。',
			'spaceViewStart.defaultRootPath' => '默认根路径是您的主硬盘驱动器',
			'spaceViewStart.exploreBubbles' => '通过交互式气泡探索文件夹大小',
			'spaceViewStart.clickToDrillDown' => '单击文件夹进行深入分析并进行更深入的检查',
			'shell.comingSoon' => '即将推出',
			'myToolsService.snapshotName' => '快照 {id}',
			'myToolsService.timeMachineGroup' => '时间机器',
			'myToolsService.timeMachineMacOnly' => 'Time Machine 快照仅在 macOS 上可用。',
			_ => null,
		};
	}
}
