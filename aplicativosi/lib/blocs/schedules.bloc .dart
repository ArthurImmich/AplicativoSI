import 'package:aplicativosi/blocs/generic.bloc.dart';
import 'package:aplicativosi/models/shedule.model.dart';
import 'package:aplicativosi/resources/schedules.repository.dart';

class SchedulesBloc extends GenericBloc<SchedulesRepository, Schedule> {
  SchedulesBloc() : super(SchedulesRepository());
}
