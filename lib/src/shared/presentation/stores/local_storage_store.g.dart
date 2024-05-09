// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_storage_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocalStorageStore on _LocalStorageStoreBase, Store {
  late final _$dataAtom =
      Atom(name: '_LocalStorageStoreBase.data', context: context);

  @override
  ObservableMap<StorageKey, dynamic> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ObservableMap<StorageKey, dynamic> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$writeDataAsyncAction =
      AsyncAction('_LocalStorageStoreBase.writeData', context: context);

  @override
  Future<void> writeData<T>({required StorageKey key, required T value}) {
    return _$writeDataAsyncAction
        .run(() => super.writeData<T>(key: key, value: value));
  }

  late final _$readDataAsyncAction =
      AsyncAction('_LocalStorageStoreBase.readData', context: context);

  @override
  Future<void> readData<T>({required StorageKey key}) {
    return _$readDataAsyncAction.run(() => super.readData<T>(key: key));
  }

  late final _$deleteDataAsyncAction =
      AsyncAction('_LocalStorageStoreBase.deleteData', context: context);

  @override
  Future<void> deleteData({required StorageKey key}) {
    return _$deleteDataAsyncAction.run(() => super.deleteData(key: key));
  }

  late final _$deleteAllDataAsyncAction =
      AsyncAction('_LocalStorageStoreBase.deleteAllData', context: context);

  @override
  Future<void> deleteAllData() {
    return _$deleteAllDataAsyncAction.run(() => super.deleteAllData());
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
