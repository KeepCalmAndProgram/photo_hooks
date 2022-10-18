part of 'photo_bloc.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class PhotoInitial extends PhotoState {}

class PhotoLoaded extends PhotoState {
  final List<PhotoModel> photos;

  const PhotoLoaded({required this.photos});

  @override
  List<Object> get props => [photos];
}
