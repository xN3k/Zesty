import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zesty/bloc/product/product_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _searchController,
      decoration: InputDecoration(
        filled: true,
        hintStyle: const TextStyle(color: Color(0xFF757575)),
        fillColor: const Color(0xFF979797).withValues(alpha: 0.1),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
        hintText: "Search product",
        prefixIcon: const Icon(Icons.search),
      ),
      onChanged: (value) {
        context.read<ProductBloc>().add(SearchProduct(value));
      },
    );
  }
}
