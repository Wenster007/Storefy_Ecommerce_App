import 'package:ecommerce/data/dummy_data.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/widgets/group_buttons.dart';
import 'package:ecommerce/widgets/product_item_list.dart';
import 'package:ecommerce/widgets/search_bar.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Product> filteredProductList = [];
  int currentCategoryIndex = 0;

  void onClickFavIcon(Product product) {
    if (favorites.contains(product)) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Already added in the favorites"),
        ),
      );
    } else {
      favorites.add(product);

    }
  }

  //Function of changing activeButtonScreen based on buttons.
  void _onGroupButtonClick(int index) {
    if (index == 0) {
      setState(() {
        currentCategoryIndex = index;
      });
    } else if (index == 1) {
      filteredProductList = dummyData
          .where((product) => product.categories.contains("Cookies"))
          .toList();

      setState(() {
        currentCategoryIndex = index;
      });
    } else if (index == 2) {
      filteredProductList = dummyData
          .where((product) => product.categories.contains("Candies"))
          .toList();
      setState(() {
        currentCategoryIndex = index;
      });
    }
  }

  late Widget activeButtonScreen ;

  @override
  Widget build(BuildContext context) {

    if (currentCategoryIndex == 0) {
      activeButtonScreen = ProductItemList(
        currentDataList: dummyData,
      );
    } else if (currentCategoryIndex == 1) {
      activeButtonScreen = ProductItemList(
        currentDataList: filteredProductList,
      );
    } else if (currentCategoryIndex == 2) {
      activeButtonScreen = ProductItemList(
        currentDataList: filteredProductList,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "STOREFY",
          style: TextStyle(color: Colors.green, fontSize: 25),
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
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Products",
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
            const SizedBox(
              height: 16,
            ),
            GroupButtons(
              onGroupButtonClick: _onGroupButtonClick,
            ),
            Expanded(child: activeButtonScreen),
          ],
        ),
      ),
    );
  }
}
