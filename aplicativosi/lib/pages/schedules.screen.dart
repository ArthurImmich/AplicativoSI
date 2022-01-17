import 'package:aplicativosi/blocs/schedules.bloc%20.dart';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:aplicativosi/models/shedule.model.dart';
import 'package:intl/intl.dart';

class Schedules extends StatefulWidget {
  Schedules({Key? key}) : super(key: key);

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  late final SchedulesBloc _schedulesBloc;
  late DateFormat _dateFormat;

  @override
  void initState() {
    super.initState();
    _schedulesBloc = SchedulesBloc();
    _schedulesBloc.fetch();
    _dateFormat = DateFormat("HH:mm");
  }

  @override
  void dispose() {
    _schedulesBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CalendarAgenda(
          fullCalendar: true,
          locale: 'pt_BR',
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 140)),
          lastDate: DateTime.now().add(const Duration(days: 30)),
          onDateSelected: (DateTime date) {},
        ),
        body: FutureBuilder(
          future: _schedulesBloc.data,
          builder: (context, AsyncSnapshot<List<Schedule>> snapshot) {
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
                        snapshot.data![index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        snapshot.data![index].description,
                      ),
                      trailing: Text(_dateFormat
                              .format(snapshot.data![index].timeStart) +
                          " - " +
                          _dateFormat.format(snapshot.data![index].timeEnd)),
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
        // ),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: schedule.length,
        //     itemBuilder: (context, i) {
        //       return ListTile(
        //         title: Text(schedule[i].title,
        //             style: TextStyle(fontWeight: FontWeight.bold)),
        //         subtitle: Text(schedule[i].description),
        //         trailing: Text(
        //             schedule[i].timeStart.hour.toString() +
        //                 ":" +
        //                 schedule[i].timeStart.minute.toString() +
        //                 "-" +
        //                 schedule[i].timeEnd.hour.toString() +
        //                 ":" +
        //                 schedule[i].timeEnd.minute.toString(),
        //             style: TextStyle(fontWeight: FontWeight.bold)),
        //       );
        //     },
        //   ),
      ),
    );
  }
}
