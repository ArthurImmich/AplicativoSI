import 'dart:async';
import 'package:aplicativosi/resources/generic.provider.dart';

abstract class GenericBloc<P extends GenericProvider<S>, S> {
  late final P provider;
  late final StreamController<S> _stateStreamController;

  StreamSink<S> get _blocSink => _stateStreamController.sink;
  Stream<S> get blocStream => _stateStreamController.stream;

  GenericBloc(P provider)
      : this.provider = provider,
        _stateStreamController = StreamController<S>();

  void fetch() {
    provider.fetchPlaces(_blocSink);
  }

  void dispose() {
    _stateStreamController.close();
  }
}
