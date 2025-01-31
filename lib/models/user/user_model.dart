import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    @Default('') @JsonKey(name: "accessToken") String accessToken,
    @Default('') @JsonKey(name: "refreshToken") String refreshToken,
    @Default('') String message,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
