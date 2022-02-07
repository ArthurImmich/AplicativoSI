import 'package:aplicativosi/blocs/generic.bloc.dart';
import 'package:aplicativosi/models/event.model.dart';
import 'package:aplicativosi/resources/events.repository.dart';

class EventsBloc extends GenericBloc<EventsRepository, Event> {
  EventsBloc() : super(EventsRepository());
}
