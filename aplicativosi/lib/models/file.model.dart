import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';

typedef Json = Map<String, dynamic>;

class SIFile {
  String name;
  String description;
  String link;
  String path = "/storage/emulated/0/Download/";
  bool downloaded = false;
  SIFile({
    required this.name,
    required this.description,
    required this.link,
    this.downloaded = false,
  });

  SIFile.fromJson(Json json)
      : name = json['name'],
        description = json['description'],
        link = json['link'],
        downloaded = false;

  static StreamTransformer<dynamic, SIFile> get decoder =>
      StreamTransformer.fromHandlers(
          handleData: (json, EventSink sink) =>
              sink.add(SIFile.fromJson(json)));

  Json get json => {
        'name': name,
        'description': description,
        'link': link,
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
