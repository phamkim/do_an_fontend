import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './theme.dart';
import 'helper/control_binding.dart';
import 'views/control_view.dart';


void main() async {
  CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
  runApp(
    MyApp(
      appTheme: AppTheme(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appTheme}) : super(key: key);
  final AppTheme appTheme;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'font_end',
      initialBinding: ControlBinding(),
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const ControlView(),
    );
  }
}
