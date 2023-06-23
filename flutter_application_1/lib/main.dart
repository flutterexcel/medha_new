import 'package:flutter/material.dart';
import 'package:flutter_application_1/page2.dart';
import 'package:flutter_application_1/page_4.dart';

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
  @override
  Widget build(BuildContext context) {
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyPage4()));
            },
            child: Padding(
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
                            'data:image/png;base64,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'),
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
