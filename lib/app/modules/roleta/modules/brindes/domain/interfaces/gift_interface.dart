import 'package:dartz/dartz.dart';
import 'package:workshop_web/app/modules/roleta/domain/entities/simple_gift.dart';

import '../errors/gift_failure.dart';

abstract class GiftInterface {
  Future<Either<GiftFailure, bool>> createBrinde(SimpleGift gift);
}
