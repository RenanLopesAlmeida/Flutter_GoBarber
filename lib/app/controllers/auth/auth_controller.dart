import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gobarber/app/external/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final _authRepository = AuthRepository();

  @observable
  String _userCredential;

  @observable
  bool _isAuthenticated = false;

  bool get isAuthenticated {
    _isAuthenticated = _authRepository.isAuthenticated();
    return _isAuthenticated;
  }

  @action
  Future<void> register(String email, String password) async {
    await _authRepository.register(email, password);
    _isAuthenticated = _authRepository.isAuthenticated();
  }

  @action
  Future<void> login(String email, String password) async {
    await _authRepository.login(email, password);
    _isAuthenticated = _authRepository.isAuthenticated();
  }

  @action
  Future<void> logout() async {
    try {
      await _authRepository.logout();
      _isAuthenticated = _authRepository.isAuthenticated();
    } catch (error) {
      print('logout error no CONTROLLER: $error');
    }
  }
}
