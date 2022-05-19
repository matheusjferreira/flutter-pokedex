import 'package:flutter_modular/flutter_modular.dart';

class SplashController {
  load() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Modular.to.navigate('/home/'));
  }
}
