import 'package:flutter/material.dart';
import 'package:flutter_application_1/page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> entries = <String>[
    'Recent',
    'Flipkart',
    'Screenshots',
    'Nainital',
    'WhereAbout',
    'frisking'
  ];
  @override
  Widget build(BuildContext context) {
    List<String> arr = [
      'https://cdn.pixabay.com/photo/2023/03/05/16/20/sea-7831815_1280.jpg',
      'https://media.istockphoto.com/id/1133046601/photo/light-underwater.jpg?s=1024x1024&w=is&k=20&c=1SIqZyje1Ifto1Vta68M29Q5c_5OzUDWG1HXt_ZN9VU=',
      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
      'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_1280.jpg',
      'https://cdn.pixabay.com/photo/2014/04/14/20/11/pink-324175_1280.jpg',
      'https://cdn.pixabay.com/photo/2015/07/05/10/18/tree-832079_1280.jpg',
      'https://media.istockphoto.com/id/1296115846/photo/happy-child-boy-stock-photo.jpg?s=1024x1024&w=is&k=20&c=7LHJGYSLQMJiCBLvCaV72aShm3IJY24nVxE9a5cFos8=',
      'https://media.istockphoto.com/id/1412428562/vector/africa-political-map-with-country-names-isolated-vector-illustration.jpg?s=1024x1024&w=is&k=20&c=sizlcEvuucKGd7Tht-XYJ2U0rrgBRRGcovKn98NmFSM=',
      'https://media.istockphoto.com/id/803533956/photo/diwali-oil-lamp.jpg?s=1024x1024&w=is&k=20&c=xSxr-U_7BTmi70kYh7TuIRQeqQqjY4d3Gbm6T04jxOo=',
      'https://media.istockphoto.com/id/1044388000/photo/priest-worshipping-goddess-durga-durga-puja-festival-celebration.jpg?s=612x612&w=0&k=20&c=ZNjOXd3OlItDgIPnU7rHJfcH-r33Q0dEzOknQLIMnlw=',
      'https://media.istockphoto.com/id/1029328558/vector/illustration-of-lord-ganpati-background-for-ganesh-chaturthi-festival-of-india.jpg?s=612x612&w=0&k=20&c=im0j6kcacY-0UwOLA2eTjSo-ObvjtE-OfL2f_9gvai4=',
      'https://media.istockphoto.com/id/1141737652/photo/portrait-of-a-confident-young-man.jpg?s=1024x1024&w=is&k=20&c=GwnR6CuiuHpu6ThoHMV_gaCfvh7UeZIRbSXFN7Mg17E=',
      'https://media.istockphoto.com/id/483752415/photo/taj-mahal-mosque-india.jpg?s=1024x1024&w=is&k=20&c=ppnV-H_oPvPo7B2rzqctylSfaWBCzkYIJh3PpOOZFFU=',
      'https://media.istockphoto.com/id/1069278366/vector/set-of-travel-visa-stamps-for-passports-international-and-immigration-office-stamps-arrival.jpg?s=612x612&w=0&k=20&c=KUgx29l1MJ0HnP9uqd9dZeVbIRXUMzadPLXoZYirJUg=',
      'https://media.istockphoto.com/id/949472768/photo/tiger-portrait.jpg?s=612x612&w=0&k=20&c=cPI-hIwXxLwRYcGW3HaC_3C6J_MMIE_BbMjI9Ac0XNE=',
      'https://media.istockphoto.com/id/949472768/photo/tiger-portrait.jpg?s=612x612&w=0&k=20&c=cPI-hIwXxLwRYcGW3HaC_3C6J_MMIE_BbMjI9Ac0XNE=',
      'https://media.istockphoto.com/id/1363145508/photo/tourists-and-trackers-share-open-topped-jeep-off-road-4x4-for-animal-viewing-in-kanha.jpg?s=1024x1024&w=is&k=20&c=7aYHV2lgWuoqQTqTy5qtfYVSQG17_R_IhKjAF_aVG6E=',
      'https://media.istockphoto.com/id/645313880/photo/flower-garden.jpg?s=1024x1024&w=is&k=20&c=tr7lILhHVvf0UM-zm2pLQAChq3BpY-JUa-n-M4btC_Y=',
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade200,
        leading: IconButton(
          icon: Icon(
            Icons.settings,
          ),
          onPressed: () {},
        ),
        title: Center(
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://media.istockphoto.com/id/876003902/photo/the-color-flag.jpg?s=612x612&w=0&k=20&c=Ge0D9IKJnsRT2D7PNtowFjvRtcv_mi0HitYNC7GO0ZI='),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: const DecorationImage(
                  image: NetworkImage(
                      'data:image/jpeg;base64,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'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: ,
          children: [
            Container(
              height: 50,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        print("index$index");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyPage2(entries[index])),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            // border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Center(
                              child: Text(
                            '  ${entries[index]} ',
                            style: TextStyle(color: Colors.black54),
                          )),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'My Gallery',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              width: 400,
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: arr.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        color: Colors.amber,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(arr[index])),
                          ),
                        )

                        //  Image.network(arr[index])),
                        );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Get Inspired',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      )),
                  Container(
                      height: 30,
                      width: 30,
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                        image: NetworkImage(
                            'https://www.freeiconspng.com/uploads/fire-vector-icon-png-27.png'),
                        fit: BoxFit.fill,
                      )))
                ],
              ),
            ),
            Container(
              height: 400,
              width: 400,
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: arr.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        color: Colors.amber,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(arr[index])),
                          ),
                        ));
                  }),
            )
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
