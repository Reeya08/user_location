import 'package:flutter/material.dart';
import 'package:user_location/presentation/views/home/home_view.dart';
import 'package:user_location/presentation/views/my_app/my_app_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      // home: MyAppView(),
      home: HomeView(),
    );
  }
}
