import 'package:flutter/material.dart';
import 'package:easply/presentation/pages/splash/splash_page.dart';
import 'package:easply/presentation/pages/auth/login_page.dart';
import 'package:easply/presentation/widgets/main_navigation.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const main = '/main';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashPage(),
    login: (context) => const LoginPage(),
    main: (context) => const MainNavigation(),
  };
}
