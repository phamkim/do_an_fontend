

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../auth/login_view.dart';
import 'item_button.dart';

class NoLogin extends GetView {
  const NoLogin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = context.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: width * 0.5,
          width: width * 0.5,
          child: Lottie.network(
              "https://assets1.lottiefiles.com/private_files/lf30_m6j5igxb.json"),
        ),
        SizedBox(
          width: 150.0,
          child: ItemButton(
            text: "Login",
            icon: Icons.login_outlined,
            press: () {
              Get.toNamed('/log-in');
            },
          ),
        )

      ],
    );
  }
}
