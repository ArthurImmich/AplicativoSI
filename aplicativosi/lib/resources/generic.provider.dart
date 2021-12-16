import 'dart:async';

abstract class GenericProvider<S> {
  void fetchPlaces(StreamSink<S> _eventsBlocSink);
}
