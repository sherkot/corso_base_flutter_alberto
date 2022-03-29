import 'package:corso_base_flutter_alberto/screens/homepage_screen.dart';
import 'package:corso_base_flutter_alberto/screens/product_detail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.cyan,
        scaffoldBackgroundColor: Colors.orangeAccent,
        cardColor: Colors.pink,
        cardTheme: const CardTheme(
          margin: EdgeInsets.all(20),
          elevation: 50,
        ),
        textTheme: TextTheme(
          headline6: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      ),
      routes: {
        "/": (context) => const MyHomePage(title: ""),
        ProductDetailPage.routeName: (context) => const ProductDetailPage(),
      },
      initialRoute: "/",
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
