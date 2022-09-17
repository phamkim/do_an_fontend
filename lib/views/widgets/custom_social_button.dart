import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../views/constance.dart';

class CustomSocialButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final String src;
  const CustomSocialButton(
      {Key? key, required this.text, this.onPressed, required this.src})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    return TextButton(
      style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kPadding),
            side: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          minimumSize: Size(width, btnHeight)),
      onPressed: onPressed != null
          ? () {
              onPressed!();
            }
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(src),
          Expanded(
            child: Align(alignment: Alignment.center, child: Text(text)),
          ),
        ],
      ),
    );
  }
}
