import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../../../i18n/strings.g.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({super.key, required this.img, required this.isProcessed});

  final Observable<XFile?> img;
  final Observable<bool> isProcessed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Observer(
          builder: (_) {
            return ElevatedButton(
              onPressed: img.value == null ? null : () => runInAction(() => isProcessed.value = true),
              child: Text(t.setup.generate),
            );
          },
        ),
      ),
    );
  }
}
