import 'package:flutter/material.dart';
import 'package:ecommerce/model/notification.dart' as my_notification;

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, required this.notification})
      : super(key: key);

  final my_notification.Notification notification;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        notification.message,
                        style: const TextStyle(fontSize: 15),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(top: -4, right: -9,child: IconButton(icon: const Icon(Icons.close, size: 15, color: Colors.grey,) , onPressed:  () {}, ),)
        ],
      ),
    );
  }
}
