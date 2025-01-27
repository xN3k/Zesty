import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zesty/bloc/page/page_bloc.dart';
import 'package:zesty/models/product/product_model.dart';
import 'package:zesty/view/product/widgets/floating_button.dart';
import 'package:zesty/view/product/widgets/page_view_widget.dart';
import 'package:zesty/view/product/widgets/product_detail.dart';

class ProductDetailScreen extends StatelessWidget {
  final Products productModel;

  const ProductDetailScreen({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageBloc(),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const FloatingActionButtonWidget(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageViewWidget(productModel: productModel),
              ProductDetail(productModel: productModel),
            ],
          ),
        ),
      ),
    );
  }
}
