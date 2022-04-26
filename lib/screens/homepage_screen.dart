import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corso_base_flutter_alberto/main.dart';
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
            child: SizedBox(
              child: Center(
                child: MaterialButton(
                  child: const Text("Entra nella lista dei file"),
                  color: Colors.red,
                  onPressed: () async {
                    changeScreen(
                      context,
                      screen: ProductDetailPage(),
                      isReplacement: true,
                    );

                    // CollectionReference dishesColl =
                    //     firestoreInstance.collection("dishes");
                    //
                    // List.generate(50, (int index) {
                    //   dishesColl.add({
                    //     "id": index,
                    //     "name": "Spaghetti alla carbonara",
                    //     "description": "Non mettere la panna",
                    //     "createdAt": Timestamp.now(),
                    //   });
                    // });

                    // dishesColl.doc(obj.id).set({
                    //   "description": "Non metterci la pancetta"
                    // });
                  },
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
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
                  Expanded(
                    child: StreamBuilder(
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<QueryDocumentSnapshot> _dishList =
                              (snapshot.data as QuerySnapshot).docs;
                          return _dishList.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text(
                                          _dishList[index].get("description")),
                                      leading: IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          firestoreInstance
                                              .collection("dishes")
                                              .doc(_dishList[index].id)
                                              .delete();
                                        },
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          firestoreInstance
                                              .collection("dishes")
                                              .doc(_dishList[index].id)
                                              .update({
                                            "description": "nuova desc"
                                          });
                                        },
                                      ),
                                    );
                                  },
                                  itemCount: _dishList.length,
                                )
                              : const Center(child: Text("No dishes"));
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                      stream: firestoreInstance
                          .collection("dishes")
                          .where(
                            "id",
                            isLessThan: 10,
                            isGreaterThan: 5,
                          )
                          .snapshots(),
                    ),
                  ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width,
                  //   child: Center(
                  //     child: MaterialButton(
                  //       child: const Text("Filtra"),
                  //       color: Colors.red,
                  //       onPressed: () async {
                  //         dynamic result = await changeScreen(
                  //           context,
                  //           screen: const ProductDetailPage(),
                  //         );
                  //
                  //         if (result != null) {
                  //           if (result == 1) {
                  //             print("Sono tutti quadrati");
                  //           } else {
                  //             print("Sono tutti tondi");
                  //           }
                  //         }
                  //
                  //         /*Navigator.pushReplacement(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (BuildContext context) {
                  //               return const ProductDetailPage();
                  //             },
                  //             //settings: const RouteSettings(arguments: "Ciao"),
                  //           ),
                  //         );*/
                  //
                  //         //Navigator.of(context).push(route);
                  //       },
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width,
                  //   child: Center(
                  //     child: MaterialButton(
                  //       child: const Text("Filtra senza testo"),
                  //       color: Colors.red,
                  //       onPressed: () async {
                  //         changeScreen(
                  //           context,
                  //           screen: ProductDetailPage(),
                  //           isReplacement: true,
                  //         );
                  //
                  //         //Navigator.of(context).push(route);
                  //       },
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
