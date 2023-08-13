import 'dart:io';
import 'package:path_provider/path_provider.dart';

const MAX_FILE_SIZE = 10000000; //10 mb

Future<String> findLocalDirectoryPath() async {
  final directory = await getApplicationDocumentsDirectory();
  final downloadDir = Platform.isAndroid
      ? "/storage/emulated/0/Download"
      : '${directory.path}${Platform.pathSeparator}Download';
  final savedDir = Directory(downloadDir);
  bool isExist = await savedDir.exists();
  if(!isExist) savedDir.create();
  return savedDir.path;
}