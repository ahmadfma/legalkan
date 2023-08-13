import 'package:injectable/injectable.dart';
import 'package:legalkan/utils/my_exception.dart';

import '../api/notification_api.dart';
import '../models/my_notification.dart';

abstract class INotificationRepository {
  Future<List<MyNotification>> getNotifications();
  Future<void> updateNotificationReadStatus();
}

@LazySingleton(as: INotificationRepository)
class NotificationRepository implements INotificationRepository {

  final INotificationApi _notificationApi;

  NotificationRepository(this._notificationApi);

  @override
  Future<List<MyNotification>> getNotifications() {
    try {
      return _notificationApi.getNotifications();
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

  @override
  Future<void> updateNotificationReadStatus() {
    try {
      return _notificationApi.updateNotificationReadStatus();
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

}