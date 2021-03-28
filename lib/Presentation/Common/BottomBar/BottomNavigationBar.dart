import 'package:flutter/material.dart';
import 'package:products/Presentation/BaseStatelessWidget.dart';
import 'package:products/Presentation/Common/BottomBar/BottomBarType.dart';
import 'package:products/Presentation/Products/Products.dart';
import 'package:products/Presentation/SecondScreen/SecondScreen.dart';

class MyBottomNavigationBar extends BaseStatelessWidget {
  final BottomBarType _bottomBarType;

  MyBottomNavigationBar(this._bottomBarType);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.black54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: FlatButton(
              child: Icon(
                Icons.list,
                color: Colors.white,
              ),
              onPressed: () {
                if (_bottomBarType == BottomBarType.LIST) {
                  return;
                }
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Products()));
              },
            ),
          ),
          Container(
            child: FlatButton(
              child: Icon(
                Icons.addchart_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                if (_bottomBarType == BottomBarType.SECOND) {
                  return;
                }
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SecondScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
