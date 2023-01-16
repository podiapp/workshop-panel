import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/brindes_module.dart';
import 'package:workshop_web/app/modules/roleta/ui/pages/roleta_page.dart';
import 'package:workshop_web/app/modules/roleta/ui/stores/create_brinde_store.dart';
import 'package:workshop_web/app/shared/utils.dart';

class RoletaModule extends Module {
  @override
  final List<Bind> binds = [
    ...BrindesModule.exports,
    Bind.lazySingleton((i) => CreateBrindeStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    PodiRoutes.page('/', child: (context, args) {
      return RoletaPage();
    })
  ];
}
