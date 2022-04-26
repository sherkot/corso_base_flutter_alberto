import 'package:corso_base_flutter_alberto/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  static String routeName = "/detail";

  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    final secondButtonText =
        ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text("Upload"),
              onPressed: () async {
                String dataUrl = 'data:text/plain;base64,SGVsbG8sIFdvcmxkIQ==';

                try {
                  await firebaseStorage
                      .ref().child("images.txt")
                      .putString(dataUrl, format: PutStringFormat.dataUrl);
                } on FirebaseException catch (e) {
                  // ...
                }
              },
            ),
            FutureBuilder(
              future: firebaseStorage.ref().list(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<Reference> _files = (snapshot.data as ListResult).items;
                  // print(_files);
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(_files[index].name),
                        leading: FutureBuilder(
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              print(snapshot.data);
                              return Image.network(snapshot.data);
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                          future: _files[index].getDownloadURL(),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _files[index].delete();
                          },
                        ),
                      );
                    },
                    itemCount: _files.length,
                  );
                }
                return Container();
              },
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     changeScreen(context, isPop: true);
            //   },
            //   child: const Text("Esci"),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     _onPressed(context, false);
            //   },
            //   child: Text(secondButtonText ?? "Mostra solo elementi tondi"),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     _onPressed(context, true);
            //   },
            //   child: const Text("Mostra solo elementi quadrati"),
            // ),
          ],
        ),
      ),
    );
  }

  void _onPressed(BuildContext context, bool isSquare) {
    Navigator.pop(context, isSquare ? 1 : 0);
  }
}
