import './views/cart/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './theme.dart';
import 'bindings/account_binding.dart';
import 'bindings/home_binding.dart';
import 'bindings/product_binding.dart';
import 'bindings/root_binding.dart';
import 'views/account/account_view.dart';
import 'views/auth/login_view.dart';
import 'views/auth/register_view.dart';
import 'views/home/home_view.dart';
import 'views/home/product_view.dart';
import 'views/home/search_view.dart';

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
      title: 'font_end',
      initialRoute: '/',
      initialBinding: RootBinding(),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/log-in',
          page: () => const LoginView(),
        ),
        GetPage(
          name: '/register',
          page: () => RegisterView(),
        ),
        GetPage(
          name: '/cart',
          page: () => const CartView(),
        ),
        GetPage(
          name: '/account',
          page: () => const AccountView(),
          binding: AccountBinding(),
        ),
        GetPage(
          name: '/product/:id',
          page: () => ProductView(),
          binding: ProductBinding(),
        ),
        GetPage(
          name: '/search',
          page: () => const SearchView(),
        ),
      ],
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
