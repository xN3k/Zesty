import 'package:zesty/models/product/product_model.dart';
import 'package:zesty/repository/product/product_repository.dart';

class ProductMockApiRepository implements ProductApiRepository {
  @override
  Future<ProductModel> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    dynamic responseData = {
      "id": 1,
      "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
      "price": 109.95,
      "description":
          "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
      "category": "men's clothing",
      "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    };
    return ProductModel.fromJson(responseData);
  }
}
