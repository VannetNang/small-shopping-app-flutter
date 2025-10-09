import 'package:flutter/material.dart';

class RenderProduct extends StatelessWidget {
  final String productName;
  final double productPrice;
  final String productImage;
  final Color productColor;

  const RenderProduct({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: productColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(productName, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 6),

          Text(
            '\$$productPrice',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),

          Center(child: Image.asset(productImage, height: 200)),
        ],
      ),
    );
  }
}
