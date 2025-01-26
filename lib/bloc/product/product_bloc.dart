import 'package:equatable/equatable.dart';
import 'package:zesty/data/response/api_response.dart';
import 'package:zesty/models/product/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zesty/repository/product/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductApiRepository productApiRepository;
  ProductBloc({required this.productApiRepository})
      : super(const ProductState(productList: ApiResponse.loading())) {
    on<FetchProducts>(_onFetchProducts);
  }

  Future<void> _onFetchProducts(
      FetchProducts event, Emitter<ProductState> emit) async {
    productApiRepository.fetchProducts().then(
      (value) {
        emit(state.copyWith(productList: ApiResponse.completed(value)));
      },
    ).onError(
      (error, stackTrace) {
        emit(state.copyWith(
            productList: ApiResponse.error(
          error.toString(),
        )));
      },
    );
  }
}
