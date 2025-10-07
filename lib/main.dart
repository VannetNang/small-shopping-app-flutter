import 'package:flutter/material.dart';
import 'package:small_shopping_app_flutter/Views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,

        // TEXT STYLE
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Lato',
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
