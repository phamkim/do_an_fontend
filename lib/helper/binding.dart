import '../../core/viewmodels/category_view_model.dart';
import '../../core/viewmodels/auth_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => CategoryViewModel());
  }
}
