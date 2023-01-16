import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/domain/entities/gift.dart';
import 'package:workshop_web/app/shared/components/change_page_widget.dart';
import 'package:workshop_web/app/shared/components/status_badge_widget.dart';
import 'package:workshop_web/app/shared/models/enums/status_enum.dart';
import 'package:workshop_web/app/shared/utils.dart';

import '../stores/brinde_store.dart';

class BrindesPage extends StatefulWidget {
  const BrindesPage({super.key});

  @override
  State<BrindesPage> createState() => _BrindesPageState();
}

class _BrindesPageState extends State<BrindesPage> {
  final store = Modular.get<BrindesStore>();

  @override
  void initState() {
    store.init();
    super.initState();
  }

  Widget _buildTable() {
    return Observer(
      builder: (context) => TableWidget<Gift>(
        items: store.gifts,
        columns: [
          TableColumnWidget(
            title: "NOME",
            buildItem: (context, constraints, item) {
              return Row(
                children: [
                  SizedBox.square(
                    dimension: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: NetworkImageWidget(item.photo),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(item.name, style: PodiTexts.label2.weightSemibold),
                ],
              );
            },
          ),
          TableColumnWidget(
            title: "QNTD.",
            buildItem: (context, constraints, item) {
              return Text(
                item.availableQuantity.toString(),
                style: PodiTexts.body2.weightRegular,
              );
            },
          ),
          TableColumnWidget(
            title: "GANHADORES",
            buildItem: (context, constraints, item) {
              return Text(
                item.winnersQuantity.toString(),
                style: PodiTexts.body2.weightRegular,
              );
            },
          ),
          TableColumnWidget(
            title: "DIFICULDADE",
            buildItem: (context, constraints, item) {
              return Text(
                item.quantity.toString(),
                style: PodiTexts.body2.weightRegular,
              );
            },
          ),
          TableColumnWidget(
            title: "STATUS",
            buildItem: (context, constraints, item) {
              return StatusBadge(
                text: item.status.text,
                color: item.status.color,
                backgroundColor: item.status.backgroundColor,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          _buildTable(),
          const SizedBox(height: 16),
          Observer(
            builder: (context) => ChangePageWidget(
                nextPage: store.nextPage,
                previousPage: store.previousPage,
                changeLimit: store.changeLimit,
                firstPage: store.firstPage,
                lastPage: store.lastPage,
                paginationStore: store.pagination),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage();
  }
}
