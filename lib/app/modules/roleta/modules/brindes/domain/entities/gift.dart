import 'package:workshop_web/app/shared/models/enums/status_enum.dart';

class Gift {
  String id;
  String name;
  String photo;
  String description;
  int quantity;
  int availableQuantity;
  int winnersQuantity;
  Status status;

  Gift({
    required this.id,
    required this.name,
    required this.photo,
    required this.description,
    required this.quantity,
    required this.availableQuantity,
    required this.winnersQuantity,
    required this.status,
  });
}
