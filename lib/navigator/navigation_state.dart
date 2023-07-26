import 'package:gradient_from_image/modal/image_gradinet.dart';

class NavigationState {
  final bool? _setup;
  final bool? _gradient;

  final ImageGradient? imageGradient;

  bool get isSetup => _setup == true;

  bool get isGradient => _gradient == true;

  NavigationState.setup()
      : _setup = true,
        _gradient = false,
        imageGradient = null;

  NavigationState.imageGradient(this.imageGradient)
      : _setup = false,
        _gradient = true;
}
