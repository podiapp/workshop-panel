import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_web/app/modules/brindes/ui/pages/brindes_page.dart';

class BrindesModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) {
      return BrindesPage();
    })
  ];
}
