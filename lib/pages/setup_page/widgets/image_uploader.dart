import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gradient_from_image/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../../../i18n/strings.g.dart';

class ImageUploader extends StatelessWidget {
  ImageUploader({super.key, required this.img});

  final Observable<XFile?> img;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Observer(
        builder: (_) {
          return Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  XFile? pickcedImg = await picker.pickImage(source: ImageSource.gallery);
                  runInAction(() => img.value = pickcedImg);
                },
                child: Text(t.setup.upload_image),
              ),
              if (img.value != null)
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(appPaddingSmall),
                    child: Text(
                      img.value!.name,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
