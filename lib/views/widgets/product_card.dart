import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an_fontend/core/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import '../../helper/api_config.dart';
import '../constance.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorder),
          color: Theme.of(context).cardColor),
      child: Column(
        children: [
          CachedNetworkImage(
            fit: BoxFit.contain,
            height: 170.0,
            placeholder: (context, url) => const SkeletonAvatar(
              style: SkeletonAvatarStyle(
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            imageUrl: '$baseUri/photos/${product.photo.first}',
          ),
          const SizedBox(
            height: kSizeBox,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$ ${product.price.toString()}',
                      style: TextStyle(
                        color: Theme.of(context).highlightColor,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_shopping_cart),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

