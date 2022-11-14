import 'dart:io';
import 'package:flutter/material.dart';

import 'package:photo_hooks/presentation/screens/albums_screen.dart';
import 'package:photo_hooks/presentation/screens/for_you_screen.dart';
import 'package:photo_hooks/presentation/screens/photo_gallery_screen.dart';
import 'package:photo_hooks/presentation/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool isVisible = false;
  File? imageFile;

  late Future<File> pictureFile;
  late Image picture;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const _widgetOptions = <Widget>[
    PhotoGalleryScreen(),
    ForYouScreen(),
    AlbumsScreen(),
    SearchScreen(),
  ];

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text('Make a Choice...'),
          ),
          content: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //pickImageFromGallery(),
                  },
                  child: Icon(Icons.photo_album_outlined),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                    primary: Colors.cyan,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //pickImageFromGallery(),
                  },
                  child: Icon(Icons.camera_alt_outlined),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(CircleBorder()),
                    padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                    backgroundColor: MaterialStateProperty.all(Colors.cyan),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.red;
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
      body: _widgetOptions.elementAt(_selectedIndex),
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
      ),
    );
  }
}
