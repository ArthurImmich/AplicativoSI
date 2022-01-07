import 'package:aplicativosi/blocs/generic.bloc.dart';
import 'package:aplicativosi/models/notification.model.dart';
import 'package:aplicativosi/resources/notifications.provider.dart';

class NotificationsBloc
    extends GenericBloc<NotificationsProvider, Notification> {
  NotificationsBloc() : super(NotificationsProvider());
}
