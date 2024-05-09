import 'package:firebase_auth/firebase_auth.dart';
import 'package:loomi_flutter_chall/src/auth/domain/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final AuthRepository _authRepository;

  _AuthStoreBase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository {
    init();
  }

  @observable
  User? user;

  @observable
  String? emailText;

  @observable
  String? passwordText;

  @observable
  bool isLoading = false;

  @observable
  bool isSuccess = false;

  @observable
  bool isFailure = false;

  @observable
  String? errorMessage = '';

  @action
  String setEmail(String email) => emailText = email;

  @action
  String setPassword(String password) => passwordText = password;

  @action
  Future<void> signIn({required String email, required String password}) async {
    try {
      isLoading = true;
      isSuccess = false;
      isFailure = false;
      errorMessage = '';
      user = await _authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user != null) {
        isSuccess = true;
        errorMessage = '';
      }
    } catch (e) {
      e as FirebaseAuthException;
      isFailure = true;
      errorMessage = e.message;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      isLoading = true;
      isSuccess = false;
      isFailure = false;
      errorMessage = '';
      user = await _authRepository.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (user != null) {
        try {
          await user?.updateDisplayName(name);
          isSuccess = true;
          errorMessage = '';
        } catch (e) {
          e as FirebaseAuthException;
          isFailure = true;
          errorMessage = e.message;
        }
      } else {
        isFailure = true;
      }
    } catch (e) {
      e as FirebaseAuthException;
      isFailure = true;
      errorMessage = e.message;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> resetPassword({required String email}) async {
    try {
      isLoading = true;
      isSuccess = false;
      isFailure = false;
      errorMessage = '';
      await _authRepository.resetPassword(email: email);
    } catch (e) {
      e as FirebaseAuthException;
      isFailure = true;
      errorMessage = e.message;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> signOut() async {
    try {
      isLoading = true;
      isSuccess = false;
      isFailure = false;
      errorMessage = '';
      await _authRepository.signOut();
      user = null;
      isSuccess = true;
    } catch (e) {
      e as FirebaseAuthException;
      isFailure = true;
      errorMessage = e.message;
    } finally {
      isLoading = false;
    }
  }

  @computed
  bool get isAuthenticated => user != null;

  void init() {
    user = _authRepository.getCurrentUser();
  }
}
