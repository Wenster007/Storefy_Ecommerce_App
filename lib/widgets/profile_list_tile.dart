import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({Key? key, required this.listItemTitle, required this.listItemOnTap}) : super(key: key);

  final String listItemTitle;
  final void Function() listItemOnTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0, // Controls the intensity of the shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Controls the corner radius of the ListTile
        side: const BorderSide(
          color: Colors.grey, // Color of the border
          width: 0, // Width of the border
        ),
      ),
      child: ListTile(
        title: Text(listItemTitle, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w300)),
        onTap: listItemOnTap,
        // Add your desired styles to the ListTile
        tileColor: Colors.white, // Background color of ListTile
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Padding around ListTile content
        // Add more style properties as needed
      ),
    );
  }
}
