import 'package:get/get.dart';
import '../core/controllers/home_controller.dart';
import '../core/services/category_service.dart';
import '../core/services/product_service.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        categoryService: CategoryService(),
        productService: ProductService(),
      ),
    );
  }
}
