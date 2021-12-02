import 'dart:async';
import 'dart:convert';
import 'package:aplicativosi/models/event.model.dart';
import 'package:http/http.dart';

class EventsProvider {
  void fetchPlaces(StreamSink<Event> _eventsBlocSink) {
    final _serverUri = Uri(
        scheme: 'http', host: "10.0.2.2", port: 4056, path: '/events/fetch');
    //makes the request
    final request = Request('GET', _serverUri);
    //transforms the request body into a stream of Events and pipes it
    //to the events block sink
    request.send().then((StreamedResponse response) async {
      response.stream
          .transform(utf8.decoder)
          .map((e) => json.decode(e))
          .transform(Event.decoder)
          .pipe(_eventsBlocSink);
    });
  }
}
