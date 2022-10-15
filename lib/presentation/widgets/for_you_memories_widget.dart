import 'package:flutter/material.dart';
import 'package:photo_hooks/presentation/widgets/photo_view_widget.dart';

class ForYouMemories extends StatelessWidget {
  final double width;
  final double height;

  const ForYouMemories({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  PhotoView(
                    width: width,
                    height: height,
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.share,
                            color: Colors.white54,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.heart_broken,
                            color: Colors.white54,
                          ),
                          onPressed: () {},
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
  }
}
