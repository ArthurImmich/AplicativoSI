import 'package:aplicativosi/blocs/generic.bloc.dart';
import 'package:aplicativosi/models/event.model.dart';
import 'package:aplicativosi/resources/events.provider.dart';

class EventsBloc extends GenericBloc<EventsProvider, Event> {
  EventsBloc() : super(EventsProvider());
}
