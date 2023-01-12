import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../components/app_bar_widget.dart';
import '../components/drawer_widget.dart';
import '../components/select_shopping_header_widget.dart';
import '../utils.dart';

class BasePage extends StatelessWidget {
  final Widget? body;
  final Widget? overlayWidget;
  final double? drawerWidth;
  final bool busy;
  final bool hasBackButton;
  final bool hasTab;
  final bool hasSideMenu;
  final bool hasHeader;
  final bool hasSearchBox;
  final EdgeInsetsGeometry? padding;
  final Function(String?)? onSearchBoxChanged;
  final Function(int)? onChangeTab;
  final List<Widget>? appBarActions;
  final List<Widget>? filterActions;
  final List<Widget>? pageList;
  final List<TabBarItem>? tabBarItems;
  final int initialTab;
  final String pageTitle;
  final String searchBoxHint;
  final String? appBarSubtitle;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const BasePage({
    this.pageTitle = "",
    this.body,
    this.searchBoxHint = "Buscar...",
    this.appBarSubtitle,
    this.onSearchBoxChanged,
    this.overlayWidget,
    this.appBarActions,
    this.filterActions,
    this.busy = false,
    this.hasBackButton = false,
    this.hasTab = false,
    this.hasSideMenu = true,
    this.hasHeader = true,
    this.hasSearchBox = false,
    this.onChangeTab,
    this.tabBarItems,
    this.padding,
    this.pageList,
    this.initialTab = 0,
    this.scaffoldKey,
    this.drawerWidth = 880,
    Key? key,
  }) : super(key: key);

  Widget _buildPage(BuildContext context) {
    Widget buildHeader() {
      return Column(
        children: [
          SelectShoppingHeader(
            hasHeader: hasHeader,
          ),
        ],
      );
    }

    Widget buildTabPage() {
      return DefaultTabController(
        length: tabBarItems?.length ?? 0,
        initialIndex: initialTab,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: busy
                  ? IgnorePointer(
                      child: TabBar(
                          onTap: onChangeTab,
                          isScrollable: true,
                          unselectedLabelStyle:
                              PodiTexts.caption.size(13).heightRegular,
                          labelStyle: PodiTexts.button1.size(13).heightRegular,
                          indicatorColor: PodiColors.green,
                          tabs: tabBarItems ?? []),
                    )
                  : TabBar(
                      onTap: onChangeTab,
                      isScrollable: true,
                      unselectedLabelStyle:
                          PodiTexts.caption.size(13).heightRegular,
                      labelStyle: PodiTexts.button1.size(13).heightRegular,
                      indicatorColor: PodiColors.green,
                      tabs: tabBarItems ?? []),
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: PodiColors.dark[100]!),
                    ),
                  ),
                  padding:
                      padding ?? const EdgeInsets.symmetric(horizontal: 24),
                  height: MediaQuery.of(context).size.height -
                      (hasHeader ? 210 : 112),
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: pageList ?? [],
                  ),
                ),
                if (busy) ...[
                  Container(
                    height: MediaQuery.of(context).size.height - 120,
                    width: double.infinity,
                    color: PodiColors.white.withOpacity(0.5),
                    child: Column(
                      children: const [
                        SizedBox(height: 60),
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation(PodiColors.green),
                            strokeWidth: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      );
    }

    Widget buildDefaultPage() {
      return Container(
        padding: padding ?? const EdgeInsets.all(24).copyWith(bottom: 40),
        child: Stack(
          children: [
            body ?? const SizedBox.shrink(),
            if (busy) ...[
              Container(
                height: MediaQuery.of(context).size.height - 120,
                width: double.infinity,
                color: PodiColors.white.withOpacity(0.5),
                child: Column(
                  children: const [
                    SizedBox(height: 60),
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(PodiColors.green),
                        strokeWidth: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      endDrawer: Drawer(
        width: drawerWidth,
        child: overlayWidget,
      ),
      backgroundColor: PodiColors.white,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasSideMenu) DrawerWidget(),
          Expanded(
            child: Column(
              children: [
                buildHeader(),
                Expanded(
                  child: ListView(
                    physics: (busy)
                        ? const NeverScrollableScrollPhysics()
                        : const BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: (hasSearchBox)
                            ? SearchAppBarWidget(
                                title: pageTitle,
                                hint: searchBoxHint,
                                onChanged: onSearchBoxChanged,
                                actions: appBarActions,
                                subtitle: appBarSubtitle,
                                filters: filterActions,
                              )
                            : AppBarWidget(
                                title: pageTitle,
                                hasBackButton: hasBackButton,
                                actions: appBarActions,
                                subtitle: appBarSubtitle,
                                filters: filterActions,
                              ),
                      ),
                      (hasTab) ? buildTabPage() : buildDefaultPage()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }
}

class TabBarItem extends StatelessWidget {
  final String tabName;
  final Widget? tabChild;
  const TabBarItem({required this.tabName, this.tabChild, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        children: [
          Text(
            tabName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (tabChild != null) ...[
            const SizedBox(width: 8),
            tabChild!,
          ],
        ],
      ),
    );
  }
}
