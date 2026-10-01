import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/features/weather_screen/cubits/weather_cubit.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/custom_button.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController _usernameController = TextEditingController();
  LatLng _selectedLocation = const LatLng(30.0444, 31.2357);
  @override
  void dispose(){
    _usernameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
             Container(
               margin: EdgeInsets.only(top:35 ,bottom:16,right: 30,left: 30),
               width: 362,
                height: 43,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(0xffF0EFF0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(fontWeight: FontWeight.w400,
                           fontFamily:  'SchibstedGrotesk',
                            fontSize:13 ,
                            color: Color(0xff000000),),
                    prefixIcon: const Icon(Icons.person_outline_rounded, size: 20,),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 11),
                  ),

                  ),
                ),

            Expanded(
              child: Stack(
                children: [
                 GoogleMap(initialCameraPosition: CameraPosition(target: _selectedLocation,
                     zoom:12, ),
                   onTap: (LatLng location){
                   setState(() {
                     _selectedLocation = location;
                   });
                   },
                   markers: {
                   Marker(
                     markerId: const MarkerId('selected_location'),
                     position: _selectedLocation,
                   ),
                   },
                 ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CustomButton(
                        text: "Get Started",
                        onPressed: () {
                          if(_usernameController.text.isNotEmpty){
                            context.read<WeatherCubit>().saveUserData(
                              name: _usernameController.text,
                              lat: _selectedLocation.latitude,
                              lon: _selectedLocation.longitude,
                            );
                            Navigator.pushReplacementNamed(context, AppRoutes.mainScreen);
                          } else{
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter your username')),
                            );
                          }


                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
