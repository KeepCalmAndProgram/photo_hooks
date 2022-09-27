import 'package:flutter/material.dart';

class TextButtonCustomise extends StatelessWidget {
  final String text;

  const TextButtonCustomise({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: Theme.of(context).textTheme.bodyText1,
      ),
      onPressed: () {},
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
