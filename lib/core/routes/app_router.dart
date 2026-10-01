import 'package:flutter/material.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/features/artical/views/new_details_screen.dart';
import 'package:news_app/features/home/data/models/article_model.dart';
import 'package:news_app/features/home/views/main_screen.dart';
import 'package:news_app/features/location/views/location_screen.dart';
import 'package:news_app/features/splash_screens/views/splash_screen.dart';
import 'package:news_app/features/welcome/views/welcome_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name){
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case AppRoutes.search:
        return MaterialPageRoute(builder: (_) => const LocationScreen());
      case AppRoutes.article:
        final article = settings.arguments as ArticleModel;
        return MaterialPageRoute(builder: (_) => NewDetailsScreen(article: article));
      case AppRoutes.mainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
        default:
          return MaterialPageRoute(builder: (_) => Scaffold(
            body: Center (child: Text('No route defined for ${settings.name}'),),
          ),
          );

    }
  }
}