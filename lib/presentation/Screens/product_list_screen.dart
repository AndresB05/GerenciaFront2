import 'package:flutter/material.dart';
import '../Widgets/product_table.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: const Padding(padding: EdgeInsets.all(16.0), child: ProductTable()),
    );
  }
}
