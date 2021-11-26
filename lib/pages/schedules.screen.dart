import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:aplicativosi/models/shedule.model.dart';

class Schedules extends StatefulWidget {
  Schedules({Key? key}) : super(key: key);

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  List<Schedule> schedule = [
    Schedule(
        title: "Materia 1 do dia " + DateTime.now().day.toString(),
        description: "Ocorre na sala X com profesorr x...",
        timeStart: DateTime.now(),
        timeEnd: DateTime.now()),
    Schedule(
        title: "Materia 2 do dia " + DateTime.now().day.toString(),
        description: "Ocorre na sala X com profesorr x...",
        timeStart: DateTime.now(),
        timeEnd: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CalendarAgenda(
              fullCalendar: true,
              locale: 'pt_BR',
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(const Duration(days: 140)),
              lastDate: DateTime.now().add(const Duration(days: 30)),
              onDateSelected: (date) {
                getDayShedule(date);
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: schedule.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(schedule[i].title,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(schedule[i].description),
                    trailing: Text(
                        schedule[i].timeStart.hour.toString() +
                            ":" +
                            schedule[i].timeStart.minute.toString() +
                            "-" +
                            schedule[i].timeEnd.hour.toString() +
                            ":" +
                            schedule[i].timeEnd.minute.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  getDayShedule(DateTime date) {
    schedule.clear();
    setState(() {
      schedule.add(Schedule(
          title: "Materia 1 do dia " + date.day.toString(),
          description: "Ocorre na sala X com profesorr x...",
          timeStart: DateTime.now(),
          timeEnd: DateTime.now()));
      schedule.add(Schedule(
          title: "Materia 2 do dia " + date.day.toString(),
          description: "Ocorre na sala X com profesorr x...",
          timeStart: DateTime.now(),
          timeEnd: DateTime.now()));
    });
  }
}
