import 'package:flutter/material.dart';
import 'package:itunes_video_app/features/authentication/view/signin_page.dart';
import 'package:itunes_video_app/features/authentication/view/signup_page.dart';
import 'package:itunes_video_app/features/home/view/main_page.dart';

import '../../features/onboarding/view/splash_screen.dart';

class AppRoutes {
  MaterialPageRoute? routes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case '/signin':
        return MaterialPageRoute(
          builder: (context) => const SigninPage(),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (context) => const SignupPage(),
        );
      case '/main':
        return MaterialPageRoute(
          builder: (context) => const MainPage(),
        );
      // case '/people':
      //   return MaterialPageRoute(
      //     builder: (context) => const PeoplePage(),
      //   );
      // case '/favorite':
      //   return MaterialPageRoute(
      //     builder: (context) => const FavoritePage(),
      //   );
    }
    return null;
  }
}
