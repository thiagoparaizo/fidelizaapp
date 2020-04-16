import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'repositories/auth_repository_interface.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();

  @observable
  AuthStatus status = AuthStatus.logoff;

  @observable
  FirebaseUser user;

  @action
  setUser(FirebaseUser value) {
    user = value;
    status = user == null ? AuthStatus.logoff : AuthStatus.loading;
  }

  _AuthControllerBase() {
    _authRepository.getUser().then(setUser);
  }

  @action
  Future<String> signIn(String email, String password) async {
    return await _authRepository.signInEmailPassword(email, password);
  }

  @action
  Future<String> signUp(String email, String password) async {
    return await _authRepository.signUpEmailPassword(email, password);
  }

  @action
  Future loginWithGoogle() async {
    user = await _authRepository.getGoogleLogin();
  }

  @action
  Future logOut() async {
    user = await _authRepository.getLogOut();
  }
}

enum AuthStatus { loading, login, logoff }
