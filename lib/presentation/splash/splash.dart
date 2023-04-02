import 'dart:async';

import 'package:flutter/material.dart';

import '/app/app_prefs.dart';
import '/app/di.dart';
import '/presentation/resources/assets_manager.dart';
import '/presentation/resources/color_manager.dart';
import '/presentation/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  AppPreferences _appPreferences = instance<AppPreferences>();

  _startDelay() {
    _timer = Timer(Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
          if (isUserLoggedIn)
            {
              //navigate to the main screen
              Navigator.pushReplacementNamed(context, Routes.mainRoute),
            }
          else
            {
              _appPreferences
                  .isOnBoardingScreenViewed()
                  .then((isOnBoardingScreenViewed) => {
                        if (isOnBoardingScreenViewed)
                          {
                            Navigator.pushReplacementNamed(
                                context, Routes.loginRoute),
                          }
                        else
                          {
                            Navigator.pushReplacementNamed(
                                context, Routes.onBoardingRoute),
                          }
                      })
            }
        });
    //
  }

  @override
  void initState() {
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
          child: Image(
        image: AssetImage(
          ImageAssets.splashLogo,
        ),
      )),
    );
  }
}
