part of 'image_picker_bloc.dart';

@immutable
abstract class ImagePickerEvent {}

class ImagePickerInitialEvent extends ImagePickerEvent {}

class ImagePickerLoadedEvent extends ImagePickerEvent {}
