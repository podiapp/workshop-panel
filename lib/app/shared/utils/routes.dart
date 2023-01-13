// ignore_for_file: non_constant_identifier_names
part of '../utils.dart';

class PodiPages {
  PodiPages._();

  // -> Roleta
  /// Complete Route -> /roleta/
  static String RoletaModule([bool complete = true]) => '/roleta/';

  // -> Brindes
  /// Complete Route -> /roleta/brindes/
  static String BrindesModule([bool complete = true]) =>
      complete ? '/roleta/brindes/' : '/brindes/';

  // -> Ganhadores
  /// Complete Route -> /roleta/ganhadores/
  static String GanhadoresModule([bool complete = true]) =>
      complete ? '/roleta/ganhadores/' : '/ganhadores/';
}
