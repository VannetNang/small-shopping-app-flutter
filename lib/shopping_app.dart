import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shopping_app_flutter/ViewModels/cart_model.dart';
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
    final totalItems = context.watch<CartModel>().cart.length;

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
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: ''),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_cart, size: 30),
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        totalItems.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
