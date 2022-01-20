import 'dart:async';

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
}
