import 'package:dartz/dartz.dart';
import 'package:workshop_web/app/modules/roleta/domain/entities/simple_gift.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/domain/entities/gift.dart';
import 'package:workshop_web/app/shared/stores/pagination_store.dart';

import '../errors/gift_failure.dart';

abstract class GiftInterface {
  Future<Either<GiftFailure, bool>> createBrinde(SimpleGift gift);

  Future<Either<GiftFailure, List<Gift>>> fetchBrindes(
    Map<String, dynamic> filters,
    PaginationStore pagination,
  );
}
