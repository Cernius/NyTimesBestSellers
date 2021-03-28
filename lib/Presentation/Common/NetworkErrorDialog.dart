import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NetworkErrorDialog extends AlertDialog {
  final BuildContext _parentContext;

  NetworkErrorDialog(this._parentContext)
      : super(
            title: Text("Network error"),
            content: Text("Check your network connection and try again"),
            actions: [
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(_parentContext);
                },
              )
            ]);
}
