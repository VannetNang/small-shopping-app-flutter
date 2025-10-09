import 'package:flutter/material.dart';
import 'package:small_shopping_app_flutter/Views/checkout_screen.dart';
import 'package:small_shopping_app_flutter/Views/home_screen.dart';

class ShoppingApp extends StatefulWidget {
  const ShoppingApp({super.key});

  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  final List<Widget> pages = [HomeScreen(), CheckoutScreen()];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Main page
      body: pages[currentPage],

      // Bottom navigation page
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 30),
            label: '',
          ),
        ],
      ),
    );
  }
}
