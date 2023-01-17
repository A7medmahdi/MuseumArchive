import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as p;
import '../services/Snackbars.dart';

class ImagesOperation  extends GetxController{
  var imagePathController = TextEditingController();
  File? image;
  String? path;
  int? itemId;
  Directory data = Directory("/storage/emulated/0/Al-Kafeel Museum/");
  RxList<File> imageFiles = <File>[].obs;
  int itemCount = 0;

  Future<void> getImages(int itemId) async {

    debugPrint(itemId.toString());
    try {
      imageFiles.removeRange(0, imageFiles.length-1 < 0 ? 0 : imageFiles.length);
      final path = Directory('/storage/emulated/0/Al-Kafeel Museum/$itemId/');
      if (await path.exists()) {

        List<FileSystemEntity> filesEntity = path.listSync();
        for (FileSystemEntity fileEntity in filesEntity) {
          imageFiles.add(File(fileEntity.path));
          itemCount++;
        }
        // debugPrint(itemCount.toString());
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      // TODO
    }

  }

  Future<String?> externalFolder() async {
    itemId = int.parse(Get.arguments['itemId'].toString());
    var status = await Permission.manageExternalStorage.status;
    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
    }
    if (await Permission.manageExternalStorage.isGranted) {
      final path = Directory('/storage/emulated/0/Al-Kafeel Museum/$itemId/');
      if (await path.exists()) {
        return path.path;
      } else {
        final Directory appDocDirNewFolder = await path.create(recursive: true);
        return appDocDirNewFolder.path;
      }
    } else {
      SnackBars().snackBarFail(
          "رجاء اعطاء صلاحية الوصول الى ذاكرة النظام", 'No image selected.');
      return null;
    }
  }

  Future pickImage(String path, ImageSource source, String fileName) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) return;
    final extension = p.basename(pickedFile.path);
    var pickedFile2 = File(pickedFile.path);
    final newPath = p.join(path, extension);
    File newImage = await pickedFile2.copy(newPath);
    newImage = await changeFileNameOnly(newImage, '$fileName.png');
  }

  Future<File> changeFileNameOnly(File file, String newFileName) {
    var path = file.path;
    var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    var newPath = path.substring(0, lastSeparator + 1) + newFileName;
    return file.rename(newPath);
  }

  String getFileImage(int id )  {
  Directory data;
      data = Directory("/storage/emulated/0/Al-Kafeel Museum/$id/");
        return data.path;
  }
}
