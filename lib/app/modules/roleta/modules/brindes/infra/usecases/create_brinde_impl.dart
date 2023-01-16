import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/domain/errors/gift_failure.dart';
import 'package:workshop_web/app/modules/roleta/domain/entities/simple_gift.dart';
import 'package:dartz/dartz.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/domain/usecases/create_brinde.dart';

import '../../domain/interfaces/gift_interface.dart';

class CreateBrindeImpl implements CreateBrinde {
  final GiftInterface _repo;

  CreateBrindeImpl(this._repo);

  @override
  Future<Either<GiftFailure, bool>> call(SimpleGift gift) async {
    return await _repo.createBrinde(gift);
  }
}
