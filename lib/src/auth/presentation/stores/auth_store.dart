import 'package:firebase_auth/firebase_auth.dart';
import 'package:loomi_flutter_chall/src/auth/domain/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final AuthRepository _authRepository;

  _AuthStoreBase(
    this._authRepository,
  ) {
    init();
  }

  @observable
  User? user;

  @observable
  bool isLoading = false;

  @action
  Future<void> signIn(String email, String password) async {
    try {
      isLoading = true;
      user = await _authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> signUp(String email, String password) async {
    try {
      isLoading = true;
      user = await _authRepository.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> signOut() async {
    try {
      isLoading = true;
      await _authRepository.signOut();
      user = null;
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
