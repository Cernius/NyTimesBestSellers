import 'package:flutter/material.dart';
import 'package:products/Domain/Providers/Logger.dart';
import 'package:products/Presentation/Common/NetworkErrorDialog.dart';
import '../Common/AppModule.dart';
import 'Common/Localizations/Strings.dart';


abstract class BaseState<Type extends StatefulWidget> extends State<Type> {
  Logger getLogger() => injector.get<Logger>();

  Strings getStrings() => injector.get<Strings>();

  void showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
        action: SnackBarAction(
          textColor: Colors.white,
          label: getStrings().close,
          onPressed: () {},
        )));
  }

  void showNetworkErrorDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return NetworkErrorDialog(context);
        });
  }
}
