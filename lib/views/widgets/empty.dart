

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Empty extends GetView {
  const Empty({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = context.width;
    return SizedBox(
      height: width * 0.5,
      width: width * 0.5,
      child: Lottie.network(
          "https://assets1.lottiefiles.com/packages/lf20_0s6tfbuc.json"),
    );
  }
}
