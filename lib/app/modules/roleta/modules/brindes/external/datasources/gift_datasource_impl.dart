import 'package:workshop_web/app/modules/roleta/modules/brindes/infra/datasource/gift_datasource.dart';
import 'package:workshop_web/app/shared/stores/pagination_store.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/infra/models/gift_model.dart';
import 'package:workshop_web/app/shared/utils.dart';

class GiftDatasourceImpl implements GiftDatasource {
  @override
  Future<bool> createBrinde(Map<String, dynamic> body) async {
    const url = "${ApiConstants.API_WORKSHOP}Gifts";
    final result = await http.post(url, data: body);
    return isRequestSuccessful(result.statusCode);
  }

  @override
  Future<List<GiftModel>> fetchBrindes(
      Map<String, dynamic> filters, PaginationStore pagination) async {
    List<GiftModel> gifts = [];
    const url = "${ApiConstants.API_WORKSHOP}Gifts";
    final result = await http.get(url, queryParameters: filters);
    if (isRequestSuccessful(result.statusCode)) {
      for (var json in result.data['data']) {
        gifts.add(GiftModel.fromJson(json));
      }
      pagination.init(
        count: result.data['count'],
        totalCount: result.data['totalCount'],
      );
    }
    return gifts;
  }
}
