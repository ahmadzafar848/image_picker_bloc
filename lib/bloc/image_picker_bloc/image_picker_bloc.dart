import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImagePickerInitialState()) {
    on<ImagePickerInitialEvent>((event, emit) {
      emit.call(ImagePickerInitialState());
    });
    on<ImagePickerLoadedEvent>((event, emit) async {
      ImagePicker imagePicker = ImagePicker();
      try {
        XFile? xFile = await imagePicker.pickImage(source: ImageSource.gallery);
        if (xFile != null) {
          emit.call(ImagePickerLoadedState(imagePath: xFile));
        } else {
          emit.call(ImagePickerFailedState(message: 'Image Picked Failed'));
        }
      } catch (e) {
        emit.call(ImagePickerFailedState(message: '$e'));
      }
    });
  }
}
