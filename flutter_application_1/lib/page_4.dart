import 'dart:js_util';
import 'dart:math';

import 'package:flutter/material.dart';

class MyPage4 extends StatefulWidget {
  const MyPage4({super.key});
  State<StatefulWidget> createState() => _MyApp4();
}

class _MyApp4 extends State<MyPage4> {
  final mycontroller = TextEditingController();
  final List<String> todos = <String>['home', 'shop', 'exam', 'window'];
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 19, 139, 238),
        title: Text('Flutter Todo List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color.fromARGB(255, 19, 139, 238)),
                ),
              ),
              child: TextField(
                controller: mycontroller,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.purple.shade100),
                    ),
                    onPressed: () {
                      counter += 1;
                    },
                    child: Text(
                        style: TextStyle(color: Colors.black), 'Add Todo')),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1000,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: counter,
                      itemBuilder: (BuildContext context, int counter) {
                        return Text('ghhhhgg');
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
