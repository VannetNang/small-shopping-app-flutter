import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    final productPrice = widget.product['price'].toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Details', style: Theme.of(context).textTheme.titleMedium),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Text(
              widget.product['name'],
              style: Theme.of(context).textTheme.titleLarge,
            ),

            Spacer(),
            Center(child: Image.asset(widget.product['imageUrl'], height: 200)),
            Spacer(flex: 2),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 231, 231),
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      '\$$productPrice',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),

                  const SizedBox(height: 10),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.product['sizes'].length,
                      itemBuilder: (context, index) {
                        final currentSize = widget.product['sizes'][index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = currentSize;
                              });
                            },
                            child: Chip(
                              label: Text(currentSize.toString()),
                              side: BorderSide(color: Colors.black),
                              backgroundColor: selectedSize == currentSize
                                  ? Colors.amber
                                  : const Color.fromARGB(255, 235, 231, 231),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 26),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () => print('Size clicked...'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.black,
                      ),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
