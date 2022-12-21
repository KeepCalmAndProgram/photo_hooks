part of 'photo_bloc.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class PhotoInitial extends PhotoState {}

class PhotosLoaded extends PhotoState {
  final List<PhotoPresentationModel> photos;

  const PhotosLoaded({required this.photos});

  @override
  List<Object> get props => [photos];
}
