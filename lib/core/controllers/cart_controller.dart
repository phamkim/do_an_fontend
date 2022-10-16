import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper/logger.dart';
import '../models/order_model.dart';
import '../models/product_model.dart';
import '../models/transaction_model.dart';
import '../services/order_service.dart';
import '../services/transaction_service.dart';

class CartController extends GetxController {
  CartController({
    required this.transactionService,
    required this.orderService,
  });
  final ITransactionService transactionService;
  final IOrderService orderService;
  var cart = Transaction(order: <Order>[]).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    asyncCart();
  }

  Future<void> addToCart(Order order, String accessToken) async {
    logger.i(order.toJson());
    logger.i(cart.value.toJson());

    final Product product = order.product;
    var orders = <Order>[];
    var ok = false;
    var priceTotal = 0.0;

    cart.value.order?.forEach((element) {
      if (element.product.sId == product.sId) {
        Order newOrder = element;
        newOrder.product = product;
        newOrder.quantity = (element.quantity) + order.quantity;
        newOrder.priceUnit = (element.priceUnit) + order.priceUnit;
        priceTotal += newOrder.priceUnit;
        orders.add(newOrder);
        ok = true;
      } else {
        priceTotal += element.priceUnit;
        orders.add(element);
      }
    });

    if (!ok) {
      await orderService.save(order, token: accessToken).then((value) {
        priceTotal += value!.priceUnit;
        orders.add(value);
      });
    }

    cart.value.priceTotal = priceTotal;
    cart.value.order?.clear();
    cart.value.order?.addAll(orders);
    cart.refresh();

    // transactionService.update(cart.value, cart.value.sId!, token: accessToken);

    logger.i(cart.value.toJson());
  }

  void remove(Order item) {
    cart.value.order!.remove(item);
    cart.refresh();
  }

  void asyncCart() async {
    const state = 'IN_CART';
    final prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString("accessToken");
    final String? userId = prefs.getString("userId");
    if (userId != null && accessToken != null) {
      final query = 'userId=$userId&state=$state';
      await transactionService
          .getAll(token: accessToken, query: query)
          .then((value) {
        cart.value = (value?.first)!;
        cart.refresh();
      });
    }
  }

  void increase(int index) {
    if (true) {
      cart.value.order!.elementAt(index).quantity++;
      cart.refresh();
    }
  }

  void decrease(int index) {
    if (cart.value.order!.elementAt(index).quantity > 1) {
      cart.value.order!.elementAt(index).quantity--;
      cart.refresh();
    }
  }
}


