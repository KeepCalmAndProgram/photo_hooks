import 'package:flutter/material.dart';

class TodoInput extends StatefulWidget {
  final Function addTodo;
  const TodoInput({Key? key, required this.addTodo}) : super(key: key);

  @override
  _TodoInputState createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  final _titleController = TextEditingController();

  void _submitdata() {
    widget.addTodo(_titleController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              )),
          TextButton(onPressed: _submitdata, child: const Text('Add Todo')),
        ],
      ),
    );
  }
}
