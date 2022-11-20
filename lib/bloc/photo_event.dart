part of 'photo_bloc.dart';

abstract class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => [];
}

class LoadPhotoCounter extends PhotoEvent {}

class RegisterEvent extends PhotoEvent {
  @override
  List<Object> get props => [];
}

class AddPhoto extends PhotoEvent {
  final PhotoPresentationModel photo;

  const AddPhoto(this.photo);

  @override
  List<Object> get props => [photo];
}

class RemovePhoto extends PhotoEvent {
  final PhotoPresentationModel photo;

  const RemovePhoto(this.photo);

  @override
  List<Object> get props => [photo];
}

class SelectPhoto extends PhotoEvent {
  final PhotoPresentationModel photo;

  const SelectPhoto(this.photo);

  @override
  List<Object> get props => [photo];
}
