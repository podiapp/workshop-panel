import 'package:workshop_web/app/modules/roleta/modules/brindes/domain/entities/gift.dart';
import 'package:workshop_web/app/shared/models/enums/status_enum.dart';

class GiftModel extends Gift {
  GiftModel({
    required super.id,
    required super.name,
    required super.photo,
    required super.description,
    required super.quantity,
    required super.availableQuantity,
    required super.winnersQuantity,
    required super.status,
  });

  factory GiftModel.empty() {
    return GiftModel(
      id: "",
      name: "",
      photo: "",
      description: "",
      quantity: 1,
      availableQuantity: 0,
      winnersQuantity: 0,
      status: Status.rascunho,
    );
  }

  factory GiftModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return GiftModel.empty();
    return GiftModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      photo: json['photo'] ?? "",
      description: json['description'] ?? "",
      quantity: json['quantity'] ?? 1,
      availableQuantity: json['availableQuantity'] ?? 0,
      winnersQuantity: json['winnersQuantity'] ?? 0,
      status: Status.values[json['status'] ?? 0],
    );
  }
}
