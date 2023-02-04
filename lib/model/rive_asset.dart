import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachinName, title, src;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.title,
      required this.artboard,
      required this.stateMachinName,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}
