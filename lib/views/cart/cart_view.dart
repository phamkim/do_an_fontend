import 'package:do_an_fontend/core/viewmodels/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/empty.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartViewModel controller = Get.find<CartViewModel>();
    return Center(
      child: controller.carts.isNotEmpty ? const Text("data") : const Empty(),
    );
  }
}
