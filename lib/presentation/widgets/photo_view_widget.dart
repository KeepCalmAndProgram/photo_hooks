import 'dart:io';
import 'package:flutter/material.dart';

import '../screens/photo_view_screen.dart';

class PhotoView extends StatefulWidget {
  final double height;
  final double width;
  File? image;

  PhotoView({
    Key? key,
    required this.width,
    required this.height,
    this.image,
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
              MaterialPageRoute(builder: (context) => const PhotoViewScreen()),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: SizedBox(
              height: widget.height,
              width: widget.width,
              child: widget.image != null
                  ? Image.file(
                      widget.image!,
                      fit: BoxFit.cover,
                    )
                  : FlutterLogo(size: 50),
            ),
          ),
        ),
      ],
    );
  }
}
