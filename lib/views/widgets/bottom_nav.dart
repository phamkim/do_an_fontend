

import 'package:do_an_fontend/core/viewmodels/control_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends GetView<ControlViewModel> {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final focusColor = Theme.of(context).focusColor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: GNav(
          gap: 8,
          color: primaryColor,
          activeColor: focusColor,
          iconSize: 24,
          onTabChange: ((index) {
            controller.changeIndex(index);
          }),
          tabBackgroundColor:focusColor.withOpacity(0.1),
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'Cart',
            ),
            GButton(
              icon: Icons.person,
              text: 'Account',
            )
          ]),
    );
  }
}
