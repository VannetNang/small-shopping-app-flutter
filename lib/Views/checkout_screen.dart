import 'package:flutter/material.dart';
import 'package:small_shopping_app_flutter/Models/data.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    trailing: Icon(Icons.delete, color: Colors.red),
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
