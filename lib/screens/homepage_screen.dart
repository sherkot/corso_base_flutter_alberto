import 'package:corso_base_flutter_alberto/methods.dart';
import 'package:corso_base_flutter_alberto/screens/product_detail.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            height: MediaQuery.of(context).size.height / 4,
            child: const SizedBox(),
          ),
          Card(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: MaterialButton(
                      child: const Text("Filtra con route"),
                      color: Colors.red,
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(
                          context,
                          ProductDetailPage.routeName,
                          arguments: "Testo",
                        );

                        print(result);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: MaterialButton(
                      child: const Text("Filtra"),
                      color: Colors.red,
                      onPressed: () async {
                        dynamic result = await changeScreen(
                          context,
                          screen: const ProductDetailPage(),
                        );

                        if (result != null) {
                          if (result == 1) {
                            print("Sono tutti quadrati");
                          } else {
                            print("Sono tutti tondi");
                          }
                        }

                        /*Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const ProductDetailPage();
                            },
                            //settings: const RouteSettings(arguments: "Ciao"),
                          ),
                        );*/

                        //Navigator.of(context).push(route);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: MaterialButton(
                      child: const Text("Filtra senza testo"),
                      color: Colors.red,
                      onPressed: () async {
                        changeScreen(
                          context,
                          screen: ProductDetailPage(),
                          isReplacement: true,
                        );

                        //Navigator.of(context).push(route);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
