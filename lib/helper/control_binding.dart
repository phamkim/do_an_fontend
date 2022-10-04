import 'package:get/get.dart';

import '../core/services/category_service.dart';
import '../core/services/order_service.dart';
import '../core/services/product_service.dart';
import '../core/services/transaction_service.dart';
import '../core/services/user_service.dart';
import '../core/viewmodels/account_view_model.dart';
import '../core/viewmodels/cart_view_model.dart';
import '../core/viewmodels/control_view_model.dart';
import '../core/viewmodels/home_view_model.dart';

class ControlBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControlViewModel>(() => ControlViewModel());
    Get.lazyPut<HomeViewModel>(
      () => HomeViewModel(
        categoryService: CategoryService(),
        productService: ProductService(),
      ),
    );
    Get.lazyPut<CartViewModel>(
      () => CartViewModel(
        transactionService: TransactionService(),
      ),
    );
    Get.lazyPut(()=>AccountViewModel(
      userService: UserService()
    ));
  }
}
