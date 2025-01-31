import 'package:zesty/models/user/user_model.dart';

abstract class UserRepo {
  Future<UserModel> signIn(dynamic data);
}
