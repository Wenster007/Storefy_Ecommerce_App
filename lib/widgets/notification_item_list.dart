import 'package:ecommerce/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/model/notification.dart' as myNotification;

class NotificationItemList extends StatelessWidget {
  const NotificationItemList(
      {Key? key,
      required this.currentDummyNotificationData,
      required this.onClickClose})
      : super(key: key);

  final List<myNotification.Notification> currentDummyNotificationData;
  final void Function(myNotification.Notification notification) onClickClose;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: currentDummyNotificationData.length,
        itemBuilder: (ctx, index) => NotificationItem(
              notification: currentDummyNotificationData[index],
              onClickClose: onClickClose,
            ));
  }
}
