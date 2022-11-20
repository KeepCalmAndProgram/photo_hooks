import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_hooks/bloc/photo_presentation_model.dart';
import 'package:photo_hooks/database/photo_service.dart';
import 'package:uuid/uuid.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoService _photoService;
  final uuid = const Uuid();

  PhotoBloc(this._photoService) : super(PhotoInitial()) {
    on<RegisterEvent>((event, emit) async {
      await _photoService.init();
      add(LoadPhotoCounter());
    });
    on<LoadPhotoCounter>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(PhotosLoaded(photos: _photoService.getPhotos()));
    });
    on<AddPhoto>((event, emit) {
      if (state is PhotosLoaded) {
        final state = this.state as PhotosLoaded;
        emit(
          PhotosLoaded(
            photos: List.from(state.photos)..add(event.photo),
          ),
        );
      }
    });
    on<SelectPhoto>((event, emit) {
      if (state is PhotosLoaded) {
        final state = this.state as PhotosLoaded;
        emit(
          PhotosLoaded(
            photos: List.from(state.photos)
              ..elementAt(int.parse(event.photo.id)),
          ),
        );
        print('index: ' + event.photo.id);
      }
    });
    on<RemovePhoto>((event, emit) async {
      if (state is PhotosLoaded) {
        final state = this.state as PhotosLoaded;
        await _photoService.removePhoto(event.photo.image, event.photo.id);
        emit(
          PhotosLoaded(
            photos: List.from(state.photos)..remove(event.photo),
          ),
        );
      }
    });
  }

  Future<void> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final tmpImage = File(image.path);
      final photo = PhotoPresentationModel(
        id: uuid.v4(),
        name: image.name,
        image: tmpImage,
      );
      _photoService.addPhoto(photo);
      add(AddPhoto(photo));
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed: $e');
      }
    }
  }

  Future<void> selectImage() async {
    try {
      //final image = await
      // ne znaju kakie ja poluchaju dannyje kogda nazymaju na foto.
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed: $e');
      }
    }
  }
}
