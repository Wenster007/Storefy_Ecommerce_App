import 'package:ecommerce/widgets/notification_item_list.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/data/notification_data.dart';
import 'package:ecommerce/model/notification.dart' as notification;


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();


}


class _NotificationScreenState extends State<NotificationScreen> {

  late Widget notificationBody;

  @override
  void initState() {
    super.initState();

    if (dummyNotificationData.isNotEmpty){
      notificationBody = NotificationItemList(
        currentDummyNotificationData: dummyNotificationData,
        onClickClose: onClickClose,
      );
    } else {
      notificationBody = const Center(child: Text("No New Notification"),);
    }

  }

  void onClickClose(notification.Notification notification) {
    dummyNotificationData.remove(notification);

    if (dummyNotificationData.isEmpty){
      setState(() {
        notificationBody = const Center(child: Text("No New Notification"),);
      });
      return;
    }
    setState(() {
      notificationBody = NotificationItemList(currentDummyNotificationData: dummyNotificationData, onClickClose: onClickClose,);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.green, fontSize: 25),
        ),
      ),
      body: notificationBody,
    );
  }
}
