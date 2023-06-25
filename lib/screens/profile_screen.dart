import 'package:ecommerce/widgets/profile_list_tile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Profile",
        style: TextStyle(color: Colors.green, fontSize: 25),
      )),
      body: ListView(children: [
        Container(
          width: double.infinity,
          height: 200,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  "assets/images/myimage.jpg",
                  height: 120,
                  width: 120,
                ),
              ),
              const SizedBox(height: 3,),
              const Text("Ahmed Khan",  style: TextStyle(fontSize: 22),),
              const Text("0314-9988999",  style: TextStyle(fontSize: 14),),

            ],
          ),
        ),
        ProfileListTile(listItemTitle: "Shipping Address", listItemOnTap: (){}),
        ProfileListTile(listItemTitle: "Order History", listItemOnTap: (){}),
        ProfileListTile(listItemTitle: "Payment Options", listItemOnTap: (){}),
        ProfileListTile(listItemTitle: "Account Details", listItemOnTap: (){}),
        ProfileListTile(listItemTitle: "Reviews", listItemOnTap: (){}),
      ]),
    );
  }
}
