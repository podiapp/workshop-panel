import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/external/datasources/gift_datasource_impl.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/infra/repositories/gift_repository.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/infra/usecases/create_brinde_impl.dart';

class BrindesModule extends Module {
  static List<Bind> exports = [
    Bind.lazySingleton((i) => GiftDatasourceImpl()),
    Bind.lazySingleton((i) => GiftRepository(i())),
    Bind.lazySingleton((i) => CreateBrindeImpl(i())),
  ];
}
