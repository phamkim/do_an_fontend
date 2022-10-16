import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helper/api_config.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, required this.src, required this.size})
      : super(key: key);
  final String? src;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundImage:
      src != null ? NetworkImage('$baseUri/photos/$src') : null,
      backgroundColor: Theme.of(context).cardColor,
      child: src == null ? const Icon(CupertinoIcons.person) : null,
    );
  }
}
