import 'package:ecommerce/model/notification.dart';

List<Notification> dummyNotificationData = [
  Notification("Product Added To Cart. You can go to Favorites for more details.", DateTime(2023, 6, 10, 9, 0), typeOfNotification.cart),
  Notification("Product Removed from Cart. You can go to Favorites for more details.", DateTime(2023, 6, 10, 10, 30), typeOfNotification.cart),
  Notification("Your product is out for delivery. Please Keep Cash ready with you.", DateTime(2023, 6, 10, 13, 15), typeOfNotification.delivery),
  Notification("Your payment could not be processed. Please try again later", DateTime(2023, 6, 10, 15, 45), typeOfNotification.error,),
];