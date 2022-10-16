import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an_fontend/helper/logger.dart';
import 'package:do_an_fontend/views/widgets/empty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import '../../core/controllers/auth_controller.dart';
import '../../core/controllers/cart_controller.dart';
import '../../core/controllers/product_controller.dart';
import '../../helper/api_config.dart';
import '../constance.dart';
import '../widgets/cart_button.dart';

class ProductView extends GetView<ProductController> {
  ProductView({Key? key}) : super(key: key);
  final String productId = Get.parameters['id']!;
  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find<CartController>();
    AuthController authController = Get.find<AuthController>();
    controller.getProduct(productId);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: kPadding * 2, top: kPadding),
              child: CartButton(),
            ),
          ],
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Empty()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Hero(
                        tag: controller.product.value,
                        child: AspectRatio(
                          aspectRatio: 3 / 2,
                          child: CachedNetworkImage(
                            fit: BoxFit.contain,
                            placeholder: (context, url) => const SkeletonAvatar(
                              style: SkeletonAvatarStyle(
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            imageUrl:
                                '$baseUri/photos/${controller.product.value.photo?.first}',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: kSizeBox,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(kPadding),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                controller.product.value.name!,
                                style: const TextStyle(
                                  fontSize: kHeadingTitle * 0.9,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                controller.product.value.description!,
                                style: const TextStyle(
                                  fontSize: kHeadingTitle * 0.9,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                controller.product.value.quantity.toString(),
                                style: const TextStyle(
                                  fontSize: kHeadingTitle * 0.9,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                controller.product.value.price.toString(),
                                style: const TextStyle(
                                  fontSize: kHeadingTitle * 0.9,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        bottomNavigationBar: Obx(() => authController.isLogin()
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: kPadding * 3,
                  horizontal: kPadding * 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.decrease();
                          },
                          child: const Icon(
                            CupertinoIcons.minus_rectangle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(
                            () => Text(controller.quantity.toString()),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.increase();
                          },
                          child: const Icon(
                            CupertinoIcons.plus_rectangle,
                          ),
                        )
                      ],
                    ),
                    Obx(() => Text(controller.priceUnit.value.toString())),
                    Obx(
                      () => TextButton(
                        onPressed: controller.quantity.value > 0
                            ? () {
                                cartController.addToCart(
                                  controller.createOrder(),
                                  authController.accessToken.value,
                                );
                              }
                            : null,
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(kPadding),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(kBorder))),
                          backgroundColor: Theme.of(context).focusColor,
                        ),
                        child: const Text(
                          "Buy",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : const SizedBox()),
      ),
    );
  }
}
