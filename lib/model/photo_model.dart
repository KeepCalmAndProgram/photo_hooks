import 'dart:io';

import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

part 'photo_model.g.dart';

@HiveType(typeId: 1)
class PhotoModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final File image;

  const PhotoModel({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];
}

/*
class PhotoModel extends Equatable {
  final String id;
  final String name;
  final File image;

  const PhotoModel({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];
}*/
