import 'package:aplicativosi/blocs/generic.bloc.dart';
import 'package:aplicativosi/models/notification.model.dart';
import 'package:aplicativosi/resources/notifications.repository.dart';

class NotificationsBloc
    extends GenericBloc<NotificationsRepository, Notification> {
  NotificationsBloc() : super(NotificationsRepository());
}
