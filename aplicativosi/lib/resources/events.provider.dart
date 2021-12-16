import 'dart:async';
import 'dart:convert';
import 'package:aplicativosi/models/event.model.dart';
import 'package:aplicativosi/resources/generic.provider.dart';
import 'package:http/http.dart';
import 'package:aplicativosi/server.config.dart';

class EventsProvider implements GenericProvider<Event> {
  @override
  void fetchPlaces(StreamSink<Event> _blocSink) {
    final _serverUri =
        Uri(scheme: 'http', host: HOST, port: PORT, path: '/events/fetch');
    //makes the request
    final request = Request('GET', _serverUri);
    //transforms the request body into a stream of Events and pipes it
    //to the events block sink
    request.send().then((StreamedResponse response) async {
      response.stream
          .transform(utf8.decoder)
          .map((e) => json.decode(e))
          .transform(Event.decoder)
          .pipe(_blocSink);
    });
  }
}
