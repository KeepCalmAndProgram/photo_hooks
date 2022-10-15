import 'package:flutter/material.dart';
import 'package:photo_hooks/presentation/widgets/photo_view_widget.dart';

class ForYouPhotoSelection extends StatelessWidget {
  final double width;
  final double height;

  const ForYouPhotoSelection({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Photo Selection',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ),
        Container(
          height: (height / 1.4),
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
                    bottom: 10,
                    left: 10,
                    child: Text(
                      '01.09.2021',
                      style: Theme.of(context).textTheme.bodyText1,
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
