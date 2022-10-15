import 'package:flutter/material.dart';

import 'package:photo_hooks/presentation/widgets/photo_view_widget.dart';

import 'package:photo_hooks/configuration/app_colors.dart';
import 'package:photo_hooks/presentation/widgets/text_button_widget.dart';
import 'package:photo_hooks/presentation/widgets/icon_text_button_widget.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  late double _width;
  late double _height;

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width / 3;
    _height = MediaQuery.of(context).size.height / 6;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Albums',
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
                        width: _width,
                        height: _height,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favorites',
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
                        width: _width,
                        height: _height,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent',
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
                        width: _width,
                        height: _height,
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
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Media File Types',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            Column(
              children: const [
                IconTextButton(
                  textLeftSide: 'Photo',
                  textRightSide: '10 >',
                  icon: Icons.photo_album_outlined,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                IconTextButton(
                  textLeftSide: 'Video',
                  textRightSide: '17 >',
                  icon: Icons.video_call_outlined,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                IconTextButton(
                  textLeftSide: 'Screenshots',
                  textRightSide: '3 >',
                  icon: Icons.screenshot_monitor_outlined,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Other',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            IconTextButton(
              textLeftSide: 'Recently Deleted',
              textRightSide: '0 >',
              icon: Icons.delete_outline,
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
