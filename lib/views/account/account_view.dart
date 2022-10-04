import 'package:do_an_fontend/core/viewmodels/account_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountViewModel controller = Get.find<AccountViewModel>();
    return const Center(
      child: Text("AccountView"),
    );
  }
}