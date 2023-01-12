import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../utils.dart';

class SnackbarWidget {
  SnackbarWidget.build(String message,
      {String title = "Sucesso!",
      Color color = PodiColors.green,
      Duration duration = const Duration(seconds: 2)}) {
    late ToastFuture toastFuture;

    final snackbar = Container(
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: lighten(color, 0.4),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 8),
            blurRadius: 24,
            color: PodiColors.dark.withOpacity(0.04),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: color, width: 8),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: PodiTexts.body2.size(13).heightCenter.weightBold),
                  const SizedBox(height: 4),
                  Text(message, style: PodiTexts.body2.size(13).heightRegular.weightRegular),
                ],
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () => toastFuture.dismiss(showAnim: true),
                child: const Icon(
                  Icons.close,
                  color: PodiColors.dark,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    toastFuture = showToastWidget(
      snackbar,
      position: const StyledToastPosition(align: Alignment.topRight, offset: 16.0),
      duration: duration,
    );
  }

  SnackbarWidget.error(String message,
      {String? title, Duration duration = const Duration(seconds: 2)}) {
    late ToastFuture toastFuture;

    final snackbar = Container(
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: PodiColors.danger[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: PodiColors.danger),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 8),
            blurRadius: 24,
            color: PodiColors.dark.withOpacity(0.04),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: PodiColors.danger, width: 8),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title ?? "Erro!", style: PodiTexts.body1.weightBold),
                  const SizedBox(height: 4),
                  Text(message, style: PodiTexts.body2.size(13).weightRegular),
                ],
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () => toastFuture.dismiss(showAnim: true),
                child: const Icon(
                  Icons.close,
                  color: PodiColors.dark,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    toastFuture = showToastWidget(
      snackbar,
      position: const StyledToastPosition(align: Alignment.topRight, offset: 16.0),
      duration: duration,
    );
  }
}
