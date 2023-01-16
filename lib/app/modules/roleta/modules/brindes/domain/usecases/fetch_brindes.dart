import 'package:dartz/dartz.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/domain/errors/gift_failure.dart';
import 'package:workshop_web/app/shared/stores/pagination_store.dart';

import '../entities/gift.dart';

abstract class FetchBrindes {
  Future<Either<GiftFailure, List<Gift>>> call(
    Map<String, dynamic> filters,
    PaginationStore pagination,
  );
}
