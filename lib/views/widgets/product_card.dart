import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an_fontend/core/models/product_model.dart';
import 'package:do_an_fontend/views/home/product_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import '../../helper/api_config.dart';
import '../constance.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;

  String calDisCountPrice(double price, double discount) {
    return (price - price * discount).toString();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/product/${product.sId}',);
      },
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorder),
            color: Theme.of(context).cardColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: product,
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                height: 170.0,
                placeholder: (context, url) => const SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                imageUrl: '$baseUri/photos/${product.photo?.first}',
              ),
            ),
            const SizedBox(
              height: kSizeBox,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          product.description!,
                          style: const TextStyle(fontSize: 12.0),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          'đ ${product.price.toString()}',
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontStyle: FontStyle.italic,
                              fontSize: 12.0),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'đ ${calDisCountPrice(product.price!, product.discount!)}',
                          style: TextStyle(
                            color: Theme.of(context).highlightColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
