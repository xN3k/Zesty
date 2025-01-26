part of 'product_bloc.dart';

class ProductState extends Equatable {
  final ApiResponse<ProductModel> productList;

  const ProductState({required this.productList});

  ProductState copyWith({
    ApiResponse<ProductModel>? productList,
  }) {
    return ProductState(productList: productList ?? this.productList);
  }

  @override
  List<Object?> get props => [productList];
}
