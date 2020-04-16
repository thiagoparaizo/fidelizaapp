import 'package:fidelizaapp/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  logoff() {
    Modular.get<AuthController>().logOut();
    Modular.to.pushReplacementNamed('/login');
  }
}
