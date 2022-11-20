import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_bloc/main.dart';
import 'package:image_picker_bloc/widgets/home_screen_provider_ui.dart';

import '../providers/image_picker_provider.dart';

class HomeScreenProvider extends ConsumerWidget {
  HomeScreenProvider({
    Key? key,
  }) : super(key: key);
  String path = '';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          HomeScreenProviderUI(imagePath: path),
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(imageProvider);
              if (state is ImagePickerInitialProvider) {
                return SizedBox();
              } else if (state is ImagePickerLoadedProvider) {
                path = state.xFile.path;
                XFile xfile = state.xFile;
                return HomeScreenProviderUI(
                  imagePath: path,
                  file: xfile,
                );
              } else if (state is ImagePickerFailedProvider) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  ref.read(imageProvider.notifier).imagePickerInitial();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                });
                return SizedBox();
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
