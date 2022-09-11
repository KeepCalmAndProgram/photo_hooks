import 'package:flutter/material.dart';

class TodoStatus extends StatelessWidget {
  const TodoStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(onPressed: () {}, child: const Text('All')),
        TextButton(onPressed: () {}, child: const Text('Completed')),
        TextButton(onPressed: () {}, child: const Text('Uncompleted')),
      ],
    );
  }
}
