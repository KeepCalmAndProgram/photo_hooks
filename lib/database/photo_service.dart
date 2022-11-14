import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:photo_hooks/bloc/photo_presentation_model.dart';
import 'package:photo_hooks/model/photo_model.dart';

class PhotoService {
  late Box<PhotoModel> _photos;

  Future<void> init() async {
    _photos = await Hive.openBox<PhotoModel>('photos');
  }

  List<PhotoPresentationModel> getPhotos() {
    return _photos.values
        .map((photoDao) => PhotoPresentationModel(
              id: photoDao.id,
              name: photoDao.name,
              image: File(photoDao.imagePath),
            ))
        .toList();
  }

  Future<void> addPhoto(PhotoPresentationModel photo) async {
    _photos.add(PhotoModel(
      id: photo.id,
      name: photo.name,
      imagePath: photo.image.path,
    ));
  }

  Future<void> removePhoto(File image, String id) async {
    final photoToRemove = _photos.values.firstWhere((element) => element.id == id);
    _photos.delete(photoToRemove);
  }
}
