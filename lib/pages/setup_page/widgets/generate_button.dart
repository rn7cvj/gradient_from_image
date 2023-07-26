import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:gradient_from_image/modal/image_gradinet.dart';
import 'package:gradient_from_image/navigator/router_delegate.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../../../i18n/strings.g.dart';

class GenerateButton extends StatelessWidget {
  GenerateButton({super.key, required this.img, required this.isProcessed, required this.width, required this.heigth});

  final Observable<XFile?> img;
  final Observable<int> width;
  final Observable<int> heigth;
  final Observable<bool> isProcessed;

  final IRouter navigationManager = GetIt.I<IRouter>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Observer(
          builder: (_) {
            return ElevatedButton(
              onPressed: img.value == null
                  ? null
                  : () async {
                      runInAction(() => isProcessed.value = true);

                      Uint8List imageBytes = await img.value!.readAsBytes();

                      ImageGradient gradient = ImageGradient(
                        imageBytes,
                        heigth.value,
                        width.value,
                      );
                      await gradient.gradientImage();
                      navigationManager.openGradientPage(gradient);
                      runInAction(() => isProcessed.value = false);
                    },
              child: Text(t.setup.generate),
            );
          },
        ),
      ),
    );
  }
}
