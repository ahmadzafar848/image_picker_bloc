import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_bloc/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:image_picker_bloc/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImagePickerBloc>(
      create: (context) => ImagePickerBloc(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
