
// import 'dart:io';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_bloc/bloc/image_picker_bloc/image_picker_bloc.dart';
// import 'package:provider/provider.dart';
//
// class HomeScreenUI extends StatelessWidget {
//   HomeScreenUI({Key? key, this.imagePath, this.file}) : super(key: key);
//   String? imagePath;
//   XFile? file;
//   @override
//   Widget build(BuildContext context) {
//     ImagePickerBloc bloc = Provider.of(context, listen: false);
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     double minimumSize = min(height, width);
//     return Column(
//       children: [
//         SizedBox(
//           height: height * 0.2,
//           child: Center(
//             child: Text(
//               'Pick Image',
//               style: TextStyle(fontSize: 18),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             bloc.add(ImagePickerLoadedEvent());
//           },
//           child: SizedBox(
//             height: height * 0.2,
//             child: Center(
//               child: CircleAvatar(
//                 radius: minimumSize,
//                 foregroundImage:
//                     imagePath == '' ? null : FileImage(File(imagePath!)),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         GestureDetector(
//           onTap: () {
//             if (file == null) {
//               print('empty');
//             } else {
//               print('ll');
//             }
//           },
//           child: Container(
//             height: height * 0.07,
//             width: width * 0.8,
//             color: Colors.blue,
//             child: Center(
//               child: Text('Send Data'),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_bloc/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:provider/provider.dart';

class HomeScreenUI extends StatelessWidget {
  HomeScreenUI({Key? key, this.imagePath, this.file}) : super(key: key);
  String? imagePath;
  XFile? file;

  @override
  Widget build(BuildContext context) {
    ImagePickerBloc bloc = Provider.of(context, listen: false);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double minimumSize = min(height, width);
    return Column(
      children: [
        SizedBox(
          height: height * 0.2,
          child: Center(
            child: Text(
              'Pick Image',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            bloc.add(ImagePickerLoadedEvent());
          },
          child: SizedBox(
            height: height * 0.2,
            child: Center(
              child: CircleAvatar(
                radius: minimumSize,
                foregroundImage:
                    imagePath == '' ? null : FileImage(File(imagePath!)),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            if (file == null) {
              print('empty');
            } else {
              File(file!.path);
              print('ll');
            }
          },
          child: Container(
            height: height * 0.07,
            width: width * 0.8,
            color: Colors.blue,
            child: Center(
              child: Text('Send Data'),
            ),
          ),
        )
      ],
    );
  }
}
