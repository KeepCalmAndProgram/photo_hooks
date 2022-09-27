import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:photo_hooks/presentation/widgets/photo_view_widget.dart';

class ForYouScreen extends StatefulWidget {
  const ForYouScreen({Key? key}) : super(key: key);

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen> {
  late double _width;
  late double _height;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width / 1.05;
    _height = MediaQuery.of(context).size.height / 1.55;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'For You',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
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
                ), // for Recent widget
              ],
            ),
            Container(
              height: _height,
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
                        width: _width,
                        height: _height,
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
              height: (_height / 1.4),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(12),
                itemCount: 5,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      PhotoView(
                        width: _width,
                        height: _height,
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
        ),
      ),
    );
  }
}
