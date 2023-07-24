import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gradient_from_image/pages/setup_page/widgets/generate_button.dart';
import 'package:gradient_from_image/pages/setup_page/widgets/image_uploader.dart';
import 'package:gradient_from_image/pages/setup_page/widgets/processed_placeholder.dart';
import 'package:gradient_from_image/pages/setup_page/widgets/size_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

class SetupPortrait extends StatelessWidget {
  SetupPortrait({super.key});

  final Observable<XFile?> img = Observable<XFile?>(null);

  final Observable<bool> isProcessed = Observable<bool>(false);

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) {
          if (isProcessed.value) {
            return const Scaffold(
              body: ProcessedPlaceholder(),
            );
          }

          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizePicker(),
                    ImageUploader(img: img),
                    GenerateButton(
                      img: img,
                      isProcessed: isProcessed,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
