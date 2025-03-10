import 'package:zesty/data/network/network.dart';
import 'package:zesty/models/product/product_model.dart';
import 'package:zesty/repository/product/product_repository.dart';
import 'package:zesty/utils/constants/app_url.dart';

class ProductHttpApiRepository implements ProductApiRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  @override
  Future<ProductModel> fetchProducts() async {
    final response = await _apiServices.getApi(AppUrl.productUrl);
    return ProductModel.fromJson(response);
  }

  @override
  Future<ProductModel> searchProducts(String query) async {
    final response = await _apiServices.getApi(AppUrl.searchUrl + query);
    return ProductModel.fromJson(response);
  }
}
