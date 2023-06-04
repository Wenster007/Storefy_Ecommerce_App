import 'package:ecommerce/data/dummy_data.dart';
import 'package:ecommerce/widgets/group_buttons.dart';
import 'package:ecommerce/widgets/product_item.dart';
import 'package:ecommerce/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Widget activeButtonScreen = ListView.builder(itemCount: dummyData.length,itemBuilder: (ctx, index) => ,)

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
          children: [
            const SearchBar(),
            const SizedBox(height: 16,),
            const Text("Products", style: TextStyle(color: Colors.black, fontSize: 22),),
            const SizedBox(height: 16,),
            const GroupButtons(),
            ProductItem(product: dummyData[0]),
          ],
        ),
      ),
    );
  }
}
