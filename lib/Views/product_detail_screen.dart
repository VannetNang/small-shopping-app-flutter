import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shopping_app_flutter/ViewModels/cart_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedSize = 0;

  void addProductToCart() {
    if (selectedSize == 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please select size!')));

      return;
    }

    context.read<CartModel>().addProduct({
      'id': widget.product['id'],
      'name': widget.product['name'],
      'price': widget.product['price'],
      'imageUrl': widget.product['imageUrl'],
      'company': widget.product['company'],
      'sizes': selectedSize,
    });
    
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Product added successfully!')));
  }

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
                      onPressed: () => addProductToCart(),
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
