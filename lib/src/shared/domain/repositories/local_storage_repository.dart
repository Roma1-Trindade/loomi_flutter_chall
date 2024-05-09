import 'package:loomi_flutter_chall/src/shared/data/miscelaneous/maybe.dart';
import 'package:loomi_flutter_chall/src/shared/data/miscelaneous/result.dart';
import 'package:loomi_flutter_chall/src/shared/data/miscelaneous/storage_keys.dart';

abstract class LocalStorageRepository {
  Future<Result> write<T>({
    required StorageKey key,
    Maybe<T> value = const Maybe.nothing(),
  });
  Future<Result<T>> read<T>({required StorageKey key});
  Future<Result> delete({required StorageKey key});
  Future<Result> deleteAll();
}
