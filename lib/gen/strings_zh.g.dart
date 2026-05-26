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
	@override late final _TranslationsAppZh app = _TranslationsAppZh._(_root);
	@override late final _TranslationsLanguageZh language = _TranslationsLanguageZh._(_root);
	@override late final _TranslationsNavigationZh navigation = _TranslationsNavigationZh._(_root);
	@override late final _TranslationsSectionsZh sections = _TranslationsSectionsZh._(_root);
	@override late final _TranslationsProgressZh progress = _TranslationsProgressZh._(_root);
	@override late final _TranslationsErrorsZh errors = _TranslationsErrorsZh._(_root);
	@override late final _TranslationsButtonsZh buttons = _TranslationsButtonsZh._(_root);
	@override late final _TranslationsTooltipsZh tooltips = _TranslationsTooltipsZh._(_root);
	@override late final _TranslationsDialogsZh dialogs = _TranslationsDialogsZh._(_root);
	@override late final _TranslationsRemovalZh removal = _TranslationsRemovalZh._(_root);
	@override late final _TranslationsDoneZh done = _TranslationsDoneZh._(_root);
	@override late final _TranslationsDonateZh donate = _TranslationsDonateZh._(_root);
	@override late final _TranslationsCleanupManagerZh cleanupManager = _TranslationsCleanupManagerZh._(_root);
	@override late final _TranslationsProjectDirectoryZh projectDirectory = _TranslationsProjectDirectoryZh._(_root);
	@override late final _TranslationsSearchAndSortZh searchAndSort = _TranslationsSearchAndSortZh._(_root);
	@override late final _TranslationsSpaceViewZh spaceView = _TranslationsSpaceViewZh._(_root);
	@override late final _TranslationsHomeZh home = _TranslationsHomeZh._(_root);
	@override late final _TranslationsMyToolsPageZh myToolsPage = _TranslationsMyToolsPageZh._(_root);
	@override late final _TranslationsMyToolsMessagesZh myToolsMessages = _TranslationsMyToolsMessagesZh._(_root);
	@override late final _TranslationsMyToolsCatalogZh myToolsCatalog = _TranslationsMyToolsCatalogZh._(_root);
	@override late final _TranslationsCleanupCategoriesZh cleanupCategories = _TranslationsCleanupCategoriesZh._(_root);
	@override late final _TranslationsMyClutterDashboardZh myClutterDashboard = _TranslationsMyClutterDashboardZh._(_root);
	@override late final _TranslationsScanResultsZh scanResults = _TranslationsScanResultsZh._(_root);
	@override late final _TranslationsSpaceViewStartZh spaceViewStart = _TranslationsSpaceViewStartZh._(_root);
	@override late final _TranslationsShellZh shell = _TranslationsShellZh._(_root);
	@override late final _TranslationsMyToolsServiceZh myToolsService = _TranslationsMyToolsServiceZh._(_root);
}

// Path: app
class _TranslationsAppZh implements TranslationsAppEn {
	_TranslationsAppZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => 'PristineCleaner';
}

// Path: language
class _TranslationsLanguageZh implements TranslationsLanguageEn {
	_TranslationsLanguageZh._(this._root);

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
class _TranslationsNavigationZh implements TranslationsNavigationEn {
	_TranslationsNavigationZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get home => '首页';
	@override String get cleanup => '清理';
	@override String get myClutter => '我的杂乱';
	@override String get spaceView => '空间景观';
	@override String get applications => '应用领域';
	@override String get myTools => '我的工具';
	@override String get myActivity => '我的活动';
	@override String get donate => '捐赠';
}

// Path: sections
class _TranslationsSectionsZh implements TranslationsSectionsEn {
	_TranslationsSectionsZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSectionsHomeZh home = _TranslationsSectionsHomeZh._(_root);
	@override late final _TranslationsSectionsCleanupZh cleanup = _TranslationsSectionsCleanupZh._(_root);
	@override late final _TranslationsSectionsMyClutterZh myClutter = _TranslationsSectionsMyClutterZh._(_root);
	@override late final _TranslationsSectionsSpaceViewZh spaceView = _TranslationsSectionsSpaceViewZh._(_root);
	@override late final _TranslationsSectionsApplicationsZh applications = _TranslationsSectionsApplicationsZh._(_root);
	@override late final _TranslationsSectionsMyToolsZh myTools = _TranslationsSectionsMyToolsZh._(_root);
}

// Path: progress
class _TranslationsProgressZh implements TranslationsProgressEn {
	_TranslationsProgressZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get countingFiles => '正在计算文件...';
	@override String get countingApplications => '正在计算应用程序...';
	@override String get countingFolders => '正在计算文件夹...';
}

// Path: errors
class _TranslationsErrorsZh implements TranslationsErrorsEn {
	_TranslationsErrorsZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get itemsFailedToRemove => '{count} 项无法删除。';
}

// Path: buttons
class _TranslationsButtonsZh implements TranslationsButtonsEn {
	_TranslationsButtonsZh._(this._root);

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
class _TranslationsTooltipsZh implements TranslationsTooltipsEn {
	_TranslationsTooltipsZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get search => '搜索';
	@override String get openInFinder => '在 Finder 中打开';
}

// Path: dialogs
class _TranslationsDialogsZh implements TranslationsDialogsEn {
	_TranslationsDialogsZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get stopScanningTitle => '停止扫描？';
	@override String get stopScanningMessage => '这将取消当前扫描并放弃任何部分进度。';
	@override String get stopRemovalTitle => '停止移除？';
	@override String get stopRemovalMessage => '当前文件将完成，然后剩余的文件将被跳过。';
}

// Path: removal
class _TranslationsRemovalZh implements TranslationsRemovalEn {
	_TranslationsRemovalZh._(this._root);

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
class _TranslationsDoneZh implements TranslationsDoneEn {
	_TranslationsDoneZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get allCleanedTitle => '全部清理干净了！';
	@override String get movedToTrashMessage => '选定的文件已移至废纸篓。';
	@override String get applicationsRemovedTitle => '应用程序已删除！';
	@override String get appsMovedToTrashMessage => '选定的应用程序已移至垃圾箱。';
}

// Path: donate
class _TranslationsDonateZh implements TranslationsDonateEn {
	_TranslationsDonateZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '支持 PristineCleaner';
	@override String get subtitle => '如果 PristineCleaner 能帮助您保持系统整洁，欢迎通过小额捐赠支持开发。';
	@override String get buyMeACoffee => 'Buy Me a Coffee';
	@override String get paypalDonate => '通过 PayPal 捐赠';
	@override String get openLinkFailed => '无法打开捐赠链接。';
}

// Path: cleanupManager
class _TranslationsCleanupManagerZh implements TranslationsCleanupManagerEn {
	_TranslationsCleanupManagerZh._(this._root);

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
class _TranslationsProjectDirectoryZh implements TranslationsProjectDirectoryEn {
	_TranslationsProjectDirectoryZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get chooseFolder => '选择文件夹...';
	@override String get chooseProjectDirectory => '选择项目目录';
	@override String get chooseParentFolder => '选择父文件夹';
	@override String get noFolder => '无文件夹';
}

// Path: searchAndSort
class _TranslationsSearchAndSortZh implements TranslationsSearchAndSortEn {
	_TranslationsSearchAndSortZh._(this._root);

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
class _TranslationsSpaceViewZh implements TranslationsSpaceViewEn {
	_TranslationsSpaceViewZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get noFoldersFound => '找不到该级别的文件夹';
	@override String get noBubblesToRender => '没有气泡可渲染';
	@override String get otherItems => '其他项目';
}

// Path: home
class _TranslationsHomeZh implements TranslationsHomeEn {
	_TranslationsHomeZh._(this._root);

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
class _TranslationsMyToolsPageZh implements TranslationsMyToolsPageEn {
	_TranslationsMyToolsPageZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '我的工具';
	@override String get subtitle => '让您的 Mac 保持清洁、安全和平稳运行的首选工具。';
	@override String get backToTools => '返回工具';
}

// Path: myToolsMessages
class _TranslationsMyToolsMessagesZh implements TranslationsMyToolsMessagesEn {
	_TranslationsMyToolsMessagesZh._(this._root);

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
	@override late final _TranslationsMyToolsMessagesFallbackZh fallback = _TranslationsMyToolsMessagesFallbackZh._(_root);
}

// Path: myToolsCatalog
class _TranslationsMyToolsCatalogZh implements TranslationsMyToolsCatalogEn {
	_TranslationsMyToolsCatalogZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMyToolsCatalogAppLeftoversZh appLeftovers = _TranslationsMyToolsCatalogAppLeftoversZh._(_root);
	@override late final _TranslationsMyToolsCatalogBackgroundItemsZh backgroundItems = _TranslationsMyToolsCatalogBackgroundItemsZh._(_root);
	@override late final _TranslationsMyToolsCatalogDownloadsZh downloads = _TranslationsMyToolsCatalogDownloadsZh._(_root);
	@override late final _TranslationsMyToolsCatalogLargeOldZh largeOld = _TranslationsMyToolsCatalogLargeOldZh._(_root);
	@override late final _TranslationsMyToolsCatalogSimilarImagesZh similarImages = _TranslationsMyToolsCatalogSimilarImagesZh._(_root);
	@override late final _TranslationsMyToolsCatalogTrashBinsZh trashBins = _TranslationsMyToolsCatalogTrashBinsZh._(_root);
	@override late final _TranslationsMyToolsCatalogDuplicateFinderZh duplicateFinder = _TranslationsMyToolsCatalogDuplicateFinderZh._(_root);
	@override late final _TranslationsMyToolsCatalogApplicationPermissionsZh applicationPermissions = _TranslationsMyToolsCatalogApplicationPermissionsZh._(_root);
	@override late final _TranslationsMyToolsCatalogSystemJunkZh systemJunk = _TranslationsMyToolsCatalogSystemJunkZh._(_root);
	@override late final _TranslationsMyToolsCatalogTimeMachineSnapshotZh timeMachineSnapshot = _TranslationsMyToolsCatalogTimeMachineSnapshotZh._(_root);
	@override late final _TranslationsMyToolsCatalogLoginItemsZh loginItems = _TranslationsMyToolsCatalogLoginItemsZh._(_root);
	@override late final _TranslationsMyToolsCatalogMailAttachmentsZh mailAttachments = _TranslationsMyToolsCatalogMailAttachmentsZh._(_root);
	@override late final _TranslationsMyToolsCatalogMalwareFinderZh malwareFinder = _TranslationsMyToolsCatalogMalwareFinderZh._(_root);
	@override late final _TranslationsMyToolsCatalogUninstallerZh uninstaller = _TranslationsMyToolsCatalogUninstallerZh._(_root);
}

// Path: cleanupCategories
class _TranslationsCleanupCategoriesZh implements TranslationsCleanupCategoriesEn {
	_TranslationsCleanupCategoriesZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsCleanupCategoriesUserCacheZh userCache = _TranslationsCleanupCategoriesUserCacheZh._(_root);
	@override late final _TranslationsCleanupCategoriesUserLogsZh userLogs = _TranslationsCleanupCategoriesUserLogsZh._(_root);
	@override late final _TranslationsCleanupCategoriesLanguageFilesZh languageFiles = _TranslationsCleanupCategoriesLanguageFilesZh._(_root);
	@override late final _TranslationsCleanupCategoriesSystemLogsZh systemLogs = _TranslationsCleanupCategoriesSystemLogsZh._(_root);
	@override late final _TranslationsCleanupCategoriesBrokenLoginItemsZh brokenLoginItems = _TranslationsCleanupCategoriesBrokenLoginItemsZh._(_root);
}

// Path: myClutterDashboard
class _TranslationsMyClutterDashboardZh implements TranslationsMyClutterDashboardEn {
	_TranslationsMyClutterDashboardZh._(this._root);

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
class _TranslationsScanResultsZh implements TranslationsScanResultsEn {
	_TranslationsScanResultsZh._(this._root);

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
class _TranslationsSpaceViewStartZh implements TranslationsSpaceViewStartEn {
	_TranslationsSpaceViewStartZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get subtitle => '选择一个父文件夹，然后扫描以映射占用空间最多的文件夹。';
	@override String get defaultRootPath => '默认根路径是您的主硬盘驱动器';
	@override String get exploreBubbles => '通过交互式气泡探索文件夹大小';
	@override String get clickToDrillDown => '单击文件夹进行深入分析并进行更深入的检查';
}

// Path: shell
class _TranslationsShellZh implements TranslationsShellEn {
	_TranslationsShellZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get comingSoon => '即将推出';
}

// Path: myToolsService
class _TranslationsMyToolsServiceZh implements TranslationsMyToolsServiceEn {
	_TranslationsMyToolsServiceZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get snapshotName => '快照 {id}';
	@override String get timeMachineGroup => '时间机器';
	@override String get timeMachineMacOnly => 'Time Machine 快照仅在 macOS 上可用。';
}

// Path: sections.home
class _TranslationsSectionsHomeZh implements TranslationsSectionsHomeEn {
	_TranslationsSectionsHomeZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '首页';
	@override String get subtitle => '一键获取系统的完整运行状况概览。';
	@override late final _TranslationsSectionsHomeFeaturesZh features = _TranslationsSectionsHomeFeaturesZh._(_root);
}

// Path: sections.cleanup
class _TranslationsSectionsCleanupZh implements TranslationsSectionsCleanupEn {
	_TranslationsSectionsCleanupZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '垃圾清理';
	@override String get subtitle => '清理您的系统以实现\n最佳性能并回收更多可用空间。';
	@override late final _TranslationsSectionsCleanupFeaturesZh features = _TranslationsSectionsCleanupFeaturesZh._(_root);
}

// Path: sections.myClutter
class _TranslationsSectionsMyClutterZh implements TranslationsSectionsMyClutterEn {
	_TranslationsSectionsMyClutterZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '我的杂乱';
	@override String get subtitle => '只需点击几下，即可对文件进行排序并\n减少混乱。';
	@override late final _TranslationsSectionsMyClutterFeaturesZh features = _TranslationsSectionsMyClutterFeaturesZh._(_root);
}

// Path: sections.spaceView
class _TranslationsSectionsSpaceViewZh implements TranslationsSectionsSpaceViewEn {
	_TranslationsSectionsSpaceViewZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '空间景观';
	@override String get subtitle => '可视化占用磁盘空间最多的\n并快速清理。';
	@override late final _TranslationsSectionsSpaceViewFeaturesZh features = _TranslationsSectionsSpaceViewFeaturesZh._(_root);
}

// Path: sections.applications
class _TranslationsSectionsApplicationsZh implements TranslationsSectionsApplicationsEn {
	_TranslationsSectionsApplicationsZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '应用领域';
	@override String get subtitle => '控制您的应用程序。\n卸载或删除旧的残留物。';
	@override late final _TranslationsSectionsApplicationsFeaturesZh features = _TranslationsSectionsApplicationsFeaturesZh._(_root);
}

// Path: sections.myTools
class _TranslationsSectionsMyToolsZh implements TranslationsSectionsMyToolsEn {
	_TranslationsSectionsMyToolsZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '我的工具';
	@override String get subtitle => '您的系统保养和维护首选工具包。';
	@override late final _TranslationsSectionsMyToolsFeaturesZh features = _TranslationsSectionsMyToolsFeaturesZh._(_root);
}

// Path: myToolsMessages.fallback
class _TranslationsMyToolsMessagesFallbackZh implements TranslationsMyToolsMessagesFallbackEn {
	_TranslationsMyToolsMessagesFallbackZh._(this._root);

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
class _TranslationsMyToolsCatalogAppLeftoversZh implements TranslationsMyToolsCatalogAppLeftoversEn {
	_TranslationsMyToolsCatalogAppLeftoversZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '应用程序剩菜';
	@override String get description => '即使主应用程序已经消失，也可以找到并删除应用程序剩余部分。';
}

// Path: myToolsCatalog.backgroundItems
class _TranslationsMyToolsCatalogBackgroundItemsZh implements TranslationsMyToolsCatalogBackgroundItemsEn {
	_TranslationsMyToolsCatalogBackgroundItemsZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '背景项目';
	@override String get description => '管理 Mac 上运行的后台应用程序和进程。';
}

// Path: myToolsCatalog.downloads
class _TranslationsMyToolsCatalogDownloadsZh implements TranslationsMyToolsCatalogDownloadsEn {
	_TranslationsMyToolsCatalogDownloadsZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '下载';
	@override String get description => '查看并清理下载中的一次性文件，以保持文件夹整洁。';
}

// Path: myToolsCatalog.largeOld
class _TranslationsMyToolsCatalogLargeOldZh implements TranslationsMyToolsCatalogLargeOldEn {
	_TranslationsMyToolsCatalogLargeOldZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '大文件和旧文件';
	@override String get description => '查找并删除占用 Mac 空间的大型未使用文件。';
}

// Path: myToolsCatalog.similarImages
class _TranslationsMyToolsCatalogSimilarImagesZh implements TranslationsMyToolsCatalogSimilarImagesEn {
	_TranslationsMyToolsCatalogSimilarImagesZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '类似图像';
	@override String get description => '查看类似的照片并只保留最好的照片。';
}

// Path: myToolsCatalog.trashBins
class _TranslationsMyToolsCatalogTrashBinsZh implements TranslationsMyToolsCatalogTrashBinsEn {
	_TranslationsMyToolsCatalogTrashBinsZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '垃圾桶';
	@override String get description => '清空 Mac 上所有可用的垃圾箱。';
}

// Path: myToolsCatalog.duplicateFinder
class _TranslationsMyToolsCatalogDuplicateFinderZh implements TranslationsMyToolsCatalogDuplicateFinderEn {
	_TranslationsMyToolsCatalogDuplicateFinderZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '重复查找器';
	@override String get description => '删除存储在 Mac 上不同位置的重复文件。';
}

// Path: myToolsCatalog.applicationPermissions
class _TranslationsMyToolsCatalogApplicationPermissionsZh implements TranslationsMyToolsCatalogApplicationPermissionsEn {
	_TranslationsMyToolsCatalogApplicationPermissionsZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '应用程序权限';
	@override String get description => '管理应用程序访问系统特性、设备和功能的方式。';
}

// Path: myToolsCatalog.systemJunk
class _TranslationsMyToolsCatalogSystemJunkZh implements TranslationsMyToolsCatalogSystemJunkEn {
	_TranslationsMyToolsCatalogSystemJunkZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '系统垃圾';
	@override String get description => '删除堵塞设备存储并妨碍最佳性能的冗余文件。';
}

// Path: myToolsCatalog.timeMachineSnapshot
class _TranslationsMyToolsCatalogTimeMachineSnapshotZh implements TranslationsMyToolsCatalogTimeMachineSnapshotEn {
	_TranslationsMyToolsCatalogTimeMachineSnapshotZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '时间机器快照';
	@override String get description => '删除本地 Time Machine 快照而不影响您的备份。';
}

// Path: myToolsCatalog.loginItems
class _TranslationsMyToolsCatalogLoginItemsZh implements TranslationsMyToolsCatalogLoginItemsEn {
	_TranslationsMyToolsCatalogLoginItemsZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '登录项目';
	@override String get description => '管理启动 Mac 时自动打开的应用程序。';
}

// Path: myToolsCatalog.mailAttachments
class _TranslationsMyToolsCatalogMailAttachmentsZh implements TranslationsMyToolsCatalogMailAttachmentsEn {
	_TranslationsMyToolsCatalogMailAttachmentsZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '邮件附件';
	@override String get description => '删除本地存储的电子邮件附件以释放空间，同时保留修改的文件。';
}

// Path: myToolsCatalog.malwareFinder
class _TranslationsMyToolsCatalogMalwareFinderZh implements TranslationsMyToolsCatalogMalwareFinderEn {
	_TranslationsMyToolsCatalogMalwareFinderZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '恶意软件查找器';
	@override String get description => '识别并删除恶意项目以确保您的 Mac 安全。';
}

// Path: myToolsCatalog.uninstaller
class _TranslationsMyToolsCatalogUninstallerZh implements TranslationsMyToolsCatalogUninstallerEn {
	_TranslationsMyToolsCatalogUninstallerZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '卸载程序';
	@override String get description => '正确删除整个应用程序及其所有相关文件。';
}

// Path: cleanupCategories.userCache
class _TranslationsCleanupCategoriesUserCacheZh implements TranslationsCleanupCategoriesUserCacheEn {
	_TranslationsCleanupCategoriesUserCacheZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get name => '用户缓存文件';
	@override String get description => '最初的目的是缩短启动时间，但应用程序的缓存文件最终会累积并导致功能不正常或整体性能下降。';
}

// Path: cleanupCategories.userLogs
class _TranslationsCleanupCategoriesUserLogsZh implements TranslationsCleanupCategoriesUserLogsEn {
	_TranslationsCleanupCategoriesUserLogsZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get name => '用户日志文件';
	@override String get description => '日志文件由 macOS 及其应用程序创建，用于记录事件和错误。随着时间的推移，它们会变大并占据很大的空间。';
}

// Path: cleanupCategories.languageFiles
class _TranslationsCleanupCategoriesLanguageFilesZh implements TranslationsCleanupCategoriesLanguageFilesEn {
	_TranslationsCleanupCategoriesLanguageFilesZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get name => '语言文件';
	@override String get description => '与应用程序捆绑在一起的未使用的本地化资源。删除不使用的语言可以释放存储空间，而不会影响功能。';
}

// Path: cleanupCategories.systemLogs
class _TranslationsCleanupCategoriesSystemLogsZh implements TranslationsCleanupCategoriesSystemLogsEn {
	_TranslationsCleanupCategoriesSystemLogsZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get name => '系统日志文件';
	@override String get description => '由 macOS 服务和守护程序写入的系统范围日志文件。这些文件可以安全删除，因为系统会在需要时重新创建它们。';
}

// Path: cleanupCategories.brokenLoginItems
class _TranslationsCleanupCategoriesBrokenLoginItemsZh implements TranslationsCleanupCategoriesBrokenLoginItemsEn {
	_TranslationsCleanupCategoriesBrokenLoginItemsZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get name => '损坏的登录项目';
	@override String get description => '指向磁盘上不再存在的应用程序或文件的登录项。删除它们可以加快登录时间。';
}

// Path: sections.home.features
class _TranslationsSectionsHomeFeaturesZh implements TranslationsSectionsHomeFeaturesEn {
	_TranslationsSectionsHomeFeaturesZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get systemStatus => '系统状态';
	@override String get storageUsage => '存储使用情况';
	@override String get quickActions => '快速操作';
}

// Path: sections.cleanup.features
class _TranslationsSectionsCleanupFeaturesZh implements TranslationsSectionsCleanupFeaturesEn {
	_TranslationsSectionsCleanupFeaturesZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get systemJunk => '系统垃圾';
	@override String get userCache => '用户缓存';
	@override String get tempFiles => '临时文件';
}

// Path: sections.myClutter.features
class _TranslationsSectionsMyClutterFeaturesZh implements TranslationsSectionsMyClutterFeaturesEn {
	_TranslationsSectionsMyClutterFeaturesZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get largeFiles => '大文件';
	@override String get duplicates => '重复项';
	@override String get largeSimilarImages => '大类似图像';
}

// Path: sections.spaceView.features
class _TranslationsSectionsSpaceViewFeaturesZh implements TranslationsSectionsSpaceViewFeaturesEn {
	_TranslationsSectionsSpaceViewFeaturesZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get visualStorageMap => '视觉存储图';
	@override String get largeFoldersOverview => '大文件夹概述';
	@override String get hiddenFilesUncovered => '发现隐藏文件';
}

// Path: sections.applications.features
class _TranslationsSectionsApplicationsFeaturesZh implements TranslationsSectionsApplicationsFeaturesEn {
	_TranslationsSectionsApplicationsFeaturesZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get appUninstaller => '应用程序卸载程序';
	@override String get largeApps => '大型应用程序';
	@override String get fileLeftovers => '文件剩菜';
}

// Path: sections.myTools.features
class _TranslationsSectionsMyToolsFeaturesZh implements TranslationsSectionsMyToolsFeaturesEn {
	_TranslationsSectionsMyToolsFeaturesZh._(this._root);

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
			'navigation.myActivity' => '我的活动',
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
