import 'package:flutter_gobarber/app/external/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final _authRepository = AuthRepository();
  Map<String, dynamic> _userInfo = {};

  @observable
  String _userCredential;

  @observable
  bool _isAuthenticated;

  bool get isAuthenticated => _authRepository.isAuthenticated();

  get userCredential => _userCredential;

  // @action
  // String currentUser() {
  //   return _authRepository.userAuthenticated();
  // }

  @action
  Future<void> register(String email, String password) async {
    await _authRepository.register(email, password);
    _userInfo = await _authRepository.userAuthenticated();
    _isAuthenticated = _authRepository.isAuthenticated();
  }

  @action
  Future<void> login(String email, String password) async {
    await _authRepository.login(email, password);
    _userInfo = await _authRepository.userAuthenticated();
    _isAuthenticated = _authRepository.isAuthenticated();
  }
}
