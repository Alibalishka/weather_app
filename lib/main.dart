import 'package:flutter/cupertino.dart';
import 'package:weather/src/router/router.dart';
import 'package:weather/src/router/routing_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: MainRoute,
    );
  }
}