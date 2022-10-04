

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Empty extends GetView {
  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    return SizedBox(
      height: width * 0.2,
      child: Lottie.network(
          "https://assets4.lottiefiles.com/packages/lf20_EMTsq1.json"),
    );
  }
}
