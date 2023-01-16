import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:workshop_web/app/modules/roleta/modules/brindes/domain/usecases/fetch_brindes.dart';
import 'package:workshop_web/app/shared/stores/pagination_store.dart';

import '../../../../../../shared/utils.dart';
import '../../domain/entities/gift.dart';
part 'brinde_store.g.dart';

class BrindesStore = _BrindesStoreBase with _$BrindesStore;

abstract class _BrindesStoreBase with Store {
  final FetchBrindes fetchBrindesUseCase;

  _BrindesStoreBase(this.fetchBrindesUseCase);

  @observable
  List<Gift> gifts = ObservableList();

  @observable
  bool busy = false;

  @observable
  PaginationStore pagination = Modular.get<PaginationStore>();

  @action
  Future<void> init() async {
    gifts.clear();
    pagination.reset();
    fetchBrindes();
  }

  @action
  Future<void> nextPage() async {
    pagination.nextPage();
    await fetchBrindes();
  }

  @action
  Future<void> previousPage() async {
    pagination.previousPage();
    await fetchBrindes();
  }

  @action
  Future<void> firstPage() async {
    pagination.firstPage();
    await fetchBrindes();
  }

  @action
  Future<void> lastPage() async {
    pagination.lastPage();
    await fetchBrindes();
  }

  @action
  Future<void> changeLimit(int? value) async {
    pagination.changeLimit(value ?? 10);
    await fetchBrindes();
  }

  @action
  Future<bool> fetchBrindes() async {
    busy = true;
    final filters = {
      "take": pagination.maxItems,
      "skip": pagination.skip,
    };
    final result = await fetchBrindesUseCase(filters, pagination);
    busy = false;
    return result.fold((failure) {
      SnackbarWidget.error("${failure.msg} Code: ${failure.statusCode}");
      return false;
    }, (success) {
      gifts.clear();
      gifts.addAll(success);
      gifts = gifts;
      return true;
    });
  }
}
