import 'package:dartz/dartz.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';
import '../models/weather_model.dart';

class WeatherRepo{
  var apiHelper = WeatherAPIHelper();

  Future<Either<String, WeatherModel>> fetchWeather(double? lat,double?lon) async
  {
    try{
      var result = await apiHelper.getRequest(
          endPoint: EndPoints.weather,
          queryParams: {
            'lat': lat ?? 30.5877893,
            'lon': lon ?? 31.4798788,
            'units': 'metric',
          }
      );
      if(result.status){
        var responseModel = WeatherModel.fromJson(result.data as Map<String, dynamic>);
        return Right(responseModel);

      }
      else{
        return left(result.message);
      }

    }
    catch(e){
      return left(ApiResponse.fromError(e).message);
    }
  }


}