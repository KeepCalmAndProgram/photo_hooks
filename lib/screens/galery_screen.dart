import 'dart:ffi';

import 'package:flutter/material.dart';
import '../widgets/photo_view_widget.dart';

class PhotoGalery extends StatefulWidget {
  const PhotoGalery({Key? key}) : super(key: key);

  @override
  State<PhotoGalery> createState() => _PhotoGaleryState();
}

class _PhotoGaleryState extends State<PhotoGalery> {
  late double _width;
  late double _heigth;

  @override
  Widget build(BuildContext context) {

    _width = MediaQuery.of(context).size.width / 5;
    _heigth = MediaQuery.of(context).size.height / 10;

    return SingleChildScrollView(
      child: Wrap(
        spacing: 17.0,
        runSpacing: 19.0,
        children: <Widget>[
          PhotoView(width: _width, height: _heigth),
          PhotoView(width: _width, height: _heigth),
          PhotoView(width: _width, height: _heigth),
          PhotoView(width: _width, height: _heigth),
          PhotoView(width: _width, height: _heigth),
          PhotoView(width: _width, height: _heigth),
          PhotoView(width: _width, height: _heigth),
          PhotoView(width: _width, height: _heigth),
          PhotoView(width: _width, height: _heigth),
          PhotoView(width: _width, height: _heigth),
          PhotoView(width: _width, height: _heigth),
          PhotoView(width: _width, height: _heigth),
          PhotoView(width: _width, height: _heigth),
          PhotoView(width: _width, height: _heigth),
        ],
      ),
    );
  }
}



