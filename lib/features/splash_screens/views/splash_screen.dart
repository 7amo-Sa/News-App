import 'package:flutter/material.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/utils/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),(){
      if (context.mounted){
        Navigator.pushReplacementNamed(context, AppRoutes.welcome);
      }
    });
    final double screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Color(0xffE9EEFA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(AppAssets.logo,
            width: screenWidth*0.4,
            fit: BoxFit.contain,
            )
          ],
        ),
      )

    );
  }
}
