import 'dart:js_util';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_medha/page7.dart';

class MyPage6 extends StatefulWidget {
  const MyPage6({super.key});
  State<StatefulWidget> createState() => _MyPage6();
}

class _MyPage6 extends State<MyPage6> {
  final mycontroller = TextEditingController();
  final mycontroller2 = TextEditingController();
  List<String> mycontroller3 = [];
  final List<String> todos = <String>[];
  String text = ' ';

  void refresh() {
    setState(() {});
  }

  clearlist() {
    mycontroller3.clear();
  }

  late DocumentReference dr;
  int counter = 0;
  // function to add the task to fire base
  Future addtasktofirebase() async {
    print("gvgvgvgv");
    var time = DateTime.now();
    await FirebaseFirestore.instance
        .collection('task')
        .doc(counter.toString())
        .set({
          "Todo": mycontroller.text,
          "time": time.toString(),
          "id": counter,
          "ischeck": false
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));

    counter++;
  }

  Future updateTasktofirebase({String? docId, bool isCheck = false}) async {
    await FirebaseFirestore.instance
        .collection('task')
        .doc(docId)
        .update({"ischeck": isCheck})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future updateTexttofirebase({String? docId, required String edited}) async {
    await FirebaseFirestore.instance
        .collection('task')
        .doc(docId)
        .update({"Todo": edited})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future removetasktofirebase(String? docId) async {
    print('zdecdfcer');
    FirebaseFirestore.instance
        .collection('task')
        .doc(docId)
        .delete()
        .then((value) => print("deleted"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future removemultiplefirebase() async {
    print('abab');
  }

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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(color: Color.fromARGB(255, 19, 139, 238)),
                  ),
                ),
                // textfield and controller
                child: TextField(
                  autofocus: true,
                  cursorColor: Colors.black,
                  // showCursor: true,
                  // on submitted is property of textfield to enter the data fr
                  onSubmitted: (value) {
                    if (mycontroller.text.isEmpty) {
                      var snack = SnackBar(
                        content: Text('empty text'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snack);
                    }
                    if (mycontroller.text.isEmpty == false) {
                      addtasktofirebase();
                      //todos.add(mycontroller.text.toUpperCase());
                    }
                    mycontroller.clear();
                    setState(() {});
                  },
                  //textInputAction: TextInputAction.go,

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
                        addtasktofirebase();
                        if (mycontroller.text.isEmpty) {
                          var snack = SnackBar(
                            content: Text('empty text'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snack);
                        }
                        if (mycontroller.text.isEmpty == false) {
                          todos.add(mycontroller.text.toUpperCase());
                        }
                        mycontroller.clear();
                        setState(() {});
                      },
                      child: Text(
                        style: TextStyle(
                          color: Colors.black,
                          //decoration: TextDecoration.lineThrough
                        ),
                        'Add Todo',
                      )),
                  // TextButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => DisplayData()));
                  //     },
                  //     child: Text('Display')),
                  SizedBox(
                    height: 10,
                  ),

                  //deleteing multiple
                  // StreamBuilder<QuerySnapshot>(
                  //     stream: FirebaseFirestore.instance
                  //         .collection('task')
                  //         .snapshots(),
                  //     builder: (BuildContext context,
                  //         AsyncSnapshot<QuerySnapshot> snapshot) {
                  //       // if(snapshot.data.docs.length)

                  //       return IconButton(
                  //           onPressed: () {
                  //             for (int i = 0; i < mycontroller3.length; i++) {
                  //               removetasktofirebase(mycontroller3[i]);

                  //               // todos.removeAt(mycontroller3[i]);
                  //               // todos.insert(mycontroller3[i], 'medha');
                  //               // isChecked[mycontroller3[i]] = false;
                  //               // itr += 1;

                  //               print("tyyy$todos");
                  //             }

                  //             //  todos.removeWhere((element) => element == 'medha');
                  //             setState(() {
                  //               clearlist();
                  //             });
                  //           },
                  //           icon: Icon(Icons.delete_forever));
                  //     }),

                  //  here starts the container for list tile
                  Container(
                    //height: 500,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('task')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.data!.docs.length == 0) {
                            print('snapshothasdata');
                            return Container(
                              height: 200,
                              width: 200,
                              color: Colors.red,
                              child: Center(
                                child: Text('No Text To Display'),
                              ),
                            );
                          } else {
                            return Column(
                              children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Dismissible(
                                        key: UniqueKey(),
                                        onDismissed: (_) {
                                          setState(() {
                                            // todos.removeAt(index);
                                            removetasktofirebase(
                                                snapshot.data!.docs[index].id);
                                          });
                                        },
                                        background: Container(
                                          color: Colors.red,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          alignment: Alignment.centerRight,
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          ),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.all(4),
                                          child: CheckboxListTile(
                                            value: snapshot.data!.docs[index]
                                                ['ischeck'],
                                            // selected: isChecked[index],
                                            activeColor: Colors.red,
                                            onChanged: (value) {
                                              updateTasktofirebase(
                                                  docId: snapshot
                                                      .data!.docs[index].id,
                                                  isCheck: value!);

                                              setState(() {
                                                mycontroller3.add(snapshot
                                                    .data!.docs[index].id);

                                                //  isChecked[index] = value!;

                                                ///error 1
                                                // if (isChecked[index] == true) {
                                                //   mycontroller3.add(index);
                                                // } else {
                                                //   mycontroller3.remove(index);
                                                // }

                                                print(
                                                    "mycontroller3$mycontroller3");
                                              });

                                              // isChecked = false;
                                            },

                                            title: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 40,
                                                  child: Row(
                                                    children: [
                                                      GestureDetector(
                                                          onTap: () {
                                                            removetasktofirebase(
                                                                snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                    .id);
                                                            setState(() {
                                                              todos.removeAt(
                                                                  index);
                                                            });
                                                          },
                                                          child: Icon(
                                                              Icons.delete)),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: GestureDetector(
                                                      onDoubleTap: () {
                                                        //mycontroller2.text =
                                                        // todos[index];

                                                        showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              AlertDialog(
                                                            title: Text('EDIT'),
                                                            content: TextField(
                                                              controller:
                                                                  mycontroller2,
                                                              decoration:
                                                                  InputDecoration(
                                                                      hintText:
                                                                          ''),
                                                            ),
                                                            actions: [
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    updateTexttofirebase(
                                                                        docId: snapshot
                                                                            .data!
                                                                            .docs[
                                                                                index]
                                                                            .id,
                                                                        edited:
                                                                            mycontroller2.text);

                                                                    Navigator.of(
                                                                            context)
                                                                        .pop(mycontroller2
                                                                            .text);
                                                                  },
                                                                  child: Text(
                                                                      'submit'))
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                      child: Icon(Icons.edit)),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  child: snapshot
                                                              .data!.docs[index]
                                                          ['ischeck']
                                                      ? Text(
                                                          '${snapshot.data!.docs[index]['Todo']}',
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              fontSize: 20))
                                                      : Text(" " +
                                                          '${snapshot.data!.docs[index]['Todo']}'),
                                                ),
                                                // Container(
                                                //   child: StreamBuilder<QuerySnapshot>(
                                                //     stream: FirebaseFirestore.instance
                                                //         .collection('task')
                                                //         .snapshots(),
                                                //     builder: (BuildContext context,
                                                //         AsyncSnapshot<QuerySnapshot>
                                                //             snapshot) {
                                                //       if (!snapshot.hasData) {
                                                //         return Center(
                                                //           child: Text('No data found'),
                                                //         );
                                                //       } else {
                                                //         print('reached here');
                                                //         return Container(
                                                //           height: 500,
                                                //           width: 500,
                                                //           child: ListView.builder(
                                                //             itemCount:
                                                //                 snapshot.data!.docs.length,
                                                //             itemBuilder: (context, index) {
                                                //               return Column(
                                                //                 children: <Widget>[
                                                //                   Text(
                                                //                       'Todo : ${snapshot.data!.docs[index]['Todo']}'),
                                                //                   Text(
                                                //                       'id: ${snapshot.data!.docs[index]['id']}'),
                                                //                   Text(
                                                //                       'time: ${snapshot.data!.docs[index]['time']}'),
                                                //                 ],
                                                //               );
                                                //             },
                                                //           ),
                                                //         );
                                                //       }
                                                //     },
                                                //   ),
                                                // ),
                                              ],
                                            ),

                                            tileColor: Colors.grey.shade300,
                                            // last part of tile
                                            //subtitle
                                            subtitle: Row(
                                              children: [],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                IconButton(
                                    onPressed: () {
                                      for (int i = 0;
                                          i < mycontroller3.length;
                                          i++) {
                                        removetasktofirebase(mycontroller3[i]);

                                        // todos.removeAt(mycontroller3[i]);
                                        // todos.insert(mycontroller3[i], 'medha');
                                        // isChecked[mycontroller3[i]] = false;
                                        // itr += 1;

                                        print("tyyy$todos");
                                      }

                                      //  todos.removeWhere((element) => element == 'medha');
                                      setState(() {
                                        clearlist();
                                      });
                                    },
                                    icon: Icon(Icons.delete_forever)),
                              ],
                            );
                          }
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class DialogAlert extends StatelessWidget {
//   const DialogAlert({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('empty string '),
//       content: const Text('AlertDialog description'),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () => Navigator.pop(context, 'OK'),
//           child: const Text('OK'),
//         ),
//       ],
//     );
//   }
// }
