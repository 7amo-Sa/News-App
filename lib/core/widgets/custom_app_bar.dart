import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/features/weather_screen/cubits/weather_cubit.dart';
import 'package:news_app/features/weather_screen/cubits/weather_states.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size size;
  const CustomAppBar({super.key, required this.size});

  String getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning,';
    } else if (hour < 17) {
      return 'Good Afternoon,';
    } else {
      return 'Good Evening,';
    }
  }
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEE d MMMM, yyyy').format(DateTime.now());
    return AppBar(
      backgroundColor: AppColors.secondary,
      toolbarHeight: size.height * 0.13,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.05,
            bottom: size.height * 0.009,
            right: size.width * 0.03,
            left: size.width * 0.03),
        child: BlocBuilder<WeatherCubit, WeatherStates>(
          builder: (context, state) {
            String userName = context.read<WeatherCubit>().userName ?? "User";
            String temp = "--";
            String condition = "Weather";
            String iconCode = "01d";

            if (state is WeatherSuccess) {
              temp = "${state.responseModel.main?.temp?.round()}";
              condition = "${state.responseModel.weather?[0].main}";
              iconCode = state.responseModel.weather?[0].icon ?? "01d";
            }

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${getGreeting()}\n$userName',
                      style: const TextStyle(
                        fontFamily: 'SchibstedGrotesk',
                        fontSize: 14,
                        color: Color(0xff6D6265),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: size.height * 0.005),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        fontFamily: 'SchibstedGrotesk',
                        fontSize: 16,
                        color: Color(0xff231F20),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.network(
                      "https://openweathermap.org/img/wn/$iconCode.png",
                      width: 40,
                      height: 40,
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.wb_sunny, color: Colors.amberAccent, size: 30),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$condition $temp\u00B0C',
                      style: const TextStyle(
                        fontFamily: 'SchibstedGrotesk',
                        fontSize: 14,
                        color: Color(0xff6D6265),
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(size.height * 0.13);
}
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final Size size;
//   const CustomAppBar({super.key,
//   required this.size});
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return AppBar(
//       backgroundColor: AppColors.secondary,
//       toolbarHeight:size.height*0.13 ,
//       title: Padding(
//         padding: EdgeInsets.only(top:size.height*0.05 ,bottom:size.height*0.009,
//             right:size.width*0.03 ,left:size.width*0.03 ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Good Morning,\nMariam Abu Muslim',
//                   style:  TextStyle(
//                     fontFamily: 'SchibstedGrotesk',
//                     fontSize:15 ,
//                     color: Color(0xff6D6265),
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 SizedBox(height: size.height*0.005, ),
//                 Text('Sun 9 April, 2023',
//                   style:  TextStyle(
//                     fontFamily: 'SchibstedGrotesk',
//                     fontSize:17 ,
//                     color: Color(0xff231F20),
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Icon(Icons.sunny,color: Colors.amberAccent,size: 32,),
//                 SizedBox(width: size.width*0.02,),
//                 Text('Sunny 32°C',
//                   style:  TextStyle(
//                     fontFamily: 'SchibstedGrotesk',
//                     fontSize:15 ,
//                     color: Color(0xff6D6265),
//                     fontWeight: FontWeight.w800,
//                   ),)
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   @override
//   Size get preferredSize => Size.fromHeight(size.height*0.13);
// }
