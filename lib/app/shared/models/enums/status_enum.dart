import 'package:flutter/material.dart';

import '../../utils.dart';

enum Status { rascunho, ativo, inativo, expirado, esgotado, aprovacao, rejeitado, programado }

extension StatusExtension on Status {
  Color get backgroundColor {
    switch (this) {
      case Status.rascunho:
        return PodiColors.dark[100]!;
      case Status.programado:
        return PodiColors.dark[100]!;
      case Status.esgotado:
        return PodiColors.danger[100]!;
      case Status.ativo:
        return PodiColors.green[100]!;
      case Status.inativo:
        return PodiColors.danger[100]!;
      case Status.expirado:
        return PodiColors.warning[100]!;
      case Status.aprovacao:
        return PodiColors.warning[100]!;
      case Status.rejeitado:
        return PodiColors.danger[100]!;
    }
  }

  Color get color {
    switch (this) {
      case Status.rascunho:
        return PodiColors.dark;
      case Status.programado:
        return PodiColors.dark;
      case Status.esgotado:
        return PodiColors.danger;
      case Status.ativo:
        return PodiColors.green;
      case Status.inativo:
        return PodiColors.danger;
      case Status.expirado:
        return PodiColors.warning;
      case Status.aprovacao:
        return PodiColors.warning;
      case Status.rejeitado:
        return PodiColors.danger;
    }
  }

  String get text {
    switch (this) {
      case Status.rascunho:
        return "RASCUNHO";
      case Status.programado:
        return "PROGRAMADO";
      case Status.esgotado:
        return "ESGOTADO";
      case Status.ativo:
        return "ATIVO";
      case Status.inativo:
        return "INATIVO";
      case Status.expirado:
        return "EXPIRADO";
      case Status.aprovacao:
        return "PARA APROVAÇÃO";
      case Status.rejeitado:
        return "REJEITADO";
    }
  }
}
