import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../core/viewmodels/auth_view_model.dart';
import '../constance.dart';
import '../widgets/custom_social_button.dart';
import '../widgets/login_form.dart';

class LoginView extends GetWidget<AuthViewModel> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = context.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: ListView(
          children: [
            SizedBox(
              height: width * 0.7,
              child: Lottie.network(
                  "https://assets4.lottiefiles.com/packages/lf20_jcikwtux.json"),
            ),
            const SizedBox(
              height: 30.0,
            ),
            LoginForm(),
            const SizedBox(
              height: 30.0,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "-OR-",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            CustomSocialButton(
              text: "Sign In with Google",
              src: 'assets/images/google.png',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
