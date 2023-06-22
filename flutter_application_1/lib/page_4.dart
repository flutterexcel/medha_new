import 'package:flutter/material.dart';

class MyPage4 extends StatefulWidget {
  const MyPage4({super.key});
  State<StatefulWidget> createState() => _MyApp4();
}

class _MyApp4 extends State<MyPage4> {
  final mycontroller = TextEditingController();
  final List<String> todos = <String>[];

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
                    onPressed: () {},
                    child: Text(
                        style: TextStyle(color: Colors.black), 'Add Todo')),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: ListTile(
                    onTap: () {print('clicked on the tile')},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    tileColor: Colors.grey,
                    leading: Container(
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.symmetric(vertical: 12),
                      height: 30,
                      width: 35,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5)),
                      child: IconButton(
                          onPressed: (){
                            print('clicked on delete item ');
                          },
                          color: Colors.white,
                          iconSize: 18,
                          icon: Icon(Icons.delete)),
                    ),
                    title: Text(
                      'check mail',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          decoration: TextDecoration.lineThrough),
                    ),
                    trailing: Icon(
                      Icons.check_box,
                      color: Colors.blue.shade200,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
