import 'package:get/get.dart';

import '../mainScreen.dart';
import '../splash/splashScreen.dart';
import 'appRoutes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.main,
      page: () => MainScreen(),
    ),
     GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
    ),
  ];
}
