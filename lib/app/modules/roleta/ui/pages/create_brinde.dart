import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_web/app/modules/roleta/ui/stores/create_brinde_store.dart';
import 'package:workshop_web/app/shared/components/base_modal.dart';
import 'package:workshop_web/app/shared/components/custom_radio_button_widget.dart';
import 'package:workshop_web/app/shared/models/enums/status_enum.dart';
import 'package:workshop_web/app/shared/utils.dart';

class CreateBrindeModal extends StatelessWidget {
  CreateBrindeModal({super.key});

  final store = Modular.get<CreateBrindeStore>();

  Widget _buildForm() {
    final titleStyle = PodiTexts.label3.weightMedium;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PodiTextFormField(label: "Nome"),
          const SizedBox(height: 24),
          Text("Status", style: titleStyle),
          Observer(
            builder: (context) => Row(
              children: [
                Radio(
                    value: Status.ativo,
                    groupValue: store.status,
                    onChanged: (v) {
                      if (v != null) store.changeStatus(v);
                    }),
                const SizedBox(width: 8),
                Text("Ativo"),
                const SizedBox(width: 16),
                Radio(
                    value: Status.rascunho,
                    groupValue: store.status,
                    onChanged: (v) {
                      if (v != null) store.changeStatus(v);
                    }),
                const SizedBox(width: 8),
                Text("Rascunho"),
              ],
            ),
          ),
          const SizedBox(height: 24),
          PodiTextFormField(),
          const SizedBox(height: 24),
          Text("Quantidade", style: titleStyle),
          const SizedBox(height: 8),
          Observer(
            builder: (context) => Row(
              children: List<Widget>.generate(10, (index) {
                return CustomRadioButton(
                  value: index + 1,
                  groupValue: store.quantity,
                  onChanged: (v) {
                    if (v != null) store.changeQuantity(v);
                  },
                  text: (index + 1).toString(),
                  height: 40,
                  width: 40,
                  selectedColor: PodiColors.neutrals[500]!,
                  borderColor: PodiColors.neutrals[200]!,
                );
              }).separatedBy(const SizedBox(width: 16)),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Quanto menor o número mais fácil e com mais frequência - quanto maior o número mais dificil e menos frequente o brinde aparecerá na roleta.",
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      title: "Novo brinde",
      onSaved: () {},
      child: _buildForm(),
    );
  }
}
