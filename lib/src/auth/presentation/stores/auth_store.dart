import 'package:firebase_auth/firebase_auth.dart';
import 'package:loomi_flutter_chall/src/auth/domain/repositories/auth_repository.dart';
import 'package:loomi_flutter_chall/src/shared/design_system/widgets/dialogs/loomi_notification.dart';
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
  bool isLoading = false;

  @observable
  String? errorMessage = '';

  @action
  Future<void> signIn({required String email, required String password}) async {
    try {
      isLoading = true;
      user = await _authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      errorMessage = e.toString();
      LoomiNotification.showNotification('SignIn error!', e.toString());
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> signUp({required String email, required String password}) async {
    try {
      isLoading = true;
      user = await _authRepository.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      errorMessage = e.toString();
      LoomiNotification.showNotification('SignUp error!', e.toString());
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> resetPassword({required String email}) async {
    try {
      isLoading = true;
      await _authRepository.resetPassword(email: email);
    } catch (e) {
      errorMessage = e.toString();
      LoomiNotification.showNotification('SignUp error!', e.toString());
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
