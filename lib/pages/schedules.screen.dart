import 'package:flutter/material.dart';
import 'package:aplicativosi/models/shedule.model.dart';

class Schedules extends StatelessWidget {
  const Schedules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Schedule> schedule = [
      Schedule(
          title: "title",
          description: "description",
          timeStart: DateTime.now(),
          timeEnd: DateTime.now()),
      Schedule(
          title: "title 2",
          description: "description",
          timeStart: DateTime.now(),
          timeEnd: DateTime.now())
    ];

    schedule.add(new Schedule(
        title: "title",
        description: "description",
        timeStart: DateTime.now(),
        timeEnd: DateTime.now()));

    return Scaffold(
      appBar: AppBar(
        title: Text("Horários"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: Text(
              DateTime.now().day.toString() +
                  "/" +
                  DateTime.now().month.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: schedule.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(schedule[i].title),
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
    );
  }
}
