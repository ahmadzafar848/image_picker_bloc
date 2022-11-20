import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker_bloc/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:image_picker_bloc/providers/image_picker_provider.dart';
import 'package:image_picker_bloc/screens/home_screen_provider.dart';

final imageProvider =
    StateNotifierProvider((ref) => ImagePickerProviderNotifier());

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImagePickerBloc>(
      create: (context) => ImagePickerBloc(),
      child: MaterialApp(
        home: HomeScreenProvider(),
      ),
    );
  }
}
