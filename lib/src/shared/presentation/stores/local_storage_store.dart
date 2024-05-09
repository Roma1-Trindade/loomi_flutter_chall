import 'package:loomi_flutter_chall/src/shared/data/miscelaneous/maybe.dart';
import 'package:loomi_flutter_chall/src/shared/data/miscelaneous/storage_keys.dart';
import 'package:loomi_flutter_chall/src/shared/domain/repositories/local_storage_repository.dart';
import 'package:mobx/mobx.dart';

part 'local_storage_store.g.dart';

class LocalStorageStore = _LocalStorageStoreBase with _$LocalStorageStore;

abstract class _LocalStorageStoreBase with Store {
  final LocalStorageRepository _localStorageRepository;

  _LocalStorageStoreBase({
    required LocalStorageRepository localStorageRepository,
  }) : _localStorageRepository = localStorageRepository;

  @observable
  ObservableMap<StorageKey, dynamic> data = ObservableMap();

  @action
  Future<void> writeData<T>({
    required StorageKey key,
    required T value,
  }) async {
    final result =
        await _localStorageRepository.write(key: key, value: Maybe(value));
    if (result.success) {
      data[key] = value;
    } else {
      // Tratar erro, se necessário
    }
  }

  @action
  Future<void> readData<T>({required StorageKey key}) async {
    final result = await _localStorageRepository.read<T>(key: key);
    if (result.success) {
      data[key] = result.value;
    } else {
      // Tratar erro, se necessário
    }
  }

  @action
  Future<void> deleteData({required StorageKey key}) async {
    final result = await _localStorageRepository.delete(key: key);
    if (result.success) {
      data.remove(key);
    } else {
      // Tratar erro, se necessário
    }
  }

  @action
  Future<void> deleteAllData() async {
    final result = await _localStorageRepository.deleteAll();
    if (result.success) {
      data.clear();
    } else {
      // Tratar erro, se necessário
    }
  }
}
