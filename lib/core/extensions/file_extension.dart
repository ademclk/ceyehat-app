import 'dart:convert';
import 'dart:io';

extension FileExtension on File {
  String get base64String {
    List<int> imageBytes = readAsBytesSync();
    return base64Encode(imageBytes);
  }
}
