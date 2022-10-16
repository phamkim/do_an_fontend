

import 'package:get/get.dart';

import '../core/controllers/auth_controller.dart';
import '../core/controllers/cart_controller.dart';
import '../core/services/order_service.dart';
import '../core/services/transaction_service.dart';
import '../core/services/user_service.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(
        userService: UserService()
      ),
    );
    Get.lazyPut<CartController>(
      () => CartController(
        orderService: OrderService(),
        transactionService: TransactionService(),
      ),
    );
  }
}
