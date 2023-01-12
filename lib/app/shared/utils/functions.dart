part of '../utils.dart';

String getDiscount(int oldPrice, int newPrice) =>
    "${((oldPrice - newPrice) / oldPrice * 100).toStringAsFixed(0)}%";

Size getTextSize(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
    ..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size;
}

double getPercentage(num sample, num total) => (total == 0) ? 0 : (sample * 100) / total;

String cpfMask(String cpf) =>
    '${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}';

String cnpjMask(String cnpj) => (cnpj.length < 14)
    ? cnpj
    : '${cnpj.substring(0, 2)}.${cnpj.substring(2, 5)}.${cnpj.substring(5, 8)}/${cnpj.substring(8, 12)}-${cnpj.substring(12)}';

String cepMask(String cep) => "${cep.substring(0, 2)}.${cep.substring(2, 5)}-${cep.substring(5)}";

bool isValidDate(String input) {
  String toOriginalFormatString(DateTime dateTime) {
    final y = dateTime.year.toString().padLeft(4, '0');
    final m = dateTime.month.toString().padLeft(2, '0');
    final d = dateTime.day.toString().padLeft(2, '0');
    return "$d$m$y";
  }

  try {
    final date = DateFormat("dd/MM/yyyy").parse(input);
    final originalFormatString = toOriginalFormatString(date);
    return input.replaceAll("/", "") == originalFormatString;
  } catch (_) {
    return false;
  }
}

Map<String, dynamic> parseJwt(String token) {
  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('invalid token');
  }

  final payload = _decodeBase64(parts[1]);
  final payloadMap = json.decode(payload);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('invalid payload');
  }

  return payloadMap;
}

bool isRequestSuccessful(int? statusCode) =>
    statusCode == null ? false : statusCode >= 200 && statusCode < 300;

bool isNumeric(String? s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}
