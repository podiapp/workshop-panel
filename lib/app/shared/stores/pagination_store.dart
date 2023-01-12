import 'package:mobx/mobx.dart';
part 'pagination_store.g.dart';

class PaginationStore = _PaginationStoreBase with _$PaginationStore;

abstract class _PaginationStoreBase with Store {
  @observable
  int count = 0, totalCount = 0;

  @observable
  int skip = 0, page = 0, maxItems = 10;

  @action
  void reset() {
    count = 0;
    totalCount = 0;
    skip = 0;
    page = 0;
    maxItems = 10;
  }

  @action
  void init({
    int count = 0,
    int totalCount = 0,
  }) {
    this.count = count;
    this.totalCount = totalCount;
  }

  @action
  void nextPage() {
    page += maxItems;
    if (page > 0) {
      skip += maxItems;
    }
  }

  @action
  void previousPage() {
    page -= maxItems;
    if (skip > 0) {
      skip -= maxItems;
    }
  }

  @action
  void changeLimit(int limit) {
    page = 0;
    skip = 0;
    maxItems = limit;
  }

  @action
  void firstPage() {
    page = 0;
    skip = 0;
  }

  @action
  void lastPage() {
    page = totalCount - (totalCount % maxItems);
    skip = totalCount - (totalCount % maxItems);
  }
}
