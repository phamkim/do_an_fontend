import 'package:do_an_fontend/core/services/user_service.dart';
import 'package:do_an_fontend/helper/logger.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class AccountController extends GetxController {
  AccountController({required this.userService});

  final IUserService userService;
  var user = User().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUser();
  }

  void getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString("accessToken");
    final String? userId = prefs.getString("userId");
    if (userId != null && accessToken != null) {
      await userService.findById(userId, token: accessToken).then((value) {
        user.value = value!;
        user.refresh();
      });
    }
  }
}
