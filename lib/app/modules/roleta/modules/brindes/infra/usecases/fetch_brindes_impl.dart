import 'package:workshop_web/app/modules/roleta/modules/brindes/domain/errors/gift_failure.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/domain/entities/gift.dart';
import 'package:dartz/dartz.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/domain/interfaces/gift_interface.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/domain/usecases/fetch_brindes.dart';
import 'package:workshop_web/app/shared/stores/pagination_store.dart';

class FetchBrindesImpl implements FetchBrindes {
  final GiftInterface _repo;

  FetchBrindesImpl(this._repo);

  @override
  Future<Either<GiftFailure, List<Gift>>> call(
      Map<String, dynamic> filters, PaginationStore pagination) async {
    return await _repo.fetchBrindes(filters, pagination);
  }
}
