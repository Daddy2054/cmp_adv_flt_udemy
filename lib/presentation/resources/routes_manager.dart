import 'package:cmp_adv_flt_udemy/presentation/forgot_password/forgot_password.dart';
import 'package:cmp_adv_flt_udemy/presentation/main/main_view.dart';
import 'package:cmp_adv_flt_udemy/presentation/onboarding/onboarding.dart';
import 'package:cmp_adv_flt_udemy/presentation/register/register.dart';
import 'package:cmp_adv_flt_udemy/presentation/store_details/store_details.dart';

import '../login/login.dart';
import '../splash/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/storeDetails';
  static const String forgotPasswordRoute = '/forgotPassword';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => SplashView(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
        );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (_) => OnBoardingView(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => RegisterView(),
        );
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordView(),
        );
      case Routes.mainRoute:
        return MaterialPageRoute(
          builder: (_) => MainView(),
        );
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => StoreDetailsView(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('No Route Found'),
              ),
              body: Center(
                child: Text('No Route Found'),
              ),
            ));
  }
}
