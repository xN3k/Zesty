import 'package:flutter/material.dart';
import 'package:zesty/models/product/product_model.dart';
import 'package:zesty/view/home/widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.productList,
  });

  final ProductModel productList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: productList.products.isEmpty
          ? const Center(
              child: Text(
                "No products found",
                style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            )
          : GridView.builder(
              itemCount: productList.products.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.7,
                mainAxisSpacing: 20,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final product = productList.products[index];
                return ProductCard(
                  product: product,
                );
              },
            ),
    );
  }
}
