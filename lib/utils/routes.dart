import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/login_screen.dart';
import '../pages/spalsh_screen.dart';

class Routes {
  static String splash = '/';

  static String login = '/login';
  static String home = '/home';
  static String busListScreen = '/busListScreen';


  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: login,
      page: () =>  const SignInScreen(),
    ),

  ];
}
