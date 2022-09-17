import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:photo_hooks/model/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todoBox = Hive.box('todos');
    todoBox.watch();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.58,
      child: todoBox.isNotEmpty
          ? ListView.builder(
              itemCount: todoBox.length,
              itemBuilder: (BuildContext ctx, index) {
                final todoItems = todoBox.getAt(index) as Todo;

                return Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      todoItems.image,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: todoItems.completed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: Colors.red,
                      ),
                    ),
                    leading: IconButton(
                      onPressed: () {
                        setState(() {
                          todoItems.toogleComplete();
                        });
                      },
                      icon: Icon(todoItems.completed
                          ? Icons.check_box
                          : Icons.check_box_outline_blank),
                    ),
                    trailing: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              todoBox.deleteAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              })
          : const Center(
              child: Text(
                'Oops!!! Your Todo is very Empty',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
    );
  }
}
