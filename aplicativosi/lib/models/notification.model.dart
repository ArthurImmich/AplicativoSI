import 'dart:async';

typedef Json = Map<String, dynamic>;

class Notification {
  String title;
  String body;
  DateTime? time;

  Notification({
    required this.title,
    required this.body,
    required this.time,
  });

  Notification.fromJson(Json json)
      : title = json['title'],
        body = json['body'],
        time = DateTime.parse(json['time']);

  static StreamTransformer<dynamic, Notification> get decoder =>
      StreamTransformer.fromHandlers(
          handleData: (json, EventSink sink) =>
              sink.add(Notification.fromJson(json)));

  Json get json => {
        'name': title,
        'email': body,
        'time': time,
      };
}
