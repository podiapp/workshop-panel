import 'package:workshop_web/app/modules/roleta/modules/brindes/infra/datasource/gift_datasource.dart';
import 'package:workshop_web/app/shared/utils.dart';

class GiftDatasourceImpl implements GiftDatasource {
  @override
  Future<bool> createBrinde(Map<String, dynamic> body) async {
    const url = "${ApiConstants.API_WORKSHOP}Gifts";
    final result = await http.post(url, data: body);
    return isRequestSuccessful(result.statusCode);
  }
}
