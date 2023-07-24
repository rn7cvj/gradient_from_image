import 'package:flutter/material.dart';
import 'package:gradient_from_image/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../../i18n/strings.g.dart';

class ImageUploader extends StatelessWidget {
  ImageUploader({super.key});

  Observable<XFile?> img = Observable<XFile?>(null);
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          ElevatedButton(
              onPressed: () async {
                var img = await picker.pickImage(source: ImageSource.gallery);
                print("object");
              },
              child: Text(t.setup.upload_image)),
        ],
      ),
    );
  }
}
