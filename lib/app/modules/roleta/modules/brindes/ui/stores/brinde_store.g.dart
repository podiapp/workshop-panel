// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brinde_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BrindesStore on _BrindesStoreBase, Store {
  final _$giftsAtom = Atom(name: '_BrindesStoreBase.gifts');

  @override
  List<Gift> get gifts {
    _$giftsAtom.reportRead();
    return super.gifts;
  }

  @override
  set gifts(List<Gift> value) {
    _$giftsAtom.reportWrite(value, super.gifts, () {
      super.gifts = value;
    });
  }

  final _$busyAtom = Atom(name: '_BrindesStoreBase.busy');

  @override
  bool get busy {
    _$busyAtom.reportRead();
    return super.busy;
  }

  @override
  set busy(bool value) {
    _$busyAtom.reportWrite(value, super.busy, () {
      super.busy = value;
    });
  }

  final _$paginationAtom = Atom(name: '_BrindesStoreBase.pagination');

  @override
  PaginationStore get pagination {
    _$paginationAtom.reportRead();
    return super.pagination;
  }

  @override
  set pagination(PaginationStore value) {
    _$paginationAtom.reportWrite(value, super.pagination, () {
      super.pagination = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_BrindesStoreBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$nextPageAsyncAction = AsyncAction('_BrindesStoreBase.nextPage');

  @override
  Future<void> nextPage() {
    return _$nextPageAsyncAction.run(() => super.nextPage());
  }

  final _$previousPageAsyncAction =
      AsyncAction('_BrindesStoreBase.previousPage');

  @override
  Future<void> previousPage() {
    return _$previousPageAsyncAction.run(() => super.previousPage());
  }

  final _$firstPageAsyncAction = AsyncAction('_BrindesStoreBase.firstPage');

  @override
  Future<void> firstPage() {
    return _$firstPageAsyncAction.run(() => super.firstPage());
  }

  final _$lastPageAsyncAction = AsyncAction('_BrindesStoreBase.lastPage');

  @override
  Future<void> lastPage() {
    return _$lastPageAsyncAction.run(() => super.lastPage());
  }

  final _$changeLimitAsyncAction = AsyncAction('_BrindesStoreBase.changeLimit');

  @override
  Future<void> changeLimit(int? value) {
    return _$changeLimitAsyncAction.run(() => super.changeLimit(value));
  }

  final _$fetchBrindesAsyncAction =
      AsyncAction('_BrindesStoreBase.fetchBrindes');

  @override
  Future<bool> fetchBrindes() {
    return _$fetchBrindesAsyncAction.run(() => super.fetchBrindes());
  }

  @override
  String toString() {
    return '''
gifts: ${gifts},
busy: ${busy},
pagination: ${pagination}
    ''';
  }
}
