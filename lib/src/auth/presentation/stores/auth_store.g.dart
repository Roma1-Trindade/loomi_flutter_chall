// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStoreBase, Store {
  Computed<bool>? _$isAuthenticatedComputed;

  @override
  bool get isAuthenticated =>
      (_$isAuthenticatedComputed ??= Computed<bool>(() => super.isAuthenticated,
              name: '_AuthStoreBase.isAuthenticated'))
          .value;

  late final _$userAtom = Atom(name: '_AuthStoreBase.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AuthStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_AuthStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$signInAsyncAction =
      AsyncAction('_AuthStoreBase.signIn', context: context);

  @override
  Future<void> signIn({required String email, required String password}) {
    return _$signInAsyncAction
        .run(() => super.signIn(email: email, password: password));
  }

  late final _$signUpAsyncAction =
      AsyncAction('_AuthStoreBase.signUp', context: context);

  @override
  Future<void> signUp({required String email, required String password}) {
    return _$signUpAsyncAction
        .run(() => super.signUp(email: email, password: password));
  }

  late final _$resetPasswordAsyncAction =
      AsyncAction('_AuthStoreBase.resetPassword', context: context);

  @override
  Future<void> resetPassword({required String email}) {
    return _$resetPasswordAsyncAction
        .run(() => super.resetPassword(email: email));
  }

  late final _$signOutAsyncAction =
      AsyncAction('_AuthStoreBase.signOut', context: context);

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
isAuthenticated: ${isAuthenticated}
    ''';
  }
}