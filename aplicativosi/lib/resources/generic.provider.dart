import 'dart:async';

abstract class GenericProvider<S> {
  void fetch(StreamSink<S> _eventsBlocSink);
}
