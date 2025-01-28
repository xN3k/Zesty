import 'package:flutter/material.dart';
import 'package:zesty/config/components/custom_icon_button.dart';
import 'package:zesty/view/home/widgets/search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SearchField(
            searchController: _searchController,
          ),
        ),
        CustomIconButton(
          press: () {},
          icon: Icons.shopping_cart_outlined,
        ),
      ],
    );
  }
}
