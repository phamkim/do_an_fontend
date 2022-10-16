import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controllers/cart_controller.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.find<CartController>();
    return Obx(
      () => GestureDetector(
        onTap: () {
          Get.toNamed('/cart');
        },
        child: Badge(
          badgeContent: Text('${controller.cart.value.order?.length}'),
          animationType: BadgeAnimationType.scale,
          child: const Icon(
            CupertinoIcons.shopping_cart,
            size: 28,
          ),
        ),
      ),
    );
  }
}
