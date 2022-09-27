import 'dart:ffi';

import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final String textLeftSide;
  final String textRightSide;
  final IconData icon;

  const IconTextButton({
    Key? key,
    required this.textLeftSide,
    required this.textRightSide,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: Theme.of(context).textTheme.bodyText1,
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(1.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textLeftSide,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(1.0),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        textRightSide,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
