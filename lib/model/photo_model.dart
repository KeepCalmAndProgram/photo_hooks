import 'dart:io';

import 'package:equatable/equatable.dart';

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
}
