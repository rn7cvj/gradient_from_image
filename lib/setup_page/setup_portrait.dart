import 'package:flutter/material.dart';
import 'package:gradient_from_image/setup_page/widgets/image_uploader.dart';
import 'package:gradient_from_image/setup_page/widgets/size_picker.dart';

class SetupPortrait extends StatelessWidget {
  const SetupPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizePicker(),
              ImageUploader(),
            ],
          ),
        ),
      ),
    );
  }
}
