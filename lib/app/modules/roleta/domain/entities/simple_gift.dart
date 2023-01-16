import 'package:workshop_web/app/shared/models/enums/status_enum.dart';

class SimpleGift {
  String url;
  String name;
  Status status;
  String description;
  int quantity;

  SimpleGift({
    required this.url,
    required this.name,
    required this.status,
    required this.description,
    required this.quantity,
  });
}
