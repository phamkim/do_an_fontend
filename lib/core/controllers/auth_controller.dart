import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

class AuthController extends GetxController {
  final IUserService userService;
  var accessToken = "".obs;
  var refreshToken = "".obs;
  var user = User().obs;
  var isLogin = false.obs;

  AuthController({required this.userService});

  @override
  void onInit() {
    checkIsLogin();
    super.onInit();
  }

  void updateUserName(String userName) {
    user.value.userName = userName;
    user.refresh();
  }

  void updatePassWord(String passWord) {
    user.value.passWord = passWord;
    user.refresh();
  }

  Future<void> checkIsLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final String? refreshToken = prefs.getString("refreshToken");
    final String? userId = prefs.getString("userId");
    if (userId != null && refreshToken != null) {
      refreshAToken(refreshToken).then((value) {
        if (value) {
          isLogin.value = true;
        }
      });
    }
  }

  Future<bool> refreshAToken(String oldRefreshToken) async {
    dynamic response = await userService.refreshToken(oldRefreshToken);
    if (response != null) {
      final prefs = await SharedPreferences.getInstance();
      accessToken.value = response["accessToken"];
      refreshToken.value = response["refreshToken"];
      user.value = User.fromJson(response["user"]);
      isLogin.value = true;
      prefs.setString("refreshToken", response["refreshToken"]);
      prefs.setString("accessToken", response["accessToken"]);
      return true;
    }
    return false;
  }

  Future<bool> login() async {
    String userName = user.value.userName!;
    String passWord = user.value.passWord!;
    dynamic response = await userService.login(userName, passWord);
    if (response != null) {
      final prefs = await SharedPreferences.getInstance();
      User user = User.fromJson(response["user"]);
      accessToken.value = response["accessToken"];
      refreshToken.value = response["refreshToken"];
      isLogin.value = true;
      prefs.setString("accessToken", response["accessToken"]);
      prefs.setString("refreshToken", response["refreshToken"]);
      prefs.setString("userId", user.sId!);
      Get.back();
      return true;
    }
    return false;
  }

  Future<bool> logout() async {
    final prefs = await SharedPreferences.getInstance();
    String? oldRefreshToken = prefs.getString("refreshToken");
    await userService.logout(oldRefreshToken!).then((value) {
      if (value) {
        accessToken.value = '';
        refreshToken.value = '';
        user.value = User();
        isLogin.value = false;
        prefs.remove("refreshToken");
        prefs.remove("userId");
        prefs.remove("accessToken");
        return true;
      }
    });
    return false;
  }
}
