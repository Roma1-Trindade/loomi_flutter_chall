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
  String? userNameText;

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
  String setName(String name) => userNameText = name;

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
        userNameText = user!.displayName!;
        errorMessage = '';
        isSuccess = true;
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
  Future<void> signInWithGoogle() async {
    try {
      isLoading = true;
      isSuccess = false;
      isFailure = false;
      errorMessage = '';
      user = await _authRepository.signInWithGoogle();
      if (user != null) {
        userNameText = user!.displayName!;
        errorMessage = '';
        isSuccess = true;
      }
    } catch (e) {
      isFailure = true;
      errorMessage = e.toString();
      print('[error]: $e');
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> changeName({required String name}) async {
    if (user != null) {
      try {
        isLoading = true;
        isSuccess = false;
        isFailure = false;
        errorMessage = '';
        await user?.updateDisplayName(name);
        userNameText = name;
        isSuccess = true;
      } catch (e) {
        e as FirebaseAuthException;
        errorMessage = e.message;
        isFailure = true;
      } finally {
        isLoading = false;
      }
    } else {
      isFailure = true;
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
      await changeName(name: name);
    } catch (e) {
      e as FirebaseAuthException;
      errorMessage = e.message;
      isFailure = true;
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
      isSuccess = true;
    } catch (e) {
      e as FirebaseAuthException;
      errorMessage = e.message;
      isFailure = true;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> deleteAccount() async {
    try {
      isLoading = true;
      isSuccess = false;
      isFailure = false;
      errorMessage = '';
      await _authRepository.deleteAccount();
      user = null;
      userNameText = '';
      isSuccess = true;
    } catch (e) {
      e as FirebaseAuthException;
      errorMessage = e.message;
      isFailure = true;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> changePassword({required String newPassword}) async {
    if (user != null) {
      try {
        isLoading = true;
        isSuccess = false;
        isFailure = false;
        errorMessage = '';
        await user!.updatePassword(newPassword);
        isSuccess = true;
      } catch (e) {
        e as FirebaseAuthException;
        errorMessage = e.message;
        isFailure = true;
      } finally {
        isLoading = false;
      }
    }
  }

  @action
  Future<bool> checkCurrentPassword({required String currentPassword}) async {
    if (user != null) {
      try {
        isLoading = true;
        isSuccess = false;
        isFailure = false;
        errorMessage = '';
        await _authRepository.signInWithEmailAndPassword(
            email: user!.email!, password: currentPassword);
        isSuccess = true;
        return true;
      } catch (e) {
        e as FirebaseAuthException;
        errorMessage = e.message;
        isFailure = true;
        return false;
      } finally {
        isLoading = false;
      }
    } else {
      return false;
    }
  }

  @action
  Future<String?> checkUserPhoto() async {
    if (user != null) {
      return user?.photoURL;
    } else {
      return null;
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
      userNameText = '';
      isSuccess = true;
    } catch (e) {
      e as FirebaseAuthException;
      errorMessage = e.message;
      isFailure = true;
    } finally {
      isLoading = false;
    }
  }

  @computed
  bool get isAuthenticated => user != null;

  @computed
  String get userName => user != null ? user!.displayName! : '';

  void init() {
    user = _authRepository.getCurrentUser();
  }
}
