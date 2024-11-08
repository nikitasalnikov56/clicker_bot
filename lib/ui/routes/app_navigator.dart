import 'package:clicker/ui/pages/home_page/home_page.dart';
import 'package:clicker/ui/pages/splash_screen/splash_screen.dart';
import 'package:clicker/ui/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

abstract class AppNavigator {
  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(path: AppRoutes.splash, builder: (context, state) => const SplashScreen(),),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );

  static GoRouter get router => _router;
}

void navigateToHomePage(){
  AppNavigator._router.go(AppRoutes.home);
}