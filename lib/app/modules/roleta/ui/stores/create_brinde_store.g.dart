// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_brinde_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateBrindeStore on _CreateBrindeStoreBase, Store {
  final _$giftAtom = Atom(name: '_CreateBrindeStoreBase.gift');

  @override
  SimpleGift get gift {
    _$giftAtom.reportRead();
    return super.gift;
  }

  @override
  set gift(SimpleGift value) {
    _$giftAtom.reportWrite(value, super.gift, () {
      super.gift = value;
    });
  }

  final _$photoBusyAtom = Atom(name: '_CreateBrindeStoreBase.photoBusy');

  @override
  bool get photoBusy {
    _$photoBusyAtom.reportRead();
    return super.photoBusy;
  }

  @override
  set photoBusy(bool value) {
    _$photoBusyAtom.reportWrite(value, super.photoBusy, () {
      super.photoBusy = value;
    });
  }

  final _$busyAtom = Atom(name: '_CreateBrindeStoreBase.busy');

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

  final _$addImageAsyncAction = AsyncAction('_CreateBrindeStoreBase.addImage');

  @override
  Future<void> addImage(DroppedFile file) {
    return _$addImageAsyncAction.run(() => super.addImage(file));
  }

  final _$createBrindeAsyncAction =
      AsyncAction('_CreateBrindeStoreBase.createBrinde');

  @override
  Future<bool> createBrinde() {
    return _$createBrindeAsyncAction.run(() => super.createBrinde());
  }

  final _$_CreateBrindeStoreBaseActionController =
      ActionController(name: '_CreateBrindeStoreBase');

  @override
  void clear() {
    final _$actionInfo = _$_CreateBrindeStoreBaseActionController.startAction(
        name: '_CreateBrindeStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$_CreateBrindeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void changeTitle(String value) {
    final _$actionInfo = _$_CreateBrindeStoreBaseActionController.startAction(
        name: '_CreateBrindeStoreBase.changeTitle');
    try {
      return super.changeTitle(value);
    } finally {
      _$_CreateBrindeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDescription(String value) {
    final _$actionInfo = _$_CreateBrindeStoreBaseActionController.startAction(
        name: '_CreateBrindeStoreBase.changeDescription');
    try {
      return super.changeDescription(value);
    } finally {
      _$_CreateBrindeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeImage() {
    final _$actionInfo = _$_CreateBrindeStoreBaseActionController.startAction(
        name: '_CreateBrindeStoreBase.removeImage');
    try {
      return super.removeImage();
    } finally {
      _$_CreateBrindeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gift: ${gift},
photoBusy: ${photoBusy},
busy: ${busy}
    ''';
  }
}
