//import 'dart:js_util';
//import 'dart:math';

import 'dart:js_util';

import 'package:flutter/material.dart';

class MyPage4 extends StatefulWidget {
  const MyPage4({super.key});
  State<StatefulWidget> createState() => _MyApp4();
}

class _MyApp4 extends State<MyPage4> {
  final mycontroller = TextEditingController();
  final mycontroller2 = TextEditingController();
  List<int> mycontroller3 = [];
  final List<String> todos = <String>[];
  String text = ' ';
  static int _len = 100;
  // bool isChecked = false;
  List<bool> isChecked = List.generate(_len, (index) => false);

  @override
  Widget build(BuildContext context) {
    // get color function

    return Scaffold(
      // appbar build
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 19, 139, 238),
        title: Text('Flutter Todo List'),
      ),
      // body of project
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color.fromARGB(255, 19, 139, 238)),
                ),
              ),
              // textfield and controller
              child: TextField(
                controller: mycontroller,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                // add button for adding from textfield
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.purple.shade100),
                    ),
                    onPressed: () {
                      todos.add(mycontroller.text.toUpperCase());
                      mycontroller.clear();
                      setState(() {});
                    },
                    child: Text(
                        style: TextStyle(color: Colors.black), 'Add Todo')),
                SizedBox(
                  height: 10,
                ),

                //inkwell delete
                IconButton(
                    onPressed: () {
                      for (int i = 0; i < mycontroller3.length; i++) {
                        todos.removeAt(mycontroller3[i]);
                        isChecked[mycontroller3[i]] = false;
                        print("tyyy$todos");
                      }
                      setState(() {});
                    },
                    icon: Icon(Icons.delete_forever)),
                // here starts the container for list tile
                Container(
                  height: 1000,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.all(4),
                          child: CheckboxListTile(
                            value: isChecked[index],
                            selected: isChecked[index],
                            onChanged: (value) {
                              setState(() {
                                isChecked[index] = value!;
                                mycontroller3.add(index);
                                print("mycontroller3$mycontroller3");
                              });

                              // isChecked = false;
                            },
                            secondary: Container(
                              padding: EdgeInsets.only(top: 15),
                              child: GestureDetector(
                                  onDoubleTap: () {
                                    // edit option
                                    mycontroller2.text = todos[index];
                                    // dialouge box
                                    showDialog(
                                        context: context,
                                        builder: (context) => SimpleDialog(
                                              children: [
                                                TextField(
                                                  controller: mycontroller2,
                                                ),
                                                ElevatedButton(
                                                    // this is elevate buttn of dialouge box
                                                    onPressed: () {
                                                      setState(() {
                                                        todos[index] =
                                                            mycontroller2.text;
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('Update'))
                                              ],
                                            ));
                                  },
                                  child: Icon(Icons.edit)),
                            ),
                            title: Text('  ${todos[index]} '),
                            tileColor: Colors.grey.shade300,
                            // last part of tile
                            subtitle: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 80,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            todos.removeAt(index);
                                          });
                                        },
                                        child: Icon(Icons.delete)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
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
