import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/widgets/custom_app_bar.dart';
import 'package:news_app/core/widgets/custom_bottom_nav_bar.dart';
import 'package:news_app/core/widgets/custom_button.dart';
import 'package:news_app/features/weather_screen/cubits/weather_cubit.dart';

import '../cubits/weather_states.dart';
class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState(){
    super.initState();
    context.read<WeatherCubit>().fetchWeather();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(size: size),
      body: BlocBuilder<WeatherCubit,WeatherStates>(
        builder: (context,state) {
          if (state is WeatherLoading) {
            return const Center (child: CircularProgressIndicator());
          } else if (state is WeatherSuccess) {
            final weatherData = state.responseModel;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 29, right: 32, left: 32),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${weatherData.name} - ${weatherData.sys?.country}',
                                  style: const TextStyle(
                                    fontFamily: 'SchibstedGrotesk',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 32,
                                    color: Color(0xff231F20),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${weatherData.main?.temp?.round()}\u00B0',
                                  style: const TextStyle(
                                    fontFamily: 'SchibstedGrotesk',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 48,
                                    color: Color(0xff231F20),
                                  ),
                                ),
                                Text(
                                  '${weatherData.weather?[0].main} - ${weatherData.weather?[0].description}',
                                  style: const TextStyle(
                                    fontFamily: 'SchibstedGrotesk',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 32,
                                    color: Color(0xff231F20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 45,
                            child: Image.network(
                              "https://openweathermap.org/img/wn/${weatherData.weather?[0].icon}@4x.png",
                              width: 100,
                              height: 100,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.wb_sunny_rounded, size: 80, color: Colors.yellow),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //      Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text('${weatherData.name} - ${weatherData.sys
                    //                 ?.country}', style: TextStyle(
                    //                 fontFamily: 'SchibstedGrotesk',
                    //                 fontWeight: FontWeight.w500,
                    //                 fontSize: 28,
                    //                 color: Color(0xff231F20),
                    //             ),
                    //             ),
                    //             SizedBox(height: 10,),
                    //             Text('${weatherData.main?.temp?.round()}\u00B0',
                    //               style: TextStyle(
                    //                   fontFamily: 'SchibstedGrotesk',
                    //                   fontWeight: FontWeight.w700,
                    //                   fontSize: 48,
                    //                   color: Color(0xff231F20)
                    //               ),
                    //             ),
                    //             SizedBox(height: 10,),
                    //             Text('${weatherData.weather?[0]
                    //                 .main} - ${weatherData.weather?[0]
                    //                 .description}',
                    //               style: TextStyle(
                    //                   fontFamily: 'SchibstedGrotesk',
                    //                   fontWeight: FontWeight.w500,
                    //                   fontSize: 28,
                    //                   color: Color(0xff231F20)
                    //               ),
                    //             ),
                    //             SizedBox(height: 1,),
                    //             Text('Feels like ${weatherData.main?.feelsLike
                    //                 ?.round()}\u00B0', style: TextStyle(
                    //                 fontFamily: 'SchibstedGrotesk',
                    //                 fontWeight: FontWeight.w600,
                    //                 fontSize: 16,
                    //                 color: Color(0xff6D6265)
                    //             ),
                    //             ),
                    //           ]
                    //       ),
                    //     Image.network("https://openweathermap.org/img/wn/${weatherData.weather?[0].icon}@2x.png",
                    //     )
                    //     // Image.asset('assets/images/sun.png')
                    //   ],
                    // ),
                    SizedBox(height: 30,),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.9,
                      children: [
                        _buildWeatherDetailCard(Icons.thermostat, "Fahrenheit",
                            "${weatherData.main?.tempMax?.round()}°"),
                        _buildWeatherDetailCard(Icons.air, "Pressure",
                          "${weatherData.main?.pressure}mp/h",),
                        _buildWeatherDetailCard(
                          Icons.wb_sunny_outlined, "UV Index", "0.2",),
                        _buildWeatherDetailCard(
                          Icons.water_drop_outlined, "Humidity",
                          "${weatherData.main?.humidity}%",),
                      ],
                    ),
                    SizedBox(height: 50,),
                    CustomButton(text: 'Change Location', onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.search);
                    }, icon: Icons.location_on,)
                  ],
                ),
              ),
            );
          } else if (state is WeatherError) {
            return Center(child: Text("Error: ${state.error}"),);
          }
          return const Center (child: Text("Select location first"));
        },
      ),

    );
  }

  Widget _buildWeatherDetailCard(
      IconData icon,
      String label,
      String value,
      ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 45,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff2D5BD0),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffA098AE),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
