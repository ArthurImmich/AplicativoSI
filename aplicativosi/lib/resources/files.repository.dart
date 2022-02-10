import 'dart:async';
import 'dart:convert';
import 'package:aplicativosi/models/file.model.dart';
import 'package:aplicativosi/resources/generic.repository.dart';
import 'package:http/http.dart';
import 'package:aplicativosi/server.config.dart';

class SIFilesRepository implements GenericRepository<SIFile> {
  @override
  void fetch(StreamSink<SIFile> _blocSink) {
    final _serverUri =
        Uri(scheme: 'http', host: HOST, port: PORT, path: '/files/fetch');
    //makes the request
    final request = Request('GET', _serverUri);
    //transforms the request body into a stream of Events and pipes it
    //to the events block sink
    request.send().then((StreamedResponse response) async {
      response.stream
          .transform(utf8.decoder)
          .map((e) => json.decode(e))
          .transform(SIFile.decoder)
          .pipe(_blocSink);
    });
  }
}
