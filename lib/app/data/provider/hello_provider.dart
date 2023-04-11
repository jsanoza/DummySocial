import 'package:trial/app/data/api/api_connect.dart';
import 'package:trial/app/data/models/user.dart';
import 'package:trial/app/utils/constants.dart';

class HelloProvider {
  HelloProvider();

  // Get request
  Future<User> getUser() async {
    return User.fromJson(
      (await ApiConnect.instance.get(EndPoints.user)).getBody(),
    );
  }
}
