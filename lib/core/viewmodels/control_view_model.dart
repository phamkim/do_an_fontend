import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../views/account/account_view.dart';
import '../../views/cart/cart_view.dart';
import '../../views/home/home_view.dart';


class ControlViewModel extends GetxController {
  var selectedIndex = 0.obs;

  final List<String> routers = <String>[
    '/',
    'cart',
    'account',
  ];

  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    CartView(),
    AccountView(),
  ];

  Widget get currentPage => _widgetOptions[selectedIndex.value];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
