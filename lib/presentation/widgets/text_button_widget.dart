import 'package:flutter/material.dart';

class TextButtonWidget extends StatefulWidget {
  final String text;

  const TextButtonWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<TextButtonWidget> createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: Theme.of(context)
            .textTheme
            .bodyText1, //const TextStyle(fontSize: 20),
      ),
      onPressed: () {},
      child: Text(
        widget.text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
