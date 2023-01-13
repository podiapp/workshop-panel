import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils.dart';

class SelectShoppingHeader extends StatelessWidget {
  final Function(Shopping? shopping)? onChanged;
  final bool hasHeader;
  final bool basicSelector;
  const SelectShoppingHeader({
    this.onChanged,
    this.hasHeader = true,
    this.basicSelector = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: PodiColors.dark.withOpacity(0.04)),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          height: kToolbarHeight,
          child: Row(
            children: [
              if (hasHeader) ...[
                Expanded(
                  flex: 2,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: PodiColors.dark[100]!),
                      borderRadius: BorderRadius.circular(4.0),
                      color: PodiColors.white,
                    ),
                    child: Text(
                      "Shopping Palladium Curitiba",
                      style: PodiTexts.button2.size(13).heightRegular,
                    ),
                  ),
                ),
                const Spacer(flex: 5),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: NetworkImageWidget(
                            "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Tooltip(
                        message: "Carolina Fernandes",
                        waitDuration: const Duration(seconds: 2),
                        child: Text(
                          "Carolina Fernandes",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: PodiTexts.subtitle2.size(13).heightRegular,
                        ),
                      ),
                      const SizedBox(width: 16),
                      InkWell(
                        onTap: () {
                          SnackbarWidget.error("TESTE");
                        },
                        borderRadius: BorderRadius.circular(100),
                        child: SvgPicture.asset(PodiIcons.logoutOutline,
                            height: 12, width: 12),
                      )
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      );
}
