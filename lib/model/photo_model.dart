import 'package:hive/hive.dart';

part 'photo_model.g.dart';

@HiveType(typeId: 1)
class PhotoModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String imagePath;

  PhotoModel({
    required this.id,
    required this.name,
    required this.imagePath,
  });
}
