import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_web/app/modules/roleta/ui/pages/create_brinde.dart';
import 'package:workshop_web/app/modules/roleta/ui/stores/create_brinde_store.dart';
import 'package:workshop_web/app/shared/pages/base_page.dart';

import '../../../../shared/utils.dart';

class RoletaPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final createStore = Modular.get<CreateBrindeStore>();

  void openModal() {
    createStore.clear();
    _scaffoldKey.currentState?.openEndDrawer();
  }

  final List<TabBarItem> tabBarItems = [
    TabBarItem(tabName: "Brindes"),
    TabBarItem(tabName: "Ganhadores"),
  ];

  final List<Widget> pageList = [
    Container(),
    Container(),
  ];

  Widget get button => PodiButton.primary(
        title: "Novo brinde",
        icon: PodiWebIcons.add,
        onTap: openModal,
      );

  @override
  Widget build(BuildContext context) {
    return BasePage(
      pageTitle: "Roleta de prêmios",
      appBarActions: [button],
      hasTab: true,
      tabBarItems: tabBarItems,
      pageList: pageList,
      overlayWidget: CreateBrindeModal(),
      scaffoldKey: _scaffoldKey,
    );
  }
}
