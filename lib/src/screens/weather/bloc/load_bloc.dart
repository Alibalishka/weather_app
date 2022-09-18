// ignore_for_file: unused_local_variable, use_rethrow_when_possible

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather/src/common/models/weather_model.dart';
import 'package:weather/src/common/models/weather_status.dart';

part 'load_event.dart';
part 'load_state.dart';

class LoadBloc extends Bloc<LoadEvent, LoadState> {
  LoadBloc() : super(LoadInitial());

  final Dio dio = Dio();

  @override
  Stream<LoadState> mapEventToState(
    LoadEvent event,
  ) async* {
    if(event is LoadPressed){
      yield LoadLoading();
      // print('Я работаю !!');
      
      try{
        Response response = await dio.get(
          'http://api.weatherapi.com/v1/current.json',
          queryParameters: {
            'key': 'af65b6d7c0e148668ae104414221509',
            'q': event.city,
            'aqi': 'no',
          }
        );
        WeatherModel weatherModel = WeatherModel.fromJson(response.data['current']);
        WeatherStatus weatherStatus = WeatherStatus.fromJson(response.data['current']['condition']);

        // print(weatherModel.temp_c);
        // print(weatherStatus.status);
        // print(weatherStatus.icon);
        
        yield LoadLoaded(temp_c: weatherModel.temp_c, status: weatherStatus.status, image: weatherStatus.icon);
      } on DioError catch(e){
        yield LoadFailed(message: 'Непрвильно ввели названия города!');
        throw e;
      } catch (e){
        yield LoadFailed(message: 'Произошло ошибка!');
        throw e;
      }
    }
  }
}
