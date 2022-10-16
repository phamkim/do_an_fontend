
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/controllers/home_controller.dart';
import '../constance.dart';
import 'category_button.dart';
import 'skeleton/categories_skeleton.dart';

class ListCategory extends GetView<HomeController> {
  const ListCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kPadding),
      height: 105.0,
      child: Obx(
        () => controller.categories.isNotEmpty
            ? ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(
                    () => CategoryButton(
                        onPress: () {
                          controller.changeSelectedCategoryIndex(index);
                        },
                        active: controller.selectedCategoryIndex.value == index
                            ? Theme.of(context).focusColor
                            : Theme.of(context).cardColor,
                        photo: controller.categories[index].photo!,
                        name: controller.categories[index].name!),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: kSizeBox,
                ),
              )
            : const CategoriesSkeleton(),
      ),
    );
  }
}
