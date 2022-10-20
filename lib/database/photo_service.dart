import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'package:photo_hooks/model/photo_model.dart';

// TODO: WORK IN PROGRESS;
class PhotoService {
  late Box<PhotoModel> _photos;

  Future<void> init() async {
    Hive.registerAdapter(PhotoModelAdapter());
    _photos = await Hive.openBox<PhotoModel>('photos');
  }

  List<PhotoModel> getPhotos() {
    return _photos.values.toList();
  }

  void addPhoto(PhotoModel photo) {
    _photos.add(photo);
  }

  Future<void> removePhoto(File image, String id) async {
    final photoToRemove =
        _photos.values.firstWhere((element) => element.id == id);
    _photos.delete(photoToRemove);
  }
}
