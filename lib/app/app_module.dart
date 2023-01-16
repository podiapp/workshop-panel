import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/brindes_module.dart';
import 'package:workshop_web/app/modules/roleta/roleta_module.dart';
import 'package:workshop_web/app/shared/utils.dart';

import 'shared/stores/pagination_store.dart';
import 'shared/stores/upload_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => PaginationStore()),
    Bind.lazySingleton((i) => UploadStore()),
    Bind.lazySingleton((i) => HttpService()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(PodiPages.RoletaModule(false), module: RoletaModule()),
  ];
}
