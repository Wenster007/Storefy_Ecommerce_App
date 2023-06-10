enum typeOfNotification {
  delivery,
  cart,
  error
}

class Notification {
  final String message;
  final DateTime time;
  final typeOfNotification type;

  Notification(this.message, this.time, this.type);

}