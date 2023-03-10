import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/brindes_module.dart';
import 'package:workshop_web/app/shared/utils.dart';

class RoletaModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(PodiPages.BrindesModule(false), module: BrindesModule()),
  ];
}
