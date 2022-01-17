import 'dart:async';
import 'package:aplicativosi/resources/generic.provider.dart';

abstract class GenericBloc<P extends GenericProvider<S>, S> {
  late final P provider;
  late final StreamController<S> _stateStreamController;
  late Future<List<S>> data;

  StreamSink<S> get _blocSink => _stateStreamController.sink;
  Stream<S> get blocStream => _stateStreamController.stream;

  GenericBloc(P provider)
      : this.provider = provider,
        _stateStreamController = StreamController<S>();

  void fetch() async {
    provider.fetch(_blocSink);
    data = blocStream.toList();
  }

  void dispose() {
    _stateStreamController.close();
  }
}
