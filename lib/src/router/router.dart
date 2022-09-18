import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/router/routing_constant.dart';
import 'package:weather/src/screens/weather/bloc/load_bloc.dart';
import 'package:weather/src/screens/weather/weather_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case MainRoute:
        return CupertinoPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoadBloc(),
            child: const WeatherScreen(),
          ),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => const  WeatherScreen(),
        );
    }
  }
}