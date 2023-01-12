import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../utils.dart';

class BaseModal extends StatelessWidget {
  final Widget child;
  final String title;
  final Function()? onClose;
  final Function() onSaved;
  final bool busy;
  final bool buttonBusy;
  final bool hideFooter;
  final bool showTitleBorder;
  final String? buttonTitle;
  final EdgeInsets? padding;
  const BaseModal({
    required this.title,
    required this.onSaved,
    required this.child,
    this.onClose,
    this.busy = false,
    this.buttonBusy = false,
    this.hideFooter = false,
    this.showTitleBorder = true,
    this.buttonTitle,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PodiColors.white,
        boxShadow: [
          BoxShadow(
            color: PodiColors.dark.withOpacity(0.08),
            offset: const Offset(-4, 0),
            blurRadius: 8,
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height,
      child: busy
          ? SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: const Center(
                child: SizedBox(
                  height: 64,
                  width: 64,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(PodiColors.green),
                    strokeWidth: 3,
                  ),
                ),
              ),
            )
          : Column(
              children: [
                Container(
                  height: kToolbarHeight,
                  padding: padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(
                    border: (showTitleBorder)
                        ? Border(
                            bottom: BorderSide(color: PodiColors.dark[100]!),
                          )
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: PodiTexts.body1.weightSemibold.heightCenter,
                      ),
                      IconButton(
                        onPressed: () {
                          if (onClose != null) {
                            onClose!();
                          } else {
                            Modular.to.pop();
                          }
                        },
                        icon: const Icon(Icons.close),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: child,
                ),
                if (!hideFooter) ...[
                  Container(
                    height: kToolbarHeight,
                    padding: padding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: PodiColors.dark[100]!),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GreenButton(
                          title: buttonTitle ?? "Salvar",
                          onTap: onSaved,
                          busy: buttonBusy,
                          width: 100,
                          radius: 6,
                        ),
                      ],
                    ),
                  ),
                ]
              ],
            ),
    );
  }
}
