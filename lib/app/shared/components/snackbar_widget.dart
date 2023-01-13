import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../utils.dart';

class SnackbarWidget {
  SnackbarWidget.build(String message,
      {String title = "Sucesso!",
      Color color = PodiColors.green,
      Duration duration = const Duration(seconds: 5)}) {
    late ToastFuture toastFuture;

    final snackbar = ToastWidget(
      color: color,
      title: title,
      message: message,
      onTap: () => toastFuture.dismiss(showAnim: true),
    );

    toastFuture = showToastWidget(
      snackbar,
      position:
          const StyledToastPosition(align: Alignment.topRight, offset: 16.0),
      duration: duration,
    );
  }

  SnackbarWidget.verbose(String message,
      {String title = "Aviso",
      Duration duration = const Duration(seconds: 5)}) {
    SnackbarWidget.build(
      message,
      title: title,
      duration: duration,
      color: PodiColors.neutrals[200]!,
    );
  }

  SnackbarWidget.error(String message,
      {String title = "Erro!",
      Duration duration = const Duration(seconds: 5)}) {
    SnackbarWidget.build(
      message,
      title: title,
      duration: duration,
      color: PodiColors.danger,
    );
  }

  SnackbarWidget.success(String message,
      {String title = "Sucesso!",
      Duration duration = const Duration(seconds: 5)}) {
    SnackbarWidget.build(
      message,
      title: title,
      duration: duration,
      color: PodiColors.green,
    );
  }

  SnackbarWidget.info(
    String message, {
    String title = "Informação",
    Duration duration = const Duration(seconds: 5),
  }) {
    SnackbarWidget.build(
      message,
      title: title,
      duration: duration,
      color: PodiColors.blue,
    );
  }

  SnackbarWidget.warning(
    String message, {
    String title = "Aviso!",
    Duration duration = const Duration(seconds: 5),
  }) {
    SnackbarWidget.build(
      message,
      title: title,
      duration: duration,
      color: PodiColors.warning,
    );
  }
}
