import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gradient_from_image/constants.dart';
import 'package:mobx/mobx.dart';

import '../../../i18n/strings.g.dart';

class SizePicker extends StatelessWidget {
  SizePicker({super.key, required this.width, required this.heigth});

  Observable<bool> useSpecificSize = Observable<bool>(false);
  final Observable<int> width;
  final Observable<int> heigth;

  late TextEditingController widthContoller = TextEditingController(text: width.value.toString());
  late TextEditingController heigthContoller = TextEditingController(text: heigth.value.toString());

  @override
  Widget build(BuildContext context) {
    widthContoller.addListener(() => width.value = int.parse(widthContoller.text));
    heigthContoller.addListener(() => heigth.value = int.parse(heigthContoller.text));

    return AnimatedSize(
      duration: animationDurationFast,
      alignment: Alignment.topCenter,
      child: Observer(
        builder: (_) {
          return Column(
            children: [
              SwitchListTile(
                title: Text(t.setup.use_specific_size),
                subtitle: Text(t.setup.defult_size),
                value: useSpecificSize.value,
                onChanged: (newValue) => runInAction(() => useSpecificSize.value = newValue),
              ),
              if (useSpecificSize.value)
                SizeValuePicker(
                  widthContoller: widthContoller,
                  heigthContoller: heigthContoller,
                ),
            ],
          );
        },
      ),
    );
  }
}

class SizeValuePicker extends StatelessWidget {
  SizeValuePicker({super.key, required this.widthContoller, required this.heigthContoller});

  final TextEditingController widthContoller;
  final TextEditingController heigthContoller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Column(
        children: [
          TextField(
            controller: widthContoller,
            decoration: InputDecoration(hintText: t.setup.width),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
          ),
          TextField(
            controller: heigthContoller,
            decoration: InputDecoration(hintText: t.setup.height),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
          ),
        ],
      ),
    );
  }
}
