import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products/Common/AppModule.dart';

import 'Localizations/Strings.dart';

class ErrorDialog extends AlertDialog {
  ErrorDialog(BuildContext parentContext, String error)
      : super(
            title: Text(injector.get<Strings>().error),
            content: Text(error),
            actions: [
              FlatButton(
                child: Text(injector.get<Strings>().ok),
                onPressed: () {
                  Navigator.pop(parentContext);
                },
              )
            ]);
}
