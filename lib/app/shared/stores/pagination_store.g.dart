// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaginationStore on _PaginationStoreBase, Store {
  final _$countAtom = Atom(name: '_PaginationStoreBase.count');

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  final _$totalCountAtom = Atom(name: '_PaginationStoreBase.totalCount');

  @override
  int get totalCount {
    _$totalCountAtom.reportRead();
    return super.totalCount;
  }

  @override
  set totalCount(int value) {
    _$totalCountAtom.reportWrite(value, super.totalCount, () {
      super.totalCount = value;
    });
  }

  final _$skipAtom = Atom(name: '_PaginationStoreBase.skip');

  @override
  int get skip {
    _$skipAtom.reportRead();
    return super.skip;
  }

  @override
  set skip(int value) {
    _$skipAtom.reportWrite(value, super.skip, () {
      super.skip = value;
    });
  }

  final _$pageAtom = Atom(name: '_PaginationStoreBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$maxItemsAtom = Atom(name: '_PaginationStoreBase.maxItems');

  @override
  int get maxItems {
    _$maxItemsAtom.reportRead();
    return super.maxItems;
  }

  @override
  set maxItems(int value) {
    _$maxItemsAtom.reportWrite(value, super.maxItems, () {
      super.maxItems = value;
    });
  }

  final _$_PaginationStoreBaseActionController =
      ActionController(name: '_PaginationStoreBase');

  @override
  void reset() {
    final _$actionInfo = _$_PaginationStoreBaseActionController.startAction(
        name: '_PaginationStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$_PaginationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void init({int count = 0, int totalCount = 0}) {
    final _$actionInfo = _$_PaginationStoreBaseActionController.startAction(
        name: '_PaginationStoreBase.init');
    try {
      return super.init(count: count, totalCount: totalCount);
    } finally {
      _$_PaginationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextPage() {
    final _$actionInfo = _$_PaginationStoreBaseActionController.startAction(
        name: '_PaginationStoreBase.nextPage');
    try {
      return super.nextPage();
    } finally {
      _$_PaginationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previousPage() {
    final _$actionInfo = _$_PaginationStoreBaseActionController.startAction(
        name: '_PaginationStoreBase.previousPage');
    try {
      return super.previousPage();
    } finally {
      _$_PaginationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLimit(int limit) {
    final _$actionInfo = _$_PaginationStoreBaseActionController.startAction(
        name: '_PaginationStoreBase.changeLimit');
    try {
      return super.changeLimit(limit);
    } finally {
      _$_PaginationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void firstPage() {
    final _$actionInfo = _$_PaginationStoreBaseActionController.startAction(
        name: '_PaginationStoreBase.firstPage');
    try {
      return super.firstPage();
    } finally {
      _$_PaginationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void lastPage() {
    final _$actionInfo = _$_PaginationStoreBaseActionController.startAction(
        name: '_PaginationStoreBase.lastPage');
    try {
      return super.lastPage();
    } finally {
      _$_PaginationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
count: ${count},
totalCount: ${totalCount},
skip: ${skip},
page: ${page},
maxItems: ${maxItems}
    ''';
  }
}
