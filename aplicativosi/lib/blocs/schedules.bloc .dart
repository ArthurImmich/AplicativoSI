import 'package:aplicativosi/blocs/generic.bloc.dart';
import 'package:aplicativosi/models/shedule.model.dart';
import 'package:aplicativosi/resources/schedules.provider.dart';

class SchedulesBloc extends GenericBloc<SchedulesProvider, Schedule> {
  SchedulesBloc() : super(SchedulesProvider());
}
