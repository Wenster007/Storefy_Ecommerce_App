import 'package:flutter/material.dart';
import 'package:ecommerce/model/notification.dart' as my_notification;

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, required this.notification, required this.onClickClose})
      : super(key: key);

  final my_notification.Notification notification;
  final void Function(my_notification.Notification notification) onClickClose;

  @override
  Widget build(BuildContext context) {
    final notificationTimeInMinutes =
        DateTime.now().difference(notification.time).inMinutes.remainder(60);
    final notificationTimeInDays =
        DateTime.now().difference(notification.time).inDays.remainder(60);

    return Card(
      margin: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            // height: 100,
            padding: const EdgeInsets.only(left: 8, top: 16, bottom: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      notification.type.name == "cart"
                          ? const Icon(
                              Icons.shopping_cart,
                              color: Colors.lightBlueAccent,
                              size: 45,
                            )
                          : (notification.type.name == "delivery"
                              ? const Icon(
                                  Icons.delivery_dining,
                                  color: Colors.orange,
                                  size: 45,
                                )
                              : const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 45,
                                )),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        notification.message,
                        style: const TextStyle(fontSize: 15),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        notificationTimeInMinutes >= 1440
                            ? "$notificationTimeInDays days ago"
                            : "$notificationTimeInMinutes mins ago",
                        style: const TextStyle(
                            color: Color.fromARGB(186, 91, 91, 91)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -9,
            right: -15,
            child: IconButton(
              icon: const Icon(
                Icons.close,
                size: 15,
                color: Colors.grey,
              ),
              onPressed: () {
                onClickClose(notification);
              },
            ),
          )
        ],
      ),
    );
  }
}
