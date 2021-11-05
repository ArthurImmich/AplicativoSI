import 'dart:async';
import 'dart:convert';
import 'package:aplicativosi/models/event.model.dart';
import 'package:http/http.dart';

class EventsProvider {
  void fetchPlaces(StreamSink<Event>? _eventosBlocSink) {
    //makes the request
    final _serverUri =
        Uri(scheme: 'http', host: 'localhost', port: 8097, path: '/fetch');
    final request = Request('GET', _serverUri);
    request.send().asStream().listen((StreamedResponse response) {
      // if (_eventosBlocSink != null) {
      //   response.stream
      //       .transform(
      //           utf8.decoder) //converts the stream of bytes to stream of string
      //       .transform(
      //           json.decoder) //converts the stream of string to stream of json
      //       .map((json) => Event.fromJson(
      //           json)) //converts the stream of json to a stream of events
      //       .pipe(_eventosBlocSink);
      // }
    });
  }
}
