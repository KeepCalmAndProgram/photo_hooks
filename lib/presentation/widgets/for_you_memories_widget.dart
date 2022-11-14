import 'package:flutter/material.dart';
import 'package:photo_hooks/presentation/widgets/photo_view_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_hooks/bloc/photo_bloc.dart';

class ForYouMemories extends StatelessWidget {
  final double width;
  final double height;

  final VoidCallback onPressed;

  const ForYouMemories({
    Key? key,
    required this.width,
    required this.height,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        if (state is PhotoInitial) {
          return const CircularProgressIndicator(color: Colors.orange);
        }
        if (state is PhotosLoaded) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Memories',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ), // for Recent widget
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        'All',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(12),
                  itemCount: 5,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        ...state.photos
                            .map((photo) => PhotoView(
                                  width: width,
                                  height: height,
                                  image: photo.image,
                                ))
                            .toList(),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.share,
                                  color: Colors.white,
                                ),
                                onPressed: onPressed,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.heart_broken,
                                  color: Colors.white,
                                ),
                                onPressed: onPressed,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return const Text('Something went wrong!');
        }
      },
    );
  }
}
