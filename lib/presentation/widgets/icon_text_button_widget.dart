import 'package:flutter/material.dart';

class IconTextButton extends StatefulWidget {
  final String text_left_side;
  final String text_right_side;
  final IconData icon;

  const IconTextButton({
    Key? key,
    required this.text_left_side,
    required this.text_right_side,
    required this.icon,
  }) : super(key: key);

  @override
  State<IconTextButton> createState() => _IconTextButtonState();
}

class _IconTextButtonState extends State<IconTextButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(
                widget.icon,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.text_left_side,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.text_right_side,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
