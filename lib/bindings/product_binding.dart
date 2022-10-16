import 'package:get/get.dart';
import '../core/controllers/cart_controller.dart';
import '../core/controllers/product_controller.dart';
import '../core/services/order_service.dart';
import '../core/services/product_service.dart';
import '../core/services/transaction_service.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
      () => ProductController(
        productService: ProductService(),
        orderService: OrderService(),
      ),
    );
  }
}
