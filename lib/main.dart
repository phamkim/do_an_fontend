
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './helper/binding.dart';
import './views/control_view.dart';
import './theme.dart';

void main() async {

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
      initialBinding: Binding(),
      title: 'k_app',
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: ControlView(),
      ),
    );
  }
}
