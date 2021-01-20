import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

/// Retorna a cor predominante de uma imagem
Future<Color> getDominantColorFromImage(ImageProvider imageProvider) async {
  final paletteGenerator =
      await PaletteGenerator.fromImageProvider(imageProvider);

  return paletteGenerator.dominantColor.color;
}
