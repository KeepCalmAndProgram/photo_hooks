import 'package:flutter/material.dart';
import 'package:photo_hooks/presentation/widgets/photo_view_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_hooks/bloc/photo_bloc.dart';

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
          padding: const EdgeInsets.all(6),
          child: BlocBuilder<PhotoBloc, PhotoState>(
            builder: (context, state) {
              if (state is PhotoInitial) {
                return const CircularProgressIndicator(color: Colors.orange);
              }
              if (state is PhotoLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${state.photos.length}',
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width,
                      child: Wrap(
                        spacing: 5.0,
                        runSpacing: 5.0,
                        children: [
                          ...state.photos
                              .map((photo) => PhotoView(
                                    width: _width,
                                    height: _height,
                                    image: photo.image,
                                  ))
                              .toList(),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return const Text('Something went wrong!');
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () => context.read<PhotoBloc>().pickImage(),
        child: const Icon(Icons.add_a_photo_outlined),
      ),
    );
  }
}
