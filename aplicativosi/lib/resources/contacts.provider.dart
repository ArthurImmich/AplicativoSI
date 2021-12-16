import 'dart:async';
import 'dart:convert';
import 'package:aplicativosi/models/contact.model.dart';
import 'package:aplicativosi/resources/generic.provider.dart';
import 'package:aplicativosi/server.config.dart';
import 'package:http/http.dart';

class ContactsProvider implements GenericProvider<Contact> {
  @override
  void fetchPlaces(StreamSink<Contact> _blocSink) {
    final _serverUri =
        Uri(scheme: 'http', host: HOST, port: PORT, path: '/contacts/fetch');
    //makes the request
    final request = Request('GET', _serverUri);
    //transforms the request body into a stream of Events and pipes it
    //to the events block sink
    request.send().then((StreamedResponse response) async {
      response.stream
          .transform(utf8.decoder)
          .map((e) => json.decode(e))
          .transform(Contact.decoder)
          .pipe(_blocSink);
    });
  }
}
