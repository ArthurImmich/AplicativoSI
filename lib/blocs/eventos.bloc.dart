import 'dart:async';
import 'package:aplicativosi/models/event.model.dart';
import 'package:aplicativosi/resources/events.provider.dart';

class EventsBloc {
  late List<Event> eventos;
  late final EventsProvider _eventsProvider;
  late final StreamController<Event> _stateStreamController;
  static final EventsBloc _eventosBloc = EventsBloc._internal();

  factory EventsBloc() {
    return _eventosBloc;
  }

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
