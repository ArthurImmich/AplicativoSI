typedef Json = Map<String, dynamic>;

class File {
  String name;
  String description;
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
}
