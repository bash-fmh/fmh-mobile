import 'dart:io';
import 'package:dio/dio.dart';

class UploadFormData {
  List<File>? photos;
  String? type;

  UploadFormData({this.photos, this.type});

  Future<FormData> getApiParam() async => FormData.fromMap({
        'type': 'img',
        'image_files':
            await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),
      });
}
