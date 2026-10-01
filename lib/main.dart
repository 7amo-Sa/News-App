import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/routes/app_router.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/features/home/cubits/everything/news_cubit.dart';
import 'package:news_app/features/home/data/repos/news_repo.dart';
import 'package:news_app/features/weather_screen/cubits/weather_cubit.dart';
import 'core/cache/cache_helper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=> NewsCubit(NewsRepo())..fetchNews(),),
      BlocProvider(create: (context)=> WeatherCubit(),),

    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        fontFamily: 'Schibsted Grotesk'
      ),
    ),

    );
  }
}