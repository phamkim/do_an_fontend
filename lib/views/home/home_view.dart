import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../core/controllers/auth_controller.dart';
import '../../core/controllers/cart_controller.dart';
import '../../core/controllers/home_controller.dart';
import '../constance.dart';
import '../widgets/avatar.dart';
import '../widgets/cart_button.dart';
import '../widgets/list_category.dart';
import '../widgets/list_product.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    CartController cartController = Get.find<CartController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/account');
              },
              child: Hero(
                tag: "avatar",
                child: Obx(
                  () => Avatar(
                    size: 14.0,
                    src: authController.user.value.photo,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: kPadding * 2),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/search');
                },
                child: const Icon(
                  CupertinoIcons.search,
                  size: 28,
                ),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(right: kPadding * 2, top: kPadding * 2),
              child: CartButton(),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: kPadding,
            left: kPadding,
            right: kPadding,
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: kPadding),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Find your favorites",
                    style: TextStyle(
                      fontSize: kHeadingTitle * 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const ListCategory(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Best selling",
                    style: TextStyle(
                      fontSize: kHeadingTitle * 0.9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: kHeadingTitle * 0.9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: kSizeBox,
              ),
              const ListProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
