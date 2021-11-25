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

  Json get json => {
        'name': name,
        'email': email,
        'image': image,
      };
}
