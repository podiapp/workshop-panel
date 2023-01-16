import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/domain/errors/gift_failure.dart';
import 'package:workshop_web/app/modules/roleta/domain/entities/simple_gift.dart';
import 'package:dartz/dartz.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/domain/interfaces/gift_interface.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/infra/datasource/gift_datasource.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/infra/errors/invalid_request.dart';

import '../../../../../../shared/utils.dart';

class GiftRepository implements GiftInterface {
  final GiftDatasource _datasource;

  GiftRepository(this._datasource);

  @override
  Future<Either<GiftFailure, bool>> createBrinde(SimpleGift gift) async {
    if (isNull(gift.name) ||
        isNull(gift.description) ||
        isNull(gift.url) ||
        gift.quantity == 0) {
      return Left(GiftInvalidRequest());
    }
    final body = {
      "description": gift.description,
      "name": gift.name,
      "photo": gift.url,
      "quantity": gift.quantity,
      "status": gift.status.index
    };
    return Right(await _datasource.createBrinde(body));
  }
}
