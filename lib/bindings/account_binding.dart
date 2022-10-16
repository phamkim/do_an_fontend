import 'package:get/get.dart';

import '../core/controllers/account_controller.dart';
import '../core/services/user_service.dart';


class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController(userService: UserService()));
  }
}
