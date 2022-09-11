import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import './presentation/screens/albums_screen.dart';
import './presentation/screens/galery_screen.dart';
import '../model/picture.dart';
import '../model/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './presentation/screens/photo_view_screen.dart';

/*void main() {
  runApp(const MyApp());
}*/

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox('todos');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Galery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool isVisible = false;
  File? imageFile;

  // in top how bylo do sql lite
  late Future<File> pictureFile;
  late Image picture;
  //late DBHelper dbHelper;
  late List<Picture> pictures;

  @override
  void initState() {
    super.initState();
    pictures = [];
    //dbHelper = DBHelper();
    //refreshImages();
  }

  /*refreshImages() {
    dbHelper.getPictures().then((imgs) {
      setState(() {
        pictures.clear();
        pictures.addAll(imgs);
      });
    });
  }

  pickImageFromGallery() {
    ImagePicker().pickImage(source: ImageSource.gallery).then((imgFile) async {
      String imgString = EncodingAndDecodingForPicture.base64String(
          await imgFile!.readAsBytes());
      Picture picture1 = Picture(0, imgString, id: null, pictureName: '');
      dbHelper.save(picture1);
      refreshImages();
    });
  }*/

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const _widgetOptions = <Widget>[
    PhotoGalery(),
    Text(
      'Index 1: For You', // change to new screen photo for you
    ),
    AlbumsScreen(),
    Text(
      'Index 3: Search',
    ),
  ];

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(child: Text('Make a Choice...')),
            content: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => {}, //pickImageFromGallery(),
                    child: Icon(Icons.photo_album_outlined),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      primary: Colors.cyan,
                    ),
                  ),
                  ElevatedButton(
                    // change to better version in top
                    onPressed: () => {}, //pickImageFromGallery(),
                    child: Icon(Icons.camera_alt_outlined),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(CircleBorder()),
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      backgroundColor: MaterialStateProperty.all(Colors.cyan),
                      overlayColor:
                          MaterialStateProperty.resolveWith<Color?>((states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.red;
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(widget.title),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      isVisible = !isVisible;
                    },
                    child: const Text('Select'),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showChoiceDialog(context);
        },
        tooltip: 'add photo',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_media_outlined,
              color: Colors.grey,
            ),
            label: 'Media Library',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.volunteer_activism_outlined,
              color: Colors.grey,
            ),
            label: 'For You',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_album_outlined,
              color: Colors.grey,
            ),
            label: 'Albums',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_outlined,
              color: Colors.grey,
            ),
            label: 'Search',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
