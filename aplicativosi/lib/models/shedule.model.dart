import 'dart:async';

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
        timeStart = DateTime.parse(json['timeStart']),
        timeEnd = DateTime.parse(json['timeEnd']);

  static StreamTransformer<dynamic, Schedule> get decoder =>
      StreamTransformer.fromHandlers(
          handleData: (json, EventSink sink) =>
              sink.add(Schedule.fromJson(json)));

  Json get json => {
        'title': title,
        'description': description,
        'timeStart': timeStart,
        'timeEnd': timeEnd,
      };
}
