import 'package:do_an_fontend/views/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/viewmodels/control_view_model.dart';

class ControlView extends GetView<ControlViewModel> {
  const ControlView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.currentPage),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
