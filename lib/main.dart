import 'package:flutter/material.dart';
import 'package:flutter_application_5/models/shop.dart';
import 'package:flutter_application_5/pages/cart_page.dart';
import 'package:flutter_application_5/pages/intro_page.dart';
import 'package:flutter_application_5/pages/menu_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Shop(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/intropage': (context) => IntroPage(),
        '/menupage': (context) => MenuPage(),
        '/cartpage': (context) => CartPage(),
      },
    );
  }
}
