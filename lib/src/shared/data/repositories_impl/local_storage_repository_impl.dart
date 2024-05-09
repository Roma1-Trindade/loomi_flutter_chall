import 'package:loomi_flutter_chall/src/shared/data/miscelaneous/maybe.dart';
import 'package:loomi_flutter_chall/src/shared/data/miscelaneous/result.dart';
import 'package:loomi_flutter_chall/src/shared/data/miscelaneous/storage_keys.dart';
import 'package:loomi_flutter_chall/src/shared/domain/repositories/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  final Future<SharedPreferences> _futureSharedPreferences;
  LocalStorageRepositoryImpl({
    required Future<SharedPreferences> futureSharedPreferences,
  }) : _futureSharedPreferences = futureSharedPreferences;

  @override
  Future<Result> write<T>({
    required StorageKey key,
    Maybe<T> value = const Maybe.nothing(),
  }) async {
    try {
      if (value.isNothing) {
        (await _futureSharedPreferences).remove(key.toString());
      } else {
        if (T is int) {
          (await _futureSharedPreferences)
              .setInt(key.toString(), value.value as int);
        } else if (T is double) {
          (await _futureSharedPreferences)
              .setDouble(key.toString(), value.value as double);
        } else if (T is bool) {
          (await _futureSharedPreferences)
              .setBool(key.toString(), value.value as bool);
        } else if (T is String) {
          (await _futureSharedPreferences)
              .setString(key.toString(), value.value as String);
        } else if (T is List<String>) {
          (await _futureSharedPreferences)
              .setStringList(key.toString(), value.value as List<String>);
        }
      }
      return Result(success: true);
    } catch (e) {
      return Result(success: false, errorMessage: e.toString());
    }
  }

  @override
  Future<Result<T>> read<T>({required StorageKey key}) async {
    try {
      if (!(await _futureSharedPreferences).containsKey(key.toString())) {
        return Result(success: false, errorMessage: 'Key not found');
      }
      T? value;
      if (T == int) {
        value = (await _futureSharedPreferences).getInt(key.toString()) as T?;
      } else if (T == double) {
        value =
            (await _futureSharedPreferences).getDouble(key.toString()) as T?;
      } else if (T == bool) {
        value = (await _futureSharedPreferences).getBool(key.toString()) as T?;
      } else if (T == String) {
        value =
            (await _futureSharedPreferences).getString(key.toString()) as T?;
      } else if (T == List<String>) {
        value = (await _futureSharedPreferences).getStringList(key.toString())
            as T?;
      }
      return Result(success: true, value: value);
    } catch (e) {
      return Result(success: false, errorMessage: e.toString());
    }
  }

  @override
  Future<Result> delete({required StorageKey key}) async {
    try {
      (await _futureSharedPreferences).remove(key.toString());
      return Result(success: true);
    } catch (e) {
      return Result(success: false, errorMessage: e.toString());
    }
  }

  @override
  Future<Result> deleteAll() async {
    try {
      (await _futureSharedPreferences).clear();
      return Result(success: true);
    } catch (e) {
      return Result(success: false, errorMessage: e.toString());
    }
  }
}
