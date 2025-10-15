import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shopping_app_flutter/ViewModels/cart_model.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>().cart;

    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Cart'))),

      body: Column(
        children: [
          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final cartItem = cart[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    title: Text(
                      cartItem['name'] as String,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('Size: ${cartItem['sizes'].toString()}'),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Image.asset(cartItem['imageUrl'] as String),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Delete Product',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              content: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Are you sure you want to remove  ',
                                    ),
                                    TextSpan(
                                      text: cartItem['name'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(text: '  from the cart?'),
                                  ],
                                ),
                              ),
                              actions: [
                                // No confirmation
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'No',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),

                                // Yes confirmation
                                TextButton(
                                  onPressed: () {
                                    context.read<CartModel>().removeProduct(
                                      cartItem,
                                    );
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
