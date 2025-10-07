import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final border = const OutlineInputBorder(
    borderRadius: BorderRadius.horizontal(
      left: Radius.circular(32),
      right: Radius.circular(0),
    ),
    borderSide: BorderSide(
      color: Colors.grey,
      width: 1,
      strokeAlign: BorderSide.strokeAlignCenter,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ensures content is displayed within safe areas
      // not behind system UI like status bar or bottom bar
      body: SafeArea(
        child: Column(
          children: [
            // Top-bar row
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Shoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search, size: 25),
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
