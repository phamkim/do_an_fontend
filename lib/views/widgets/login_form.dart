import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/viewmodels/auth_view_model.dart';
import '../auth/Register_view.dart';

import '../constance.dart';

class LoginForm extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    const borderRadius = BorderRadius.all(Radius.circular(kBorder));
    final border = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: primaryColor),
    );
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            cursorColor: primaryColor,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: border,
              focusedBorder: border,
              hintText: "your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Icon(
                  Icons.person,
                  color: primaryColor,
                ),
              ),
            ),
            onSaved: (value) {

            },
            validator: (value) {
              if (value == null) {
                return 'Please enter email';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              decoration: InputDecoration(
                border: border,
                focusedBorder: border,
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(kPadding),
                  child: Icon(
                    Icons.lock,
                    color: primaryColor,
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(kPadding),
                  child: IconButton(
                    icon: const Icon(Icons.visibility_off),
                    color: primaryColor,
                    onPressed: () {},
                  ),
                ),
              ),
              onSaved: (value) {

              },
              validator: (value) {
                if (value == null) {
                  return 'Please enter password';
                }
                return null;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot password?",
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(RegisterView());
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: primaryColor),
                ),
              )
            ],
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: Size(size.width, btnHeight),
            ),
            onPressed:  () {
                    _formKey.currentState?.save();
                    if (_formKey.currentState!.validate()) {

                    }
                  },
            child: const Text(
              "SIGN IN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
