import 'package:ecommerce/widgets/group_buttons.dart';
import 'package:ecommerce/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "STOREFY",
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notification_add_outlined, size: 34),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 34,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SearchBar(),
            SizedBox(height: 16,),
            Text("Products", style: TextStyle(color: Colors.black, fontSize: 22),),
            SizedBox(height: 16,),
            GroupButtons(),
          ],
        ),
      ),
    );
  }
}
