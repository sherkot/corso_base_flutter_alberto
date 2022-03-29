import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future changeScreen(
  BuildContext context, {
  Widget? screen,
  bool isReplacement = false,
  Object? arguments,
  bool isPop = false,
}) async {
  if (isPop) {
    return Navigator.pop(context);
  }

  CupertinoPageRoute myMPR = CupertinoPageRoute(
      builder: (BuildContext context) => screen!,
      settings: RouteSettings(arguments: arguments));

  return isReplacement
      ? await Navigator.pushReplacement(context, myMPR)
      : await Navigator.pushReplacement(context, myMPR);
}
