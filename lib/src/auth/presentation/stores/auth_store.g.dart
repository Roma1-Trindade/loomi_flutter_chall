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
  Computed<String>? _$userNameComputed;

  @override
  String get userName =>
      (_$userNameComputed ??= Computed<String>(() => super.userName,
              name: '_AuthStoreBase.userName'))
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

  late final _$emailTextAtom =
      Atom(name: '_AuthStoreBase.emailText', context: context);

  @override
  String? get emailText {
    _$emailTextAtom.reportRead();
    return super.emailText;
  }

  @override
  set emailText(String? value) {
    _$emailTextAtom.reportWrite(value, super.emailText, () {
      super.emailText = value;
    });
  }

  late final _$passwordTextAtom =
      Atom(name: '_AuthStoreBase.passwordText', context: context);

  @override
  String? get passwordText {
    _$passwordTextAtom.reportRead();
    return super.passwordText;
  }

  @override
  set passwordText(String? value) {
    _$passwordTextAtom.reportWrite(value, super.passwordText, () {
      super.passwordText = value;
    });
  }

  late final _$userNameTextAtom =
      Atom(name: '_AuthStoreBase.userNameText', context: context);

  @override
  String? get userNameText {
    _$userNameTextAtom.reportRead();
    return super.userNameText;
  }

  @override
  set userNameText(String? value) {
    _$userNameTextAtom.reportWrite(value, super.userNameText, () {
      super.userNameText = value;
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

  late final _$isSuccessAtom =
      Atom(name: '_AuthStoreBase.isSuccess', context: context);

  @override
  bool get isSuccess {
    _$isSuccessAtom.reportRead();
    return super.isSuccess;
  }

  @override
  set isSuccess(bool value) {
    _$isSuccessAtom.reportWrite(value, super.isSuccess, () {
      super.isSuccess = value;
    });
  }

  late final _$isFailureAtom =
      Atom(name: '_AuthStoreBase.isFailure', context: context);

  @override
  bool get isFailure {
    _$isFailureAtom.reportRead();
    return super.isFailure;
  }

  @override
  set isFailure(bool value) {
    _$isFailureAtom.reportWrite(value, super.isFailure, () {
      super.isFailure = value;
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

  late final _$signInWithGoogleAsyncAction =
      AsyncAction('_AuthStoreBase.signInWithGoogle', context: context);

  @override
  Future<void> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  late final _$changeNameAsyncAction =
      AsyncAction('_AuthStoreBase.changeName', context: context);

  @override
  Future<void> changeName({required String name}) {
    return _$changeNameAsyncAction.run(() => super.changeName(name: name));
  }

  late final _$signUpAsyncAction =
      AsyncAction('_AuthStoreBase.signUp', context: context);

  @override
  Future<void> signUp(
      {required String email, required String password, required String name}) {
    return _$signUpAsyncAction
        .run(() => super.signUp(email: email, password: password, name: name));
  }

  late final _$resetPasswordAsyncAction =
      AsyncAction('_AuthStoreBase.resetPassword', context: context);

  @override
  Future<void> resetPassword({required String email}) {
    return _$resetPasswordAsyncAction
        .run(() => super.resetPassword(email: email));
  }

  late final _$deleteAccountAsyncAction =
      AsyncAction('_AuthStoreBase.deleteAccount', context: context);

  @override
  Future<void> deleteAccount() {
    return _$deleteAccountAsyncAction.run(() => super.deleteAccount());
  }

  late final _$changePasswordAsyncAction =
      AsyncAction('_AuthStoreBase.changePassword', context: context);

  @override
  Future<void> changePassword({required String newPassword}) {
    return _$changePasswordAsyncAction
        .run(() => super.changePassword(newPassword: newPassword));
  }

  late final _$checkCurrentPasswordAsyncAction =
      AsyncAction('_AuthStoreBase.checkCurrentPassword', context: context);

  @override
  Future<bool> checkCurrentPassword({required String currentPassword}) {
    return _$checkCurrentPasswordAsyncAction.run(
        () => super.checkCurrentPassword(currentPassword: currentPassword));
  }

  late final _$checkUserPhotoAsyncAction =
      AsyncAction('_AuthStoreBase.checkUserPhoto', context: context);

  @override
  Future<String?> checkUserPhoto() {
    return _$checkUserPhotoAsyncAction.run(() => super.checkUserPhoto());
  }

  late final _$signOutAsyncAction =
      AsyncAction('_AuthStoreBase.signOut', context: context);

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  late final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase', context: context);

  @override
  String setEmail(String email) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String setPassword(String password) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String setName(String name) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setName');
    try {
      return super.setName(name);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
emailText: ${emailText},
passwordText: ${passwordText},
userNameText: ${userNameText},
isLoading: ${isLoading},
isSuccess: ${isSuccess},
isFailure: ${isFailure},
errorMessage: ${errorMessage},
isAuthenticated: ${isAuthenticated},
userName: ${userName}
    ''';
  }
}
