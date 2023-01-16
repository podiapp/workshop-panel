import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:workshop_web/app/modules/roleta/domain/entities/simple_gift.dart';
import 'package:workshop_web/app/modules/roleta/infra/models/simple_gift_model.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/domain/usecases/create_brinde.dart';
import 'package:workshop_web/app/shared/models/enums/status_enum.dart';
import 'package:workshop_web/app/shared/stores/upload_store.dart';

import '../../../../shared/utils.dart';
part 'create_brinde_store.g.dart';

class CreateBrindeStore = _CreateBrindeStoreBase with _$CreateBrindeStore;

abstract class _CreateBrindeStoreBase with Store {
  final CreateBrinde createBrindeUseCase;

  _CreateBrindeStoreBase(this.createBrindeUseCase);

  @observable
  SimpleGift gift = SimpleGiftModel.empty();

  @observable
  bool photoBusy = false, busy = false;

  @action
  void clear() {
    gift = SimpleGiftModel.empty();
    photoBusy = false;
    busy = false;
  }

  @action
  void changeStatus(Status value) {
    gift.status = value;
    gift = gift;
  }

  @action
  void changeQuantity(int value) {
    gift.quantity = value;
    gift = gift;
  }

  @action
  void changeTitle(String value) {
    gift.name = value;
    gift = gift;
  }

  @action
  void changeDescription(String value) {
    gift.description = value;
    gift = gift;
  }

  @action
  Future<void> addImage(DroppedFile file) async {
    photoBusy = true;
    final uploadStore = Modular.get<UploadStore>();
    final url = await uploadStore.savePhoto(file);
    if (!isNull(url)) {
      gift.url = url!;
    }
    gift = gift;
    photoBusy = false;
  }

  @action
  void removeImage() {
    gift.url = "";
    gift = gift;
  }

  @action
  Future<bool> createBrinde() async {
    busy = true;
    final result = await createBrindeUseCase(gift);
    busy = false;
    return result.fold((failure) {
      SnackbarWidget.error("${failure.msg} Code: ${failure.statusCode}");
      return false;
    }, (success) {
      SnackbarWidget.success("O brinde foi criado com sucesso!");
      return success;
    });
  }
}
