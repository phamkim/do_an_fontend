
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helper/api_config.dart';
import '../constance.dart';

class CategoryButton extends GetView {
  const CategoryButton(
      {Key? key,
      required this.active,
      required this.photo,
      required this.name,
      required this.onPress})
      : super(key: key);
  final String photo;
  final String name;
  final Function onPress;
  final Color active;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorder), color: active),
          child: InkWell(
            borderRadius: BorderRadius.circular(kBorder),
            highlightColor: Colors.transparent,
            onTap: (){
              onPress();
            },
            child: Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Image.network('$baseUri/photos/$photo'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: kPadding),
          child: Text(name),
        )
      ],
    );
  }
}
