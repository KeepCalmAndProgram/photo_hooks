part of 'photo_bloc.dart';

abstract class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => [];
}

class LoadPhotoCounter extends PhotoEvent {}

class AddPhoto extends PhotoEvent {
  final PhotoModel photo;

  const AddPhoto(this.photo);

  @override
  List<Object> get props => [photo];
}

class RemovePhoto extends PhotoEvent {
  final PhotoModel photo;

  const RemovePhoto(this.photo);

  @override
  List<Object> get props => [photo];
}
