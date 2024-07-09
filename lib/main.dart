import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/injection.dart' as di;
import 'package:movie_app/src/presentation/screens/bottom_nav.dart';

import 'routes.dart';

Future<void> main() async {
  di.init();
  await dotenv.load(fileName: ".env");
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
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Mulish',),
      routes: routes,
      initialRoute: BottomNav.routeName,
    );
  }
}
