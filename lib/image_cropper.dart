import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

class ImageCropperWidget extends StatelessWidget {
  final Uint8List orginalImageData;
  final Rect rect;
  const ImageCropperWidget({
    super.key,
    required this.orginalImageData,
    required this.rect,
  });

  @override
  Widget build(BuildContext context) {
    final croppedImage = img.copyCrop(
      img.decodeImage(orginalImageData)!,
      x: rect.left.toInt(),
      y: rect.top.toInt(),
      width: rect.width.toInt(),
      height: rect.height.toInt(),
    );
    return Image.memory(img.encodePng(croppedImage));
  }
}
