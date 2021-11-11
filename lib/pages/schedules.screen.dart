import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';

class Schedules extends StatelessWidget {
  const Schedules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CalendarAgenda(
          fullCalendar: true,
          locale: 'pt_BR',
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 140)),
          lastDate: DateTime.now().add(const Duration(days: 30)),
          onDateSelected: (date) {
            print(date.toString());
          },
        ),
      ),
    );
  }
}
