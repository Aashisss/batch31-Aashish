import 'package:hive_and_api_for_class/features/auth/presentation/view/login_view.dart';
import 'package:hive_and_api_for_class/features/auth/presentation/view/register_view.dart';
import 'package:hive_and_api_for_class/features/batch/presentation/view/batch_student.dart';
import 'package:hive_and_api_for_class/features/home/presentation/view/home_view.dart';
import 'package:hive_and_api_for_class/features/map/presentation/view/google_map_view.dart';
import 'package:hive_and_api_for_class/features/splash/presentation/view/splash_view.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String batchStudentRoute = '/batchStudent';
  static const String googleMapRoute = '/googleMap';

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const SplashView(),
      loginRoute: (context) => const LoginView(),
      homeRoute: (context) => const HomeView(),
      registerRoute: (context) => const RegisterView(),
      batchStudentRoute: (context) => const BatchStudentView(null),
      googleMapRoute: (context) => const GoogleMapView(),
    };
  }
}
