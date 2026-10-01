import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/cache/cache_helper.dart';
import 'package:news_app/features/weather_screen/cubits/weather_states.dart';
import '../data/repos/weather_repo.dart';


class WeatherCubit extends Cubit<WeatherStates>{
  WeatherCubit(): super(WeatherInitial());
  static WeatherCubit get(context)=> BlocProvider.of(context);

  WeatherRepo repo = WeatherRepo();
  String? userName;
  double? userLat;
  double? userLon;
  void saveUserData({required String name ,required double lat,required double lon }){
    userName = name;
    userLat = lat;
    userLon = lon;
    CacheHelper.setValue('userName', name);
  }
  fetchWeather() async{
    emit(WeatherLoading());
    var result = await repo.fetchWeather( userLat, userLon);
    result.fold(
            (error) {
          emit(WeatherError(error));
        },
            (model){
          emit(WeatherSuccess(model));
        }
    );
  }


}