import 'package:do_an_fontend/core/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constance.dart';
import '../widgets/list_category.dart';
import '../widgets/list_product.dart';


class HomeView extends GetView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        right: true,
        bottom: true,
        minimum: const EdgeInsets.all(kPadding),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: kPadding * 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorder),
                  color: Theme.of(context).cardColor),
              child: TextFormField(
                cursorColor: Theme.of(context).primaryColor,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search_outlined,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: kSizeBox,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Category",
                style: TextStyle(
                  fontSize: kHeadingTitle,
                  fontWeight: FontWeight.bold,
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
    );
  }
}
