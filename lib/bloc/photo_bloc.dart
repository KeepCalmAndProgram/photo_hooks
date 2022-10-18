import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:photo_hooks/model/photo_model.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc() : super(PhotoInitial()) {
    on<LoadPhotoCounter>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const PhotoLoaded(photos: <PhotoModel>[]));
    });
    on<AddPhoto>((event, emit) {
      if (state is PhotoLoaded) {
        final state = this.state as PhotoLoaded;
        emit(
          PhotoLoaded(
            photos: List.from(state.photos)..add(event.photo),
          ),
        );
      }
    });
    on<RemovePhoto>((event, emit) {
      if (state is PhotoLoaded) {
        final state = this.state as PhotoLoaded;
        emit(
          PhotoLoaded(
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
      add(
        AddPhoto(
          PhotoModel(
            id: '1',
            name: 'some name',
            image: tmpImage,
          ),
        ),
      );
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed: $e');
      }
    }
  }
}
