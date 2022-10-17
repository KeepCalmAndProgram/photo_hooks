import 'package:flutter/material.dart';
import 'package:photo_hooks/presentation/widgets/photo_view_widget.dart';
import 'package:photo_hooks/presentation/widgets/text_button_widget.dart';

class AlbumCorousel extends StatelessWidget {
  final double width;
  final double height;
  final String corouselTitleName;

  const AlbumCorousel({
    Key? key,
    required this.width,
    required this.height,
    required this.corouselTitleName,
  }) : super(key: key);

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              corouselTitleName,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextButtonCustomise(
              text: 'All',
              onPressed: onPressed,
            ),
          ],
        ),
        SizedBox(
          height: 210,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(12),
            itemCount: 5,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  PhotoView(
                    width: width,
                    height: height,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      'Text',
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
