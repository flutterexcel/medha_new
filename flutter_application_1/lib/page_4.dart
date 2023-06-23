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
  final List<String> todos = <String>[];
  String text = ' ';
  bool isChecked = false;

  //int counter = 0;

  @override
  Widget build(BuildContext context) {
    // get color function
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

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
                // here starts the container for list tile
                Container(
                  height: 1000,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.all(4),
                          child: ListTile(
                            leading: GestureDetector(
                                onDoubleTap: () {
                                  // edit option
                                  mycontroller2.text = todos[index];
                                  // dialouge box
                                  showDialog(
                                      context: context,
                                      builder: (context) => SimpleDialog(
                                            children: [
                                              TextField(
                                                // text field input of dialouge box for editing purpose
                                                controller: mycontroller2,
                                                // onChanged: (value) {
                                                //   setState(() {
                                                //     text = value;
                                                //   });
                                                // },
                                                // decoration: InputDecoration(
                                                //   hintText: todos[index]),
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
                            title: Text('  ${todos[index]} '),
                            tileColor: Colors.grey.shade300,
                            // last part of tile
                            trailing: Row(
                              children: [
                                Container(
                                  width: 50,
                                  child: Checkbox(
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      }),
                                ),
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
