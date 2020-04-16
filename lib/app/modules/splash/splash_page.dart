import 'package:fidelizaapp/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'splash_controller.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  ReactionDisposer disposer;
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3)).then((v) {
      final auth = Modular.get<IAuthRepository>();
      auth.getCurrentUser().then((user) {
        setState(() {
          print('setState');
          if (user != null) {
            _userId = user?.uid;
            print('userID= ${user?.uid}');
          }
          authStatus = user?.uid == null
              ? AuthStatus.NOT_LOGGED_IN
              : AuthStatus.LOGGED_IN;

          if (authStatus == AuthStatus.LOGGED_IN) {
            Modular.to.pushReplacementNamed('/home/');
          } else if (authStatus == AuthStatus.NOT_LOGGED_IN) {
            Modular.to.pushReplacementNamed('/login/');
          } else {
            print('erro verificação login');
          }
        });
      });
    });

    // Future.delayed(Duration(seconds: 3)).then((v) {
    //   //Modular.to.pushReplacementNamed('/home/');
    //   final auth = Modular.get<AuthController>();
    //   print('auth.status: ${auth.status}');
    //   if (auth.status == AuthStatus.login) {
    //     Modular.to.pushReplacementNamed('/home/');
    //   } else if (auth.status == AuthStatus.logoff) {
    //     Modular.to.pushReplacementNamed('/login/');
    //   } else {
    //     print('erro verificação login');
    //   }
    // });

    // disposer = autorun((_) {
    //   final auth = Modular.get<AuthController>();
    //   print('auth.status: ${auth.status}');
    //   if (auth.status == AuthStatus.login) {
    //     Modular.to.pushReplacementNamed('/home/');
    //   } else if (auth.status == AuthStatus.logoff) {
    //     Modular.to.pushReplacementNamed('/home/');
    //   } else {
    //     print('erro verificação login');
    //   }
    // });
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   disposer();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
