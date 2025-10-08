import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  final List<String> filteredItems = ['All', 'Adidas', 'Nike', 'Bata'];
  String selectedItem = 'All';

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

            // Filtered cards
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final currentItem = filteredItems[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedItem = currentItem;
                        });
                      },
                      child: Chip(
                        label: Text(currentItem),
                        backgroundColor: selectedItem == currentItem
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromARGB(255, 235, 231, 231),
                        padding: EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
