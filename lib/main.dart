import 'package:flutter/material.dart';
import 'package:movie_app/injection.dart' as di;
import 'package:movie_app/src/presentation/screens/home_screen.dart';

import 'routes.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moviezz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue, fontFamily: 'Mulish'),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
