import 'package:rive/rive.dart';

class RiveUtils {
  static StateMachineController getRiveController(Artboard artboard,
      {StateMachine = "State Machine 1"}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, StateMachine);
    artboard.addController(controller!);
    return controller;
  }
}
