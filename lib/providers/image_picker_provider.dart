import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

@immutable
abstract class ImagePickerProvider {}

class ImagePickerInitialProvider extends ImagePickerProvider {}

class ImagePickerLoadedProvider extends ImagePickerProvider {
  final XFile xFile;
  ImagePickerLoadedProvider({required this.xFile});
}

class ImagePickerFailedProvider extends ImagePickerProvider {
  final String message;
  ImagePickerFailedProvider({required this.message});
}

class ImagePickerProviderNotifier extends StateNotifier<ImagePickerProvider> {
  ImagePickerProviderNotifier() : super(ImagePickerInitialProvider());

  void imagePickerInitial() {
    state = ImagePickerInitialProvider();
  }

  void imagePicker() async {
    ImagePicker picker = ImagePicker();
    try {
      XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
      if (xFile != null) {
        state = ImagePickerLoadedProvider(xFile: xFile);
      } else {
        state = ImagePickerFailedProvider(message: 'Image Picked Failed');
      }
    } catch (e) {
      state = ImagePickerFailedProvider(message: e.toString());
    }
  }
}
