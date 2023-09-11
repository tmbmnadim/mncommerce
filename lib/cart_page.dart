import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        "Cart",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 100,
        ),
      ),
    );
  }
}
