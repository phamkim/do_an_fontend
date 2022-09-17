import '../../core/services/category_service.dart';
import 'package:get/get.dart';

import '../../models/category_model.dart';

class CategoryViewModel extends GetxController {
  var categories = <Category>[].obs;

  late CategoryService categoryService;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    categoryService = CategoryService();
    fetchCategory();
  }

  void fetchCategory() async {
    var result = await categoryService.getAll();
    if (result.isNotEmpty) {
      categories.value = result;
      print(categories.value);
    }
  }


}
