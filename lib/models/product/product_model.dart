import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_model.g.dart';
part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    @Default([]) List<Products> products,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class Products with _$Products {
  factory Products({
    @Default('') String title,
    @Default(0.0) double price,
    @Default('') String description,
    @Default('') String category,
    @Default([]) @JsonKey(name: 'images') List<String> images,
    @Default('') String thumbnail,
    @Default(0.0) double rating,
    @Default(0) int stock,
    @Default('') String brand,
    @Default(0) int weight,
    @Default('') @JsonKey(name: 'availabilityStatus') String availabilityStatus,
    @Default([]) @JsonKey(name: 'reviews') List<Reviews> reviews,
  }) = _Products;

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);
}

@freezed
class Reviews with _$Reviews {
  factory Reviews({
    @Default(0) int rating,
    @Default('') String comment,
    @Default('') @JsonKey(name: 'reviewerName') String reviewerName,
    @Default('') @JsonKey(name: 'reviewerEmail') String reviewerEmail,
  }) = _Reviews;

  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);
}
