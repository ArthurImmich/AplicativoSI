import 'dart:async';

typedef Json = Map<String, dynamic>;

class Contact {
  String name;
  String email;
  String? image;

  Contact({
    required this.name,
    required this.email,
    this.image = "",
  });

  Contact.fromJson(Json json)
      : name = json['name'],
        email = json['email'],
        image = json['image'];

  static StreamTransformer<dynamic, Contact> get decoder =>
      StreamTransformer.fromHandlers(
          handleData: (json, EventSink sink) =>
              sink.add(Contact.fromJson(json)));

  Json get json => {
        'name': name,
        'email': email,
        'image': image,
      };
}
