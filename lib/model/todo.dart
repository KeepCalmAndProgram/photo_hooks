import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String image;

  @HiveField(2, defaultValue: false)
  bool completed;

  Todo({
    required this.id,
    required this.image,
    this.completed = false,
  });

  void toogleComplete() {
    completed = !completed;
  }
}
