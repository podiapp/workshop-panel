import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workshop_web/app/shared/utils.dart';

class DrawerWidget extends StatelessWidget {
  final double _width = 240;
  final double _height = double.infinity;

  DrawerWidget({super.key});

  List<DrawerItem> items = [
    DrawerItem("Início", PodiWebIcons.home, route: "/home/"),
    DrawerItem("Eventos", PodiWebIcons.calendar, route: "/events/"),
    DrawerItem("Roleta de prêmios", PodiWebIcons.gift, route: "/roleta/"),
  ];

  Widget _buildDrawer() {
    Widget _buildBackground({required Widget child}) {
      return Container(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          color: PodiColors.green[50],
          border: const Border(right: BorderSide(color: PodiColors.green)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: Center(
                child: SvgPicture.asset(PodiIcons.logoPodi),
              ),
            ),
            const SizedBox(height: 8),
            child,
          ],
        ),
      );
    }

    Widget _buildItem(
        {required IconData icon,
        required String name,
        bool isSelected = false}) {
      return Container(
        height: 48,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        color: isSelected ? PodiColors.green : null,
        child: Row(
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: Icon(
                icon,
                color: isSelected ? PodiColors.white : PodiColors.dark,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              name,
              style: isSelected
                  ? PodiTexts.label2.weightBold.withColor(PodiColors.white)
                  : PodiTexts.label2.weightMedium,
            ),
          ],
        ),
      );
    }

    Widget _buildList() {
      return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return _buildItem(
            name: item.name,
            icon: item.icon,
            isSelected: item.isSelected,
          );
        },
        shrinkWrap: true,
      );
    }

    return _buildBackground(child: _buildList());
  }

  // BUILD
  @override
  Widget build(BuildContext context) {
    return _buildDrawer();
  }
}

class DrawerItem {
  String name;
  IconData icon;
  String route;

  DrawerItem(this.name, this.icon, {required this.route});

  bool get isSelected => Modular.to.path.startsWith(route);
}
