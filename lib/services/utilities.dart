import 'dart:io';
import 'dart:typed_data';

import 'package:chronos/services/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

Future<Uint8List> getNetworkImageUint8List(String url) async {
  Uint8List bytes =
      (await NetworkAssetBundle(Uri.parse(url)).load(url)).buffer.asUint8List();
  return bytes;
}

Future<Uint8List> getImage() async {
  final ImagePicker _picker = ImagePicker();
  // Pick an image
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  Uint8List bytes = await image!.readAsBytes();

  return bytes;
}

Future<MultipartFile> getMultipartFile(Uint8List image, String name) async {
  String fileName = await getFilePath("$name.png");
  File file = File(fileName);
  await file.writeAsBytes(image);
  return await MultipartFile.fromFile(file.path, filename: fileName);
}

Future<String> getFilePath(String fileName) async {
  print(fileName);
  Directory appDocumentsDirectory =
      await getApplicationDocumentsDirectory(); // 1
  String appDocumentsPath = appDocumentsDirectory.path; // 2
  String filePath = '$appDocumentsPath/$fileName'; // 3

  return filePath;
}
