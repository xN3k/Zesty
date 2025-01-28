import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zesty/bloc/page/page_bloc.dart';
import 'package:zesty/config/components/icon_button_widget.dart';
import 'package:zesty/models/product/product_model.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    super.key,
    required this.productModel,
  });

  final Products productModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.1,
          child: BlocBuilder<PageBloc, PageState>(
            builder: (context, state) {
              return PageView.builder(
                onPageChanged: (value) {
                  context.read<PageBloc>().add(PageChanged(value));
                },
                itemCount: productModel.images.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    productModel.images[index],
                    fit: BoxFit.cover,
                  );
                },
                scrollDirection: Axis.horizontal,
              );
            },
          ),
        ),
        Positioned(
          top: 45,
          left: 15,
          right: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButtonWidget(
                  press: () {
                    Navigator.pop(context);
                  },
                  icon: Icons.arrow_back_ios_new),
              IconButtonWidget(
                  press: () {}, icon: Icons.shopping_cart_outlined),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: BlocBuilder<PageBloc, PageState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  productModel.images.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: state.currentPage == index
                          ? Colors.blue
                          : Colors.grey.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
