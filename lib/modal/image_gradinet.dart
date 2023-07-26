import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

class ImageGradient {
  ImageGradient(this._sourceData, this._height, this._width);

  final Uint8List _sourceData;

  final int _height;
  final int _width;

  late Uint8List _relustData;

  Uint8List get resultData => _relustData;

  int tileScale = 4;
  late List<List<Tile>> tiles;

  void _generateTiles() {
    img.Image sourceImage = img.decodePng(_sourceData)!;

    int tileWidth = sourceImage.width ~/ tileScale;
    int tileHeight = sourceImage.height ~/ tileScale;

    tiles = List.generate(
      tileScale,
      (xPos) => List.generate(
        tileScale,
        (yPos) => Tile(img.ColorRgb8(0, 0, 0), xPos * tileWidth, yPos * tileHeight),
      ),
    );

    for (int x = 0; x < tileScale; x++) {
      for (int y = 0; y < tileScale; y++) {
        var it = sourceImage.getRange(x * tileWidth, y * tileHeight, tileWidth, tileHeight);
        double red = 0;
        double green = 0;
        double blue = 0;

        while (it.moveNext()) {
          red += it.current.r.toDouble() / tileWidth * tileHeight;
          green += it.current.g.toDouble() / tileWidth * tileHeight;
          blue += it.current.b.toDouble() / tileWidth * tileHeight;
        }

        tiles[x][y].color = img.ColorRgb8(min(red.toInt(), 255), min(green.toInt(), 255), min(blue.toInt(), 255));
      }
    }
  }

  Future<void> gradientImage() async {
    _generateTiles();

    img.Image resultImage = img.Image(height: _height, width: _width);

    for (int x = 0; x < _width; x++) {
      for (int y = 0; y < _height; y++) {
        resultImage.setPixel(x, y, img.ColorRgb8(255, 160, 122));
      }
    }

    _relustData = img.encodePng(resultImage);
  }
}

class Tile {
  img.Color color;

  final int xPos; // width
  final int yPos; // height

  Tile(this.color, this.xPos, this.yPos);
}
