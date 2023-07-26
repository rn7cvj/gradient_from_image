import 'package:flutter/material.dart';
import 'package:gradient_from_image/modal/image_gradinet.dart';
import 'package:gradient_from_image/pages/gradient_page/widgets/settings_bottom_sheet.dart';

class GradientPortrait extends StatelessWidget {
  GradientPortrait({super.key, required this.gradient});

  final ImageGradient gradient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.memory(gradient.resultData)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) => SettingsBottomSheet(),
        ),
        child: const Icon(Icons.settings),
      ),
    );
  }
}
