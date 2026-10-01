import 'package:flutter/material.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ AppColors.primary,AppColors.secondary],
                stops: [0.1,0.9],
              ),
            ),
          ),
          Positioned(
            top: size.height*0.05,
              left: 0,
              right: 0,
              height: size.height*0.54,
              child: Container(
                padding: EdgeInsets.only(top: size.height*0.05,bottom: size.height*0.05),
                child: Image.asset(AppAssets.welcome,
                fit: BoxFit.cover,
                alignment: Alignment.bottomLeft,),
              ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height*0.50,
              width: double.infinity,
              padding: EdgeInsets.only(top:size.height*0.05,right:size.width*0.08,left:size.width*0.08 ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Text('Get The Latest News \n And Updates',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SchibstedGrotesk',
                    fontSize:27 ,
                    color: Color(0xff231F20),
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                  SizedBox(height: 16,),
                  Text('From Politics to Entertainment:Your One-\nStop Source for Comprehensive Coverage\n of the Latest News and Developments\n Across the Glob will be right on your hand.',

                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SchibstedGrotesk',
                      fontSize:15 ,
                      color: Color(0xff6D6265),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 16,),
                  CustomButton(text: 'Explore',icon: Icons.arrow_forward_sharp ,onPressed:(){
                    Navigator.pushReplacementNamed(context, AppRoutes.search);
                  })
                ],
                

              ),
            ),
          )

        ],
      ),

    );
  }
}
