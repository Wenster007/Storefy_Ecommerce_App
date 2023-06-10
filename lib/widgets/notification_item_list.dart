import 'package:ecommerce/data/notification_data.dart';
import 'package:ecommerce/widgets/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationItemList extends StatelessWidget {
  const NotificationItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dummyNotificationData.length,
        itemBuilder: (ctx, index) =>
            NotificationItem(notification: dummyNotificationData[index]));
  }
}
