import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/views/home/home_page.dart';
import 'package:getx_mvvm/views/login/login_page.dart';
import 'package:getx_mvvm/views/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashScreen(),
            transition: Transition.zoom,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RoutesName.loginScrren,
            page: () => const LoginPage(),
            transition: Transition.zoom,
            transitionDuration: const Duration(milliseconds: 750)),
        GetPage(
            name: RoutesName.homeScreen,
            page: () => const HomePage(),
            transition: Transition.zoom,
            transitionDuration: const Duration(milliseconds: 750)),
      ];
}
