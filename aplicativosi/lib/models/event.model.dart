import 'dart:async';

typedef Json = Map<String, dynamic>;

class Event {
  String? title;
  String? description;
  DateTime? timeStart;
  DateTime? timeEnd;

  @override
  Event({
    this.title,
    this.description,
    this.timeStart,
    this.timeEnd,
  });

  Event.fromJson(Json json)
      : title = json['title'],
        description = json['description'],
        timeStart = DateTime.parse(json['timeStart']),
        timeEnd = DateTime.parse(json['timeEnd']);

  // Transform a stream of json to a stream of Events
  static StreamTransformer<dynamic, Event> get decoder =>
      StreamTransformer.fromHandlers(
          handleData: (json, EventSink sink) => sink.add(Event.fromJson(json)));
  // static StreamTransformer<List<dynamic>, List<Event>> get decoder =>
  //     StreamTransformer.fromHandlers(
  //         handleData: (json, EventSink sink) =>
  //             json.map((e) => Event.fromJson(e)));

  Json get json => {
        'title': title,
        'description': description,
        'timeStart': timeStart,
        'timeEnd': timeEnd,
      };
}
