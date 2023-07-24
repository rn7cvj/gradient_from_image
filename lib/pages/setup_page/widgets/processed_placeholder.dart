import 'package:flutter/material.dart';
import 'package:gradient_from_image/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../i18n/strings.g.dart';

class ProcessedPlaceholder extends StatelessWidget {
  const ProcessedPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingAnimationWidget.discreteCircle(
                color: Theme.of(context).colorScheme.secondary,
                size: constraints.maxWidth / 3,
              ),
              Padding(
                padding: const EdgeInsets.all(appPaddingSmall),
                child: Text(t.setup.generating),
              ),
            ],
          ),
        );
      },
    );
  }
}
