import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gradient_from_image/constants.dart';
import 'package:mobx/mobx.dart';

import '../../i18n/strings.g.dart';

class SizePicker extends StatelessWidget {
  SizePicker({super.key});

  Observable<bool> useSpecificSize = Observable<bool>(false);

  @override
  Widget build(BuildContext context) {
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
              if (useSpecificSize.value) SizeValuePicker(),
            ],
          );
        },
      ),
    );
  }
}

class SizeValuePicker extends StatelessWidget {
  const SizeValuePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: t.setup.width),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
          ),
          TextField(
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
