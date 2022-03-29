import 'package:corso_base_flutter_alberto/methods.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  static String routeName = "/detail";

  const ProductDetailPage({Key? key}) : super(key: key);

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
            ElevatedButton(
              onPressed: () {
                changeScreen(context, isPop: true);
              },
              child: const Text("Esci"),
            ),
            ElevatedButton(
              onPressed: () {
                _onPressed(context, false);
              },
              child: Text(secondButtonText ?? "Mostra solo elementi tondi"),
            ),
            ElevatedButton(
              onPressed: () {
                _onPressed(context, true);
              },
              child: const Text("Mostra solo elementi quadrati"),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressed(BuildContext context, bool isSquare) {
    Navigator.pop(context, isSquare ? 1 : 0);
  }
}
