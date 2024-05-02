import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_chall/src/auth/data/repositories_impl/auth_repository_impl.dart';
import 'package:loomi_flutter_chall/src/auth/domain/repositories/auth_repository.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(FirebaseAuth.instance));
}
