part of 'image_picker_bloc.dart';

@immutable
abstract class ImagePickerState {}

class ImagePickerInitialState extends ImagePickerState {}

class ImagePickerLoadedState extends ImagePickerState {
  final XFile imagePath;
  ImagePickerLoadedState({required this.imagePath});
}

class ImagePickerFailedState extends ImagePickerState {
  final String message;
  ImagePickerFailedState({required this.message});
}
