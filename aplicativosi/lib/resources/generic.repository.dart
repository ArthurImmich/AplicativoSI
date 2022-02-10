import 'dart:async';

abstract class GenericRepository<S> {
  void fetch(StreamSink<S> _eventsBlocSink);
}
