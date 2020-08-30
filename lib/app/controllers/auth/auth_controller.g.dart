// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$_userCredentialAtom =
      Atom(name: '_AuthControllerBase._userCredential');

  @override
  String get _userCredential {
    _$_userCredentialAtom.reportRead();
    return super._userCredential;
  }

  @override
  set _userCredential(String value) {
    _$_userCredentialAtom.reportWrite(value, super._userCredential, () {
      super._userCredential = value;
    });
  }

  final _$_isAuthenticatedAtom =
      Atom(name: '_AuthControllerBase._isAuthenticated');

  @override
  bool get _isAuthenticated {
    _$_isAuthenticatedAtom.reportRead();
    return super._isAuthenticated;
  }

  @override
  set _isAuthenticated(bool value) {
    _$_isAuthenticatedAtom.reportWrite(value, super._isAuthenticated, () {
      super._isAuthenticated = value;
    });
  }

  final _$registerAsyncAction = AsyncAction('_AuthControllerBase.register');

  @override
  Future<void> register(String email, String password) {
    return _$registerAsyncAction.run(() => super.register(email, password));
  }

  final _$loginAsyncAction = AsyncAction('_AuthControllerBase.login');

  @override
  Future<void> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
