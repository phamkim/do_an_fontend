import 'dart:convert';
import 'package:do_an_fontend/core/services/user_service.dart';
import 'package:do_an_fontend/helper/logger.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';

class AuthViewModel extends GetxController {
  final IUserService userService;
  var accessToken = "".obs;
  var refreshToken = "".obs;
  var user = User().obs;
  var isLogin = false.obs;

  AuthViewModel({required this.userService});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  void updateUserName(String userName){
    user.value.userName = userName;
    user.refresh();
  }

  void updatePassWord(String passWord){
    user.value.passWord = passWord;
    user.refresh();
  }

  Future<bool> login() async {
    var userName = user.value.userName;
    var passWord = user.value.passWord;
    dynamic response = await userService.login(userName!, passWord!);
    if (response != null) {
      accessToken.value = response["accessToken"];
      refreshToken.value = response["refreshToken"];
      user.value =  User.fromJson(response["user"]);
      user.refresh();
      logger.i(user.value.toJson());
      return true;
    }
    return false;
  }


}
