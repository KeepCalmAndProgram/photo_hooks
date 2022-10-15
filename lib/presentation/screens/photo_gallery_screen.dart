import 'package:flutter/material.dart';
import 'package:photo_hooks/presentation/widgets/photo_view_widget.dart';

class PhotoGalleryScreen extends StatefulWidget {
  const PhotoGalleryScreen({Key? key}) : super(key: key);

  @override
  State<PhotoGalleryScreen> createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  late double _width;
  late double _height;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width / 4.3;
    _height = MediaQuery.of(context).size.height / 8;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: <Widget>[
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
              PhotoView(width: _width, height: _height),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'add photo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
