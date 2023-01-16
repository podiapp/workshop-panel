import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/ui/stores/brinde_store.dart';
import 'package:workshop_web/app/modules/roleta/ui/pages/create_brinde.dart';
import 'package:workshop_web/app/modules/roleta/ui/stores/create_brinde_store.dart';
import 'package:workshop_web/app/shared/pages/base_page.dart';

import '../../../../shared/utils.dart';
import '../../modules/brindes/ui/pages/brindes_page.dart';

class RoletaPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final createStore = Modular.get<CreateBrindeStore>();
  final brindesStore = Modular.get<BrindesStore>();

  void openModal() {
    createStore.clear();
    _scaffoldKey.currentState?.openEndDrawer();
  }

  final List<TabBarItem> tabBarItems = [
    TabBarItem(tabName: "Brindes"),
    TabBarItem(tabName: "Ganhadores"),
  ];

  final List<Widget> pageList = [
    BrindesPage(),
    Container(),
  ];

  Widget get button => PodiButton.primary(
        title: "Novo brinde",
        icon: PodiWebIcons.add,
        onTap: openModal,
      );

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => BasePage(
        pageTitle: "Roleta de prêmios",
        busy: brindesStore.busy,
        appBarActions: [button],
        hasTab: true,
        tabBarItems: tabBarItems,
        pageList: pageList,
        overlayWidget: CreateBrindeModal(),
        scaffoldKey: _scaffoldKey,
      ),
    );
  }
}
