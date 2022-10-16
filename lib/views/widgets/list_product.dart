
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/controllers/home_controller.dart';
import '../constance.dart';
import 'empty.dart';
import 'product_card.dart';

class ListProduct extends GetView<HomeController> {
  const ListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => controller.products.isNotEmpty
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kPadding,
                    crossAxisSpacing: kPadding,
                    mainAxisExtent: 250.0),
                physics: const BouncingScrollPhysics(),
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: controller.products[index],
                  );
                },
              )
            : const Empty(),
      ),
    );
  }
}
