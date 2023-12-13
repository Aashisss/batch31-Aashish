import '../../views/cart.dart';
import '../../views/dashboard.dart';
import '../../views/favourite.dart';
import '../../views/home.dart';
import '../../views/login.dart';
import '../../views/register.dart';
import '../../views/settings.dart';
import '../../views/splash.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String dashboardRoute = '/dashboard';
  static const String homeRoute = '/home';
  static const String favoriteRoute = '/favorite';
  static const String cartRoute = '/cart';
  static const String settingRoute = '/setting';

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const Splash(),
      loginRoute: (context) => const Login(),
      registerRoute: (context) => const Register(),
      dashboardRoute: (context) => const DashboardScreen(),
      homeRoute: (context) => const HomeScreen(),
      favoriteRoute: (context) => const FavoriteScreen(),
      cartRoute: (context) => const CartScreen(),
      settingRoute: (context) => const SettingScreen(),
    };
  }
}
