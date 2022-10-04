
import 'package:do_an_fontend/helper/logger.dart';
import 'package:get/get.dart';

import '../models/transaction_model.dart';
import '../services/transaction_service.dart';

class CartViewModel extends GetxController {
  CartViewModel({required this.transactionService});
  final ITransactionService transactionService;

  var carts = <Transaction>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllCart();
  }


  void getAllCart() async {
    const state = 'IN_CART';
    const userId = '6337c1589db53f0e4eb92de2';
    const query = 'userId=$userId&state=$state';
    await transactionService.getAll(query: query).then((value){
      // logger.i(value?.elementAt(0).toJson());
      carts.value = value!;
      carts.refresh();
    });
  }


}
