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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'For You',
              style: TextStyle(
                // change to best version of text style in main !!!
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Memories',
                style: TextStyle(
                  // change to best version of text style in main !!!
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ), // for Recent widget
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: Text(
                  'All',
                  style: TextStyle(
                    // change to best version of text style in main !!!
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
                return PhotoView(width: _width, height: _height);
              },
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Photo Selection',
              style: TextStyle(
                // change to best version of text style in main !!!
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
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
                return PhotoView(width: _width, height: _height);
              },
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '01.09.2021',
              style: TextStyle(
                // change to best version of text style in main !!!
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
