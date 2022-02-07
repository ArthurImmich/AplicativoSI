import 'package:aplicativosi/blocs/generic.bloc.dart';
import 'package:aplicativosi/models/file.model.dart';
import 'package:aplicativosi/resources/files.repository.dart';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';

class SIFilesBloc extends GenericBloc<SIFilesRepository, SIFile> {
  SIFilesBloc() : super(SIFilesRepository());

  static Future<bool> checkFile(SIFile file) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    file.path = appDocDir.path;
    file.downloaded = File(file.path + file.name).existsSync();
    return file.downloaded;
  }

  static void openFile(SIFile file) {
    OpenFile.open(file.path + file.name);
  }

  static Future<bool> downloadFile(SIFile data) async {
    HttpClient httpClient = new HttpClient();
    File file;
    bool downloaded = await File(data.path + data.name).exists();
    if (downloaded) {
      return downloaded;
    }
    try {
      var request = await httpClient.getUrl(Uri.parse(data.link));
      var response = await request.close();
      if (response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);
        file = File(data.path + data.name);
        await file.writeAsBytes(bytes);
        downloaded = true;
      } else
        downloaded = false;
    } catch (ex) {
      print("download error:" + ex.toString());
      downloaded = false;
    }

    return downloaded;
  }
}
