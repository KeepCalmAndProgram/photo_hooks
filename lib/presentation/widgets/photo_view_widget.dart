import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_hooks/presentation/screens/photo_view_screen.dart';

class PhotoView extends StatefulWidget {
  final double height;
  final double width;
  final File image;

  const PhotoView({
    Key? key,
    required this.width,
    required this.height,
    required this.image,
  }) : super(key: key);

  @override
  State<PhotoView> createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PhotoViewScreen()),
            );
          },
          child: Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.lightBlueAccent,
            ),
            child: Image.file(
              widget.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
