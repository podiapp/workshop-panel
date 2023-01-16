// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_brinde_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateBrindeStore on _CreateBrindeStoreBase, Store {
  final _$statusAtom = Atom(name: '_CreateBrindeStoreBase.status');

  @override
  Status get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(Status value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$quantityAtom = Atom(name: '_CreateBrindeStoreBase.quantity');

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  final _$_CreateBrindeStoreBaseActionController =
      ActionController(name: '_CreateBrindeStoreBase');

  @override
  void changeStatus(Status value) {
    final _$actionInfo = _$_CreateBrindeStoreBaseActionController.startAction(
        name: '_CreateBrindeStoreBase.changeStatus');
    try {
      return super.changeStatus(value);
    } finally {
      _$_CreateBrindeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeQuantity(int value) {
    final _$actionInfo = _$_CreateBrindeStoreBaseActionController.startAction(
        name: '_CreateBrindeStoreBase.changeQuantity');
    try {
      return super.changeQuantity(value);
    } finally {
      _$_CreateBrindeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
quantity: ${quantity}
    ''';
  }
}
