import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/domain/errors/gift_failure.dart';
import 'package:workshop_web/app/modules/roleta/domain/entities/simple_gift.dart';
import 'package:dartz/dartz.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/domain/usecases/create_brinde.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/infra/repositories/gift_repository.dart';

class CreateBrindeImpl implements CreateBrinde {
  final GiftRepository _repo;

  CreateBrindeImpl(this._repo);

  @override
  Future<Either<GiftFailure, bool>> call(SimpleGift gift) async {
    return await _repo.createBrinde(gift);
  }
}
