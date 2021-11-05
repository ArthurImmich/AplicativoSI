typedef Json = Map<String, dynamic>;

class Event {
  String? title;
  String? description;
  DateTime? timeStart;
  DateTime? timeEnd;

  Event({
    this.title,
    this.description,
    this.timeStart,
    this.timeEnd,
  });

  Event.fromJson(Json json)
      : title = json['title'],
        description = json['description'],
        timeStart = json['timeStart'],
        timeEnd = json['timeEnd'];

  Json get json => {
        'title': title,
        'description': description,
        'timeStart': timeStart,
        'timeEnd': timeEnd,
      };
}
