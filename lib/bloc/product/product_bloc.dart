import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:zesty/data/response/api_response.dart';
import 'package:zesty/models/product/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zesty/repository/product/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductApiRepository productApiRepository;
  ProductBloc({required this.productApiRepository})
      : super(const ProductState(
          productList: ApiResponse.loading(),
          searchList: ApiResponse.loading(),
        )) {
    on<FetchProducts>(_onFetchProducts);
    on<SearchProduct>(_onSearchProduct);
  }

  Future<void> _onFetchProducts(
      FetchProducts event, Emitter<ProductState> emit) async {
    await productApiRepository.fetchProducts().then(
      (value) {
        emit(state.copyWith(productList: ApiResponse.completed(value)));
      },
    ).onError(
      (error, stackTrace) {
        if (kDebugMode) {
          print(stackTrace);
          print(error);
        }
        emit(state.copyWith(
            productList: ApiResponse.error(
          error.toString(),
        )));
      },
    );
  }

  Future<void> _onSearchProduct(
      SearchProduct event, Emitter<ProductState> emit) async {
    final searchQuery = event.query;
    await productApiRepository.searchProducts(searchQuery).then(
      (value) {
        emit(state.copyWith(productList: ApiResponse.completed(value)));
      },
    ).onError(
      (error, stackTrace) {
        if (kDebugMode) {
          print(stackTrace);
          print(error);
        }
        emit(state.copyWith(
            productList: ApiResponse.error(
          error.toString(),
        )));
      },
    );
  }
}
