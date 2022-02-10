import 'dart:async';
import 'dart:convert';
import 'package:aplicativosi/models/event.model.dart';
import 'package:aplicativosi/resources/generic.repository.dart';
import 'package:http/http.dart';
import 'package:aplicativosi/server.config.dart';

class EventsRepository implements GenericRepository<Event> {
  @override
  void fetch(StreamSink<Event> _blocSink) {
    final _serverUri =
        Uri(scheme: 'http', host: HOST, port: PORT, path: '/events/fetch');
    //makes the request
    Request request = Request('GET', _serverUri);
    //transforms the request body into a stream of Events and pipes it
    //to the events block sink
    request.persistentConnection = true;
    request.send().then((StreamedResponse response) {
      response.stream
          .transform(utf8.decoder)
          .map((e) => json.decode(e))
          .transform(Event.decoder)
          .pipe(_blocSink);
    });
  }
}
