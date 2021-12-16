import 'package:aplicativosi/blocs/events.bloc.dart';
import 'package:aplicativosi/models/event.model.dart';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  late Future<List<Event>> _events;
  late final EventsBloc _eventsBloc;

  @override
  void initState() {
    super.initState();
    _eventsBloc = EventsBloc();
    _eventsBloc.fetchPlaces();
    _events = _eventsBloc.blocStream.toList();
  }

  @override
  void dispose() {
    _eventsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CalendarAgenda(
          locale: 'pt_BR',
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 140)),
          lastDate: DateTime.now().add(const Duration(days: 30)),
          onDateSelected: (date) {
            print(date.toString());
          },
        ),
        body: FutureBuilder(
          future: _events,
          builder: (context, AsyncSnapshot<List<Event>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                        snapshot.data![index].title!,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        snapshot.data![index].description!,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: const Color(0xFFF5F5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
