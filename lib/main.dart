import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corso_base_flutter_alberto/firebase_options.dart';
import 'package:corso_base_flutter_alberto/screens/homepage_screen.dart';
import 'package:corso_base_flutter_alberto/screens/product_detail.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';


FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
FirebaseStorage firebaseStorage = FirebaseStorage.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
