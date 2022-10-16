import 'package:do_an_fontend/core/controllers/auth_controller.dart';
import 'package:do_an_fontend/helper/logger.dart';
import 'package:get/get.dart';

import '../models/order_model.dart';
import '../models/product_model.dart';
import '../services/order_service.dart';
import '../services/product_service.dart';

class ProductController extends GetxController {
  ProductController({required this.productService, required this.orderService});
  final IOrderService orderService;
  final IProductService productService;
  var isLoading = true.obs;
  var product = Product().obs;

  var quantity = 0.obs;
  var priceUnit = 0.0.obs;

  void increase() {
    if (quantity.value < product.value.quantity!) {
      quantity++;
      calPriceUnit(quantity.value);
    }
  }

  void decrease() {
    if (quantity.value > 0) {
      quantity--;
      calPriceUnit(quantity.value);
    }
  }

  void calPriceUnit(int q) {
    priceUnit(q * product.value.price!);
  }

  void getProduct(String productId) {
    productService.findById(productId).then((value) {
      product(value);
      isLoading.value = false;
    });
  }

  Order createOrder(){
    return Order(
      product: product.value,
      quantity: quantity.value,
      priceUnit: priceUnit.value,
    );
  }


}
