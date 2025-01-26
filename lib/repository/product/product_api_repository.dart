import 'package:zesty/models/product/product_model.dart';

abstract class ProductApiRepository {
  Future<ProductModel> fetchProducts();
}
