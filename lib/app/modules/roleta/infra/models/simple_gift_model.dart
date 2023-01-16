import 'package:workshop_web/app/modules/roleta/domain/entities/simple_gift.dart';

import '../../../../shared/models/enums/status_enum.dart';

class SimpleGiftModel extends SimpleGift {
  SimpleGiftModel({
    required super.url,
    required super.name,
    required super.status,
    required super.description,
    required super.quantity,
  });

  factory SimpleGiftModel.empty() {
    return SimpleGiftModel(
      url: "",
      name: "",
      status: Status.rascunho,
      description: "",
      quantity: 1,
    );
  }
}
