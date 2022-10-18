import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';

class PhotoViewScreen extends StatefulWidget {
  File? image;

  PhotoViewScreen({this.image, Key? key}) : super(key: key);

  @override
  State<PhotoViewScreen> createState() => _PhotoViewScreenState();
}

class _PhotoViewScreenState extends State<PhotoViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Photo View',
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://pics.filmaffinity.com/Mulan-807158695-large.jpg',
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3.0,
              sigmaY: 3.0,
            ),
            child: new Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    //alignment: Alignment.center,
                    child: Container(
                      width: 400.0,
                      height: 550.0,
                      child: widget.image != null
                          ? Image.file(
                              widget.image!,
                              fit: BoxFit.cover,
                            )
                          : FlutterLogo(size: 50),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 20.0,
                          offset: Offset(0.0, 10.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(25.0),
                    child: Text(
                      '12 July 2022',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.blue,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.ios_share_outlined),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.blue,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.volunteer_activism_outlined),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.blue,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.info_outline),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.blue,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
