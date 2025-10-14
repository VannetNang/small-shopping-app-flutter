import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shopping_app_flutter/ViewModels/cart_model.dart';
import 'package:small_shopping_app_flutter/shopping_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          // Force white background
          scaffoldBackgroundColor: Colors.white,

          // APP BAR STYLE
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),

          // PRIMARY COLORS
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1),
          ),

          // TEXT STYLE
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),

            titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
          ),
        ),
        home: ShoppingApp(),
      ),
    );
  }
}
