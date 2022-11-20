import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_hooks/presentation/screens/photo_view_screen.dart';

class PhotoView extends StatelessWidget {
  final double height;
  final double width;
  final File image;
  final VoidCallback? onRemoveCallback;

  const PhotoView({
    Key? key,
    required this.width,
    required this.height,
    required this.image,
    this.onRemoveCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () async {
            final isRemoved = await Navigator.push<bool>(
              context,
              MaterialPageRoute(
                builder: (context) => PhotoViewScreen(
                  image: image,
                ),
              ),
            );
            if (isRemoved == true) {
              onRemoveCallback?.call();
            }
          },
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.lightBlueAccent,
            ),
            child: Image.file(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
