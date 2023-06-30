import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplayData extends StatefulWidget {
  DisplayData();
  @override
  DisplayScreenData createState() => DisplayScreenData();
}

class DisplayScreenData extends State<DisplayData> {
  DisplayScreenData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('task').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text('No data found'),
              );
            } else {
              print('reached here');
              return Container(
                height: 500,
                width: 500,
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Text('Todo : ${snapshot.data!.docs[index]['Todo']}'),
                        Text('id: ${snapshot.data!.docs[index]['id']}'),
                        Text('time: ${snapshot.data!.docs[index]['time']}'),
                      ],
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
