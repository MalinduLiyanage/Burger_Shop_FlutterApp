import 'package:burgershop/components/cartModel.dart';
import 'package:burgershop/pages/homePage.dart';
import 'package:burgershop/themes/themeData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        home: const homeWidget(),
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        darkTheme: nightMode,
      ),
    );
  }
}
