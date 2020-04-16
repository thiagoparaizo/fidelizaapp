import 'package:fidelizaapp/app/modules/introduction/introduction_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fidelizaapp/app/modules/introduction/introduction_page.dart';

class IntroductionModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => IntroductionController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => IntroductionPage()),
      ];

  static Inject get to => Inject<IntroductionModule>.of();
}
