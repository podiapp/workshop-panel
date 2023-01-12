import 'package:mobx/mobx.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http2;

import '../utils.dart';

part 'upload_store.g.dart';

class UploadStore = _UploadStoreBase with _$UploadStore;

abstract class _UploadStoreBase with Store {
  @action
  Future<String?> savePhoto(DroppedFile image,
      [String page = "Vitrine"]) async {
    var mime = image.mime;
    var data = image.data;
    try {
      log.v("<UploadStore> Add photo");
      final url =
          "${ApiConstants.API_SETTINGS}ImageHandler/${Uri.encodeComponent(mime)}/$page";
      final resultUrl = await http.get(url);
      log.i("<UploadStore> Get Image Url Complete: ${resultUrl.statusCode}");
      if (resultUrl.statusCode == 200) {
        final String imageUrl = resultUrl.data;
        try {
          log.v("<UploadStore> Send Image Started");
          final headers = <String, String>{'Content-Type': mime};
          final result = await http2.put(Uri.parse(imageUrl),
              body: data, headers: headers);
          log.i("<UploadStore> Send Image Complete: ${result.statusCode}");
          if (result.statusCode == 200) {
            return imageUrl.split("?").first;
          }
        } catch (e) {
          log.e("<UploadStore> Send Image Failed: $e");
        }
      }
    } catch (e) {
      log.e("<UploadStore> Add photo Failed: $e");
    }
    return null;
  }
}
