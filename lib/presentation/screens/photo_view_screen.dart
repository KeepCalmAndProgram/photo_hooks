import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';

class PhotoViewScreen extends StatelessWidget {
  final File image;
  PhotoViewScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  final _width = 400;
  final _height = 500;

  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: BlocBuilder<PhotoBloc, PhotoState>(
          builder: (context, state) {
            if (state is PhotoInitial) {
              return const CircularProgressIndicator(color: Colors.orange);
            }
            if (state is PhotosLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...state.photos
                      .map((photo) => PhotoView(
                            width: _width,
                            height: _height,
                            image: photo.image,
                          ))
                      .toList(),
                ],
              );
            } else {
              return const Text('Something went wrong!');
            }
          },
        ),
      ),
    );*/
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Photo View',
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.file(
            image,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3.0,
              sigmaY: 3.0,
            ),
            child: Container(
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
                    child: Container(
                        width: 400.0,
                        height: 550.0,
                        child: Image.file(
                          image,
                          //fit: BoxFit.cover,
                        )),
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
                          onPressed: () async {
                            try {
                              await image.delete();
                              Navigator.of(context).pop(true);
                            } catch (exception) {
                              Navigator.of(context).pop(false);
                            }
                          },
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
