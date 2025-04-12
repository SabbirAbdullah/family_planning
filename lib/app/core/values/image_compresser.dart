import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<XFile?> compressImage(XFile image) async {
  final File imageFile = File(image.path);

  final compressedFile = await FlutterImageCompress.compressAndGetFile(
    imageFile.path,
    '${imageFile.path}.jpg',
    minWidth: 500,
    minHeight: 500,
    quality: 80,
    format: CompressFormat.jpeg,
  );

  if (compressedFile != null) {
    final compressedFileSize = await compressedFile.length();
    print('Compressed file size: $compressedFileSize bytes');

    if (compressedFileSize > 100 * 1024) {
      final furtherCompressedFile = await FlutterImageCompress.compressAndGetFile(
        compressedFile.path,
        '${compressedFile.path}.jpg',
        minWidth: 500,
        minHeight: 500,
        quality: 60,
        format: CompressFormat.jpeg,
      );

      if (furtherCompressedFile != null) {
        final furtherCompressedFileSize = await furtherCompressedFile.length();
        print('Further compressed file size: $furtherCompressedFileSize bytes');
        return XFile(furtherCompressedFile.path);
      } else {
        return XFile(compressedFile.path);
      }
    } else {
      return XFile(compressedFile.path);
    }
  } else {
    return image;
  }
}


