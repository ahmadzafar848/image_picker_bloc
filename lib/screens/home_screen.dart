// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_bloc/bloc/image_picker_bloc/image_picker_bloc.dart';
// import 'package:provider/provider.dart';
//
// import '../widgets/home_screen_ui.dart';
//
// class HomeScreen extends StatelessWidget {
//   HomeScreen({Key? key}) : super(key: key);
//   String path = '';
//
//   @override
//   Widget build(BuildContext context) {
//     //  File? file = File(xFile!.path);
//     ImagePickerBloc bloc = Provider.of(context, listen: false);
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     double minimumSize = min(height, width);
//
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             HomeScreenUI(
//               imagePath: path,
//             ),
//             BlocBuilder<ImagePickerBloc, ImagePickerState>(
//               builder: (context, state) {
//                 if (state is ImagePickerInitialState) {
//                   return SizedBox();
//                 } else if (state is ImagePickerLoadedState) {
//                   path = state.imagePath.path;
//                   XFile xFile = state.imagePath;
//                   return HomeScreenUI(
//                     imagePath: path,
//                     file: xFile,
//                   );
//                 } else if (state is ImagePickerFailedState) {
//                   bloc.add(ImagePickerInitialEvent());
//                   SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(state.message),
//                       ),
//                     );
//                   });
//                   return SizedBox();
//                 } else {
//                   return SizedBox();
//                 }
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
