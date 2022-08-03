import 'package:flutter/material.dart';

import '../screens/photo_view_screen.dart';

class PhotoView extends StatefulWidget {
  final double height;
  final double width;

  const PhotoView({Key? key, required this.width, required this.height}) : super(key: key);

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
              MaterialPageRoute(builder: (context) => const PhotoViewScreen()),
            );
          },
          child: Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.yellow, spreadRadius: 3),
              ],
            ),
          ),
        ),
      ],
    );
  }
}