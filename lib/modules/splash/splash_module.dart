import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/splash_controller.dart';
import 'pages/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
      ];
}
