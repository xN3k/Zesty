import 'package:flutter/material.dart';
import 'package:zesty/models/product/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Products productModel;

  const ProductDetailScreen({Key? key, required this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productModel.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Center(
                child: Image.network(
                  productModel.images.toString(),
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              // Product Name
              Text(
                productModel.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Product Price
              Text(
                "Price: \$${productModel.price.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 16),

              // Product Description
              Text(
                "Description:",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                productModel.description,
                style: const TextStyle(fontSize: 16),
              ),
              const Spacer(),

              // Add to Cart Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle add to cart logic
                  },
                  child: const Text("Add to Cart"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
