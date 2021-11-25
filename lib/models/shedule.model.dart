typedef Json = Map<String, dynamic>;

class Schedule {
  String title;
  String description;
  DateTime timeStart;
  DateTime timeEnd;

  Schedule({
    required this.title,
    required this.description,
    required this.timeStart,
    required this.timeEnd,
  });

  Schedule.fromJson(Json json)
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
