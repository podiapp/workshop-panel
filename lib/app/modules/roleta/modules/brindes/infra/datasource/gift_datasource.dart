import 'package:workshop_web/app/modules/roleta/modules/brindes/infra/models/gift_model.dart';
import 'package:workshop_web/app/shared/stores/pagination_store.dart';

abstract class GiftDatasource {
  Future<bool> createBrinde(Map<String, dynamic> body);

  Future<List<GiftModel>> fetchBrindes(
      Map<String, dynamic> filters, PaginationStore pagination);
}
