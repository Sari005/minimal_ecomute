import 'package:flutter/material.dart';
import 'package:minimalecomute/models/shop.dart';
import 'package:minimalecomute/pages/Cart_page.dart';
import 'package:minimalecomute/pages/intro_page.dart';
import 'package:minimalecomute/pages/shopPage.dart';
import 'package:minimalecomute/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => IntroPage(),
        '/shop_page': (context) => ShopPage(),
        '/cart_page': (context) => CartPage(),
      },
    );
  }
}
