

import 'package:do_an_fontend/core/services/user_service.dart';
import 'package:do_an_fontend/helper/logger.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class AccountViewModel extends GetxController{
  AccountViewModel({required this.userService});

  final IUserService userService;
  var user = User().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUser();
  }

  void getUser() async {
    const id = '6337c0ce9db53f0e4eb92dd9';
    const accessToken='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MzM3YzBjZTlkYjUzZjBlNGViOTJkZDkiLCJpYXQiOjE2NjQ4OTE4MTcsImV4cCI6MTY2NDg5OTAxN30.cwMg6lKXP6C1ebIGTm0z0m1NtCJrhC5VbRir0qQAcUY';
    await userService.findById(id, token: accessToken).then((value){
      logger.i(value?.toJson());
    });
  }

}