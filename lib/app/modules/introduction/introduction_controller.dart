import 'package:mobx/mobx.dart';

part 'introduction_controller.g.dart';

class IntroductionController = _IntroductionControllerBase
    with _$IntroductionController;

abstract class _IntroductionControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
