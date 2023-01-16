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

  final _formKey = GlobalKey<FormState>();

  Widget _buildForm() {
    final titleStyle = PodiTexts.label3.weightMedium;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(
              builder: (context) => DropzoneWidget(
                image: store.gift.url,
                busy: store.photoBusy,
                isSingleImage: true,
                title: "Imagem",
                onDroppedItem: (v) {
                  store.addImage(v);
                },
                onRemove: (_) {
                  store.removeImage();
                },
                hasButton: false,
                width: 278,
              ),
            ),
            const SizedBox(height: 24),
            Observer(
              builder: (context) => PodiTextFormField(
                label: "Nome",
                isObligatory: true,
                initialValue: store.gift.name,
                onChanged: store.changeTitle,
              ),
            ),
            const SizedBox(height: 24),
            Text("Status", style: titleStyle),
            Observer(
              builder: (context) => Row(
                children: [
                  Radio(
                      value: Status.ativo,
                      groupValue: store.gift.status,
                      onChanged: (v) {
                        if (v != null) store.changeStatus(v);
                      }),
                  const SizedBox(width: 8),
                  Text("Ativo"),
                  const SizedBox(width: 16),
                  Radio(
                      value: Status.rascunho,
                      groupValue: store.gift.status,
                      onChanged: (v) {
                        if (v != null) store.changeStatus(v);
                      }),
                  const SizedBox(width: 8),
                  Text("Rascunho"),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Observer(
              builder: (context) => PodiTextFormField(
                label: "Descrição",
                maxLines: 5,
                initialValue: store.gift.description,
                onChanged: store.changeDescription,
              ),
            ),
            const SizedBox(height: 24),
            Text("Quantidade", style: titleStyle),
            const SizedBox(height: 8),
            Observer(
              builder: (context) => Row(
                children: List<Widget>.generate(10, (index) {
                  return CustomRadioButton(
                    value: index + 1,
                    groupValue: store.gift.quantity,
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => BaseModal(
        title: "Novo brinde",
        busy: store.busy,
        onSaved: () async {
          if (_formKey.currentState?.validate() ?? false) {
            bool result = await store.createBrinde();
            if (result) {
              Modular.to.pop();
            }
          }
        },
        child: _buildForm(),
      ),
    );
  }
}
