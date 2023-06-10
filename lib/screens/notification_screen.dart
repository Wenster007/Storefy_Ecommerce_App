import 'package:ecommerce/widgets/notification_item_list.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

Widget notificationBody = const NotificationItemList();

class _NotificationScreenState extends State<NotificationScreen> {



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
