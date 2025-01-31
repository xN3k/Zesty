import 'package:zesty/data/network/network_api_services.dart';
import 'package:zesty/models/user/user_model.dart';
import 'package:zesty/repository/user/user_repo.dart';
import 'package:zesty/utils/constants/app_url.dart';

class UserHttpRepository implements UserRepo {
  final NetworkApiServices _apiServices = NetworkApiServices();

  @override
  Future<UserModel> signIn(dynamic data) async {
    final response = await _apiServices.postApi(AppUrl.loginUrl, data);
    return UserModel.fromJson(response);
  }
}
