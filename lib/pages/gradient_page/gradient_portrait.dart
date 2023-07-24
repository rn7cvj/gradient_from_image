import 'package:flutter/material.dart';
import 'package:gradient_from_image/pages/gradient_page/widgets/settings_bottom_sheet.dart';

class GradientPortrait extends StatelessWidget {
  const GradientPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheet(
          context: context,
          builder: (context) => SettingsBottomSheet(),
        ),
        child: const Icon(Icons.settings),
      ),
    );
  }
}
