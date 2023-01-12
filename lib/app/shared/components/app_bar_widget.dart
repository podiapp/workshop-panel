import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../utils.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool hasBackButton;
  final Function()? backButtonFunction;
  final List<Widget>? actions;
  final List<Widget>? filters;
  final int maxLines;
  const AppBarWidget({
    Key? key,
    required this.title,
    this.hasBackButton = false,
    this.backButtonFunction,
    this.subtitle,
    this.actions,
    this.filters,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (hasBackButton) ...[
                CircleAvatar(
                  radius: 20,
                  backgroundColor: PodiColors.neutrals[900],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      splashRadius: 1,
                      icon: const Icon(Icons.arrow_back, color: PodiColors.dark),
                      onPressed: (backButtonFunction != null) ? backButtonFunction : Modular.to.pop,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Tooltip(
                      message: title,
                      textStyle: PodiTexts.body2.withColor(PodiColors.white),
                      child: Text(
                        title,
                        style: PodiTexts.heading5,
                        maxLines: maxLines,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (!isNull(subtitle)) ...[
                      const SizedBox(height: 4),
                      Text(subtitle!,
                          style: PodiTexts.caption.size(13).withColor(PodiColors.dark[300]!)),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 16),
              ...actions ?? [],
            ],
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          direction: Axis.horizontal,
          runSpacing: 8,
          spacing: 8,
          children: [
            // if (hasLayoutChange) ...[
            //   Observer(builder: (_) {
            //     return InkWell(
            //       onTap: painelStore.changeViewType,
            //       borderRadius: BorderRadius.circular(6),
            //       child: Container(
            //         height: 32,
            //         width: 32,
            //         decoration: BoxDecoration(
            //           border: Border.all(color: PodiColors.dark[100]!),
            //           borderRadius: BorderRadius.circular(6),
            //         ),
            //         child: Center(
            //           child: painelStore.viewType == ViewType.list
            //               ? SvgPicture.asset(PodiWebIcons.gridView, height: 16, width: 16)
            //               : SvgPicture.asset(PodiWebIcons.tableView, height: 16, width: 16),
            //         ),
            //       ),
            //     );
            //   }),
            // ],
            //
            ...filters ?? [],
            // if (hasUniversalFilter) ...[
            //   InkWell(
            //     onTap: filterFunction,
            //     borderRadius: BorderRadius.circular(6),
            //     child: Container(
            //       height: 32,
            //       width: 32,
            //       decoration: BoxDecoration(
            //         border: Border.all(color: PodiColors.dark[100]!),
            //         borderRadius: BorderRadius.circular(6),
            //       ),
            //       child:
            //           Center(child: SvgPicture.asset(PodiWebIcons.filter, height: 16, width: 16)),
            //     ),
            //   ),
            // ],
          ],
        ),
      ],
    );
  }
}

class SearchAppBarWidget extends StatelessWidget {
  final String title, hint;
  final String? subtitle;
  final List<Widget>? actions;
  final List<Widget>? filters;
  final Function(String)? onChanged;
  final Function()? filterFunction;

  const SearchAppBarWidget({
    Key? key,
    required this.title,
    this.hint = "Buscar...",
    this.subtitle,
    this.onChanged,
    this.actions,
    this.filters,
    this.filterFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: PodiTexts.heading5),
                  if (!isNull(subtitle)) ...[
                    const SizedBox(height: 4),
                    Text(subtitle!,
                        style: PodiTexts.caption.size(13).withColor(PodiColors.dark[300]!)),
                  ],
                ],
              ),
              const Spacer(flex: 3),
              const SizedBox(width: 16),
              ...actions ?? [],
            ],
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          direction: Axis.horizontal,
          runSpacing: 8,
          spacing: 8,
          children: [
            SizedBox(
              height: 32,
              width: 240,
              child: TextFormField(
                onChanged: onChanged,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.center,
                style: PodiTexts.body1.size(13).heightRegular,
                textInputAction: TextInputAction.search,
                cursorColor: PodiColors.green,
                decoration: InputDecorationWidget.simple(
                  backgroundColor: PodiColors.white,
                  borderColor: PodiColors.dark[100],
                  // TODO Arrumar icone
                  suffix: Icon(Icons.search, color: PodiColors.dark[300]),
                  hint: hint,
                ).copyWith(
                  hintStyle: PodiTexts.body1.size(13).heightRegular,
                  contentPadding: const EdgeInsets.only(left: 12),
                ),
              ),
            ),
            ...filters ?? [],
          ],
        ),
      ],
    );
  }
}
