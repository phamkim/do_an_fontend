

import 'package:flutter/material.dart';

import '../constance.dart';

class ItemButton extends StatelessWidget {
  const ItemButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
    this.iconRight,
  }) : super(key: key);

  final String text;
  final IconData? iconRight;
  final IconData icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: kPadding, vertical: kPadding),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(kPadding * 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorder),
          ),
          backgroundColor: Theme.of(context).cardColor,
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 20),
            Expanded(child: Text(text)),
            if (iconRight != null) Icon(iconRight, size: 15.0,),
          ],
        ),
      ),
    );
  }
}
