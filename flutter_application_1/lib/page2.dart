import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyPage2 extends StatelessWidget {
  String name;
  MyPage2(this.name);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(child: Text(name)),
    );
  }
}
