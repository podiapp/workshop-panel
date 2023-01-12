import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../stores/pagination_store.dart';
import '../utils.dart';

class ChangePageWidget extends StatelessWidget {
  final Function() nextPage, previousPage;
  final Function() firstPage, lastPage;
  final Function(int? limit) changeLimit;
  final PaginationStore paginationStore;

  const ChangePageWidget({
    Key? key,
    required this.nextPage,
    required this.previousPage,
    required this.changeLimit,
    required this.firstPage,
    required this.lastPage,
    required this.paginationStore,
  }) : super(key: key);

  int get pages =>
      ((paginationStore.totalCount / paginationStore.maxItems).ceil());
  int get backPages => (paginationStore.skip / paginationStore.maxItems).ceil();
  int get forwardPages => (pages - backPages) - 1;
  int get currentPage => pages - forwardPages;

  Widget get _buildFirstPage {
    return IconButton(
      onPressed: backPages <= 0 ? () {} : firstPage,
      splashRadius: 1,
      icon: Icon(
        Icons.first_page,
        size: 16,
        color: backPages <= 0 ? PodiColors.dark[300] : PodiColors.dark,
      ),
    );
  }

  Widget get _buildLastPage {
    return IconButton(
      onPressed: forwardPages <= 0 ? () {} : lastPage,
      splashRadius: 1,
      icon: Icon(
        Icons.last_page,
        size: 16,
        color: forwardPages <= 0 ? PodiColors.dark[300] : PodiColors.dark,
      ),
    );
  }

  Widget get _buildBackButton {
    return IconButton(
      onPressed: backPages <= 0 ? () {} : previousPage,
      splashRadius: 1,
      icon: Icon(
        Icons.arrow_back,
        size: 16,
        color: backPages <= 0 ? PodiColors.dark[300] : PodiColors.dark,
      ),
    );
  }

  Widget get _buildForwardButton {
    return IconButton(
      onPressed: forwardPages <= 0 ? () {} : nextPage,
      splashRadius: 1,
      icon: Icon(
        Icons.arrow_forward,
        size: 16,
        color: forwardPages <= 0 ? PodiColors.dark[300] : PodiColors.dark,
      ),
    );
  }

  Widget get _buildMaxItems {
    return Row(
      children: [
        Text("Itens por página", style: PodiTexts.caption.size(13)),
        const SizedBox(width: 8),
        SizedBox(
          height: 32,
          width: 64,
          child: DropdownButtonFormField<int>(
            onChanged: changeLimit,
            value: 10,
            decoration: InputDecorationWidget.simple(
              backgroundColor: PodiColors.white,
              borderColor: PodiColors.dark[100],
            ).copyWith(
              contentPadding: const EdgeInsets.only(left: 8),
            ),
            dropdownColor: PodiColors.white,
            items: [
              DropdownMenuItem(
                value: 10,
                child: Text(
                  "10",
                  style: PodiTexts.button2.size(13).heightRegular,
                ),
              ),
              DropdownMenuItem(
                value: 20,
                child: Text(
                  "20",
                  style: PodiTexts.button2.size(13).heightRegular,
                ),
              ),
              DropdownMenuItem(
                value: 30,
                child: Text(
                  "30",
                  style: PodiTexts.button2.size(13).heightRegular,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => Observer(builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildMaxItems,
            const SizedBox(width: 32),
            Row(
              children: [
                Text(
                  "${paginationStore.skip + 1} - ${forwardPages != 0 ? paginationStore.maxItems * currentPage : paginationStore.totalCount} de ${paginationStore.totalCount}",
                  style: PodiTexts.caption.size(13),
                ),
                _buildFirstPage,
                _buildBackButton,
                _buildForwardButton,
                _buildLastPage,
              ],
            ),
          ],
        );
      });
}
