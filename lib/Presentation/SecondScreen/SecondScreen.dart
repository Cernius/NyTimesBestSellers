import 'package:flutter/material.dart';
import 'package:products/Presentation/BaseStatelessWidget.dart';
import 'package:products/Presentation/Common/BottomBar/BottomBarType.dart';
import 'package:products/Presentation/Common/BottomBar/BottomNavigationBar.dart';

class SecondScreen extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: Text(getStrings().newYorkTimes),
      ),
      bottomNavigationBar: MyBottomNavigationBar(BottomBarType.SECOND),
      body: Center(
          child: Container(
        color: Colors.grey[100],
        child: Text(getStrings().secondScreen),
      )),
    );
  }
}
