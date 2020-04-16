import 'package:dio/dio.dart';
import 'package:fidelizaapp/app/app_controller.dart';
import 'package:fidelizaapp/app/modules/introduction/introduction_module.dart';
import 'package:fidelizaapp/app/modules/profile/profile_module.dart';
import 'package:fidelizaapp/app/modules/splash/splash_controller.dart';
import 'package:fidelizaapp/app/modules/splash/splash_module.dart';
import 'package:fidelizaapp/app/repositories/promocao_repository.dart';
import 'package:fidelizaapp/app/repositories/usuario_repository.dart';
import 'package:fidelizaapp/app/shared/auth/auth_controller.dart';
import 'package:fidelizaapp/app/shared/auth/repositories/auth_repository.dart';
import 'package:fidelizaapp/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:fidelizaapp/app/shared/repositories/local_storage_hive.dart';
import 'package:fidelizaapp/app/shared/utils/constants.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:fidelizaapp/app/app_widget.dart';
import 'package:fidelizaapp/app/modules/home/home_module.dart';

import 'modules/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
        Bind((i) => LocalStorageHive()),
        Bind((i) => SplashController()),
        Bind((i) => AppController()),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
        Bind((i) => UsuarioRepository()),
        Bind((i) => PromocaoRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: SplashModule()),
        Router('/intro', module: IntroductionModule()),
        Router('/login', module: LoginModule()),
        Router('/home', module: HomeModule()),
        Router('/profile', module: ProfileModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
