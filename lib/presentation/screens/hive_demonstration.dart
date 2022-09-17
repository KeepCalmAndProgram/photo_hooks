import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import 'package:photo_hooks/model/todo.dart';
import 'package:photo_hooks/presentation/widgets/todo_input.dart';
import 'package:photo_hooks/presentation/widgets/todo_list.dart';
import 'package:photo_hooks/presentation/widgets/todo_status.dart';

class HiveDemonstration extends StatefulWidget {
  const HiveDemonstration({Key? key}) : super(key: key);

  @override
  State<HiveDemonstration> createState() => _HiveDemonstrationState();
}

class _HiveDemonstrationState extends State<HiveDemonstration> {
  void _addtodo(String image) {
    final newtodo = Todo(
      id: const Uuid().v4(),
      image: image,
    );
    setState(
      () {
        Hive.box('todos').add(newtodo);
      },
    );
  }

  void _starttodo(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bctx) {
        return TodoInput(
          addTodo: _addtodo,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: const [
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 10,
              ),
              TodoStatus(),
              TodoList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _starttodo(context);
        },
        icon: const Icon(
          Icons.add_circle,
          size: 35,
        ),
        label: const Text(
          'Add new task',
          style: TextStyle(fontSize: 19),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Hive.close();
    super.dispose();
  }
}
