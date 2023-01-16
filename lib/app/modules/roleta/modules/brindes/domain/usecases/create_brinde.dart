import 'package:dartz/dartz.dart';
import 'package:workshop_web/app/modules/roleta/domain/entities/simple_gift.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/domain/errors/gift_failure.dart';

abstract class CreateBrinde {
  Future<Either<GiftFailure, bool>> call(SimpleGift gift);
}
