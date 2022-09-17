import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/viewmodels/auth_view_model.dart';
import './auth/login_view.dart';
import './home_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (true) ? HomeView() : const LoginView();
  }
}
