import 'package:flutter/material.dart';
import 'package:photo_hooks/configuration/app_colors.dart';
import 'package:photo_hooks/configuration/app_text.dart';
import 'package:photo_hooks/presentation/widgets/photo_view_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late double _width;
  late double _height;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width / 3;
    _height = MediaQuery.of(context).size.height / 5;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Search',
                  style: TextStyle(
                    // change to best version of text style in main !!!
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          AppColors.secondaryColor,
                          AppColors.primaryColor,
                        ]),
                        borderRadius: BorderRadius.circular(40)),
                    padding: EdgeInsets.all(12),
                    child: Image.asset("assets/images/search.png")),
              ),
              Expanded(
                child: TextField(
                  style: TextStyle(color: AppColors.primaryColor),
                  decoration: InputDecoration(
                      hintText: AppText.seachName,
                      hintStyle: TextStyle(color: AppColors.appBarColor),
                      border: InputBorder.none),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Places',
              style: TextStyle(
                // change to best version of text style in main !!!
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
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
              'Sort by Data',
              style: TextStyle(
                // change to best version of text style in main !!!
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
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
        ],
      ),
    );
  }
}
