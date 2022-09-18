import 'package:hive/hive.dart';

part 'picture.g.dart';

@HiveType(typeId: 0)
class Picture {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String image;

  Picture({
    required this.id,
    required this.image,
  });
}
