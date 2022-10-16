import 'package:do_an_fontend/views/constance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/controllers/auth_controller.dart';
import '../widgets/avatar.dart';
import '../widgets/item_button.dart';
import '../widgets/no_login.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => authController.isLogin()
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Hero(
                        tag: "avatar",
                        child: Obx(
                          () => Avatar(
                            src: authController.user.value.photo,
                            size: 80.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: kSizeBox * 2,
                      ),
                      ItemButton(
                        text: "My Account",
                        icon: Icons.account_circle_outlined,
                        iconRight: Icons.arrow_forward_ios,
                        press: () {},
                      ),
                      ItemButton(
                        text: "Shipping address",
                        icon: Icons.location_on_outlined,
                        iconRight: Icons.arrow_forward_ios,
                        press: () {},
                      ),
                      ItemButton(
                        text: "Orders history",
                        iconRight: Icons.arrow_forward_ios,
                        icon: Icons.history,
                        press: () {},
                      ),
                      ItemButton(
                        text: "Settings",
                        icon: Icons.settings_outlined,
                        iconRight: Icons.arrow_forward_ios,
                        press: () {},
                      ),
                      ItemButton(
                        text: "Logout",
                        icon: Icons.logout_outlined,
                        iconRight: Icons.arrow_forward_ios,
                        press: () {
                          authController.logout();
                        },
                      ),
                    ],
                  ),
                )
              : const Center(child: NoLogin()),
        ),
      ),
    );
  }
}
