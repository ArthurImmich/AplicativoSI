import 'dart:async';
import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';

typedef Json = Map<String, dynamic>;

class File {
  String name;
  String description;
  static String path = "/storage/emulated/0/Download/";
  late bool downloaded;

  File({
    required this.name,
    required this.description,
    this.downloaded = false,
  });

  File.fromJson(Json json)
      : name = json['name'],
        description = json['description'];

  Json get json => {
        'name': name,
        'description': description,
      };

  void checkFile() {
    downloaded = File(path + name).existsSync();
  }

  void openFile() {
    OpenFile.open(path + name);
  }

  Future<bool> downloadFile() async {
    HttpClient httpClient = new HttpClient();
    File file;
    bool downloaded = false;
    try {
      var request = await httpClient.getUrl(Uri.parse(link));
      var response = await request.close();
      if (response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);
        file = File(path + name);
        await file.writeAsBytes(bytes);
        downloaded = true;
      } else
        downloaded = false;
    } catch (ex) {
      downloaded = false;
    }

    return downloaded;
  }
}
