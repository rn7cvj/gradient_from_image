import 'dart:typed_data';

class ImageGradient {
  ImageGradient(this._sourceData, this._height, this._width);

  final Uint8List _sourceData;

  final int _height;
  final int _width;

  late Uint8List _relustData;

  Uint8List get resultData => _relustData;

  void gradientImage() {
    _relustData = Uint8List.fromList(_sourceData);
  }
}
