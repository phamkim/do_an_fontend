import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an_fontend/views/widgets/no_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import '../../core/controllers/auth_controller.dart';
import '../../core/controllers/cart_controller.dart';
import '../../helper/api_config.dart';
import '../constance.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    CartController cartController = Get.find<CartController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => authController.isLogin()
              ? SizedBox(
                  height: context.height,
                  child: Obx(
                    () => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: cartController.cart().order?.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                              onDismissed: (direction) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        '${cartController.cart().order?.elementAt(index).product.name} deleted'),
                                  ),
                                );
                                cartController.remove(cartController
                                    .cart().order!
                                    .elementAt(index));
                              },
                              key: Key(index.toString()),
                              // background: Container(color: Colors.red),
                              child: OrderItem(index: index));
                        }),
                  ),
                )
              : const Center(
                  child: NoLogin(),
                ),
        ),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find<CartController>();
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorder),
          color: Theme.of(context).cardColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: 100.0,
                  width: 100.0,
                  placeholder: (context, url) => const SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: 150.0,
                      height: 150.0,
                    ),
                  ),
                  imageUrl: '$baseUri/photos/'
                      '${cartController.cart.value.order?.elementAt(index).product.photo?.first}',
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartController.cart.value.order!
                        .elementAt(index)
                        .product
                        .name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    cartController.cart.value.order!
                        .elementAt(index)
                        .product
                        .description!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: kPadding,
                  ),
                  Text(
                    cartController.cart.value.order!
                        .elementAt(index)
                        .product
                        .price
                        .toString(),
                    maxLines: 1,
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontStyle: FontStyle.italic,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    cartController.cart.value.order!
                        .elementAt(index)
                        .product
                        .price
                        .toString(),
                    maxLines: 1,
                    style: TextStyle(
                      color: Theme.of(context).highlightColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  cartController.decrease(index);
                },
                child: const Icon(
                  CupertinoIcons.minus_rectangle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Text(cartController.cart.value.order!
                      .elementAt(index)
                      .quantity
                      .toString()),
                ),
              ),
              GestureDetector(
                onTap: () {
                  cartController.increase(index);
                },
                child: const Icon(
                  CupertinoIcons.plus_rectangle,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
