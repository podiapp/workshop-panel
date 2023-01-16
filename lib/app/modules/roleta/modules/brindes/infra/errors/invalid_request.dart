import 'package:workshop_web/app/modules/roleta/modules/brindes/domain/errors/gift_failure.dart';

class GiftInvalidRequest implements GiftFailure {
  @override
  String get msg => "Um ou mais campos estão inválidos.";

  @override
  int get statusCode => 400;
}
