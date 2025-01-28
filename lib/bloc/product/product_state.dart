part of 'product_bloc.dart';

class ProductState extends Equatable {
  final ApiResponse<ProductModel> productList;

  final ApiResponse<ProductModel> searchList;

  const ProductState({
    required this.productList,
    required this.searchList,
  });

  ProductState copyWith({
    ApiResponse<ProductModel>? productList,
    ApiResponse<ProductModel>? searchList,
  }) {
    return ProductState(
      productList: productList ?? this.productList,
      searchList: searchList ?? this.searchList,
    );
  }

  @override
  List<Object?> get props => [productList, searchList];
}
