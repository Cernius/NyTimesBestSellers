import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products/Domain/Providers/Logger.dart';
import 'package:products/Presentation/Common/ErrorDialog.dart';
import 'package:products/Presentation/Common/NetworkErrorDialog.dart';


import '../Common/AppModule.dart';

import 'Common/Localizations/Strings.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  Logger getLogger() => injector.get<Logger>();
  Strings getStrings() => injector.get<Strings>();


  void showNetworkErrorDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return NetworkErrorDialog(context);
        });
  }

  void showErrorDialog(BuildContext context, String error) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ErrorDialog(context, error);
        });
  }
}
