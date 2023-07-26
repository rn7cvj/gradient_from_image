import 'package:flutter/material.dart';
import 'package:gradient_from_image/modal/image_gradinet.dart';
import 'package:gradient_from_image/pages/gradient_page/gradient_portrait.dart';

class GradientPage extends StatelessWidget {
  GradientPage({super.key, required this.gradient});

  final ImageGradient gradient;

  @override
  Widget build(BuildContext context) {
    return GradientPortrait(
      gradient: gradient,
    );
  }
}
