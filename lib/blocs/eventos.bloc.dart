import 'dart:async';
import 'package:aplicativosi/models/event.model.dart';
import 'package:aplicativosi/resources/events.provider.dart';

class EventsBloc {
  late List<Event> eventos;
  late final EventsProvider _eventsProvider;
  late final StreamController<Event> _stateStreamController;
  static late final EventsBloc? _eventsBloc;

  //??= creates a new object of EventsBloc only if _eventsBloc is null;
  //factory cosntructor ensures to return the same instace of _eventsBloc
  //everytime it is called;
  factory EventsBloc() => _eventsBloc ??= EventsBloc._internal();

  //internal constructor used to build the first and only instance of _eventsBloc
  EventsBloc._internal()
      : _eventsProvider = EventsProvider(),
        _stateStreamController = StreamController<Event>();

  StreamSink<Event> get _eventsBlocSink => _stateStreamController.sink;
  Stream<Event> get eventsBlocStream => _stateStreamController.stream;

  void fetchPlaces() {
    _eventsProvider.fetchPlaces(_eventsBlocSink);
  }

  void dispose() {
    _stateStreamController.close();
  }
}
