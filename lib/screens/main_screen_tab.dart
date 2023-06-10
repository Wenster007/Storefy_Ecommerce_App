import 'package:ecommerce/screens/favorite_screen.dart';
import 'package:ecommerce/screens/main_screen.dart';
import 'package:ecommerce/screens/notification_screen.dart';
import 'package:flutter/material.dart';

class MainScreenTab extends StatefulWidget {
  const MainScreenTab({Key? key}) : super(key: key);

  @override
  State<MainScreenTab> createState() => _MainScreenTabState();
}

class _MainScreenTabState extends State<MainScreenTab> {
  int currentTabIndex = 0;

  void onTabClick(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeTab = const MainScreen();

    switch (currentTabIndex) {
      case 1:
        activeTab = const FavoriteScreen();
        break;
      case 2:
        activeTab = const NotificationScreen();
        break;
      case 3:
        //myCart section
        break;
      case 4:
        //myProfile section
        break;
    }

    return Scaffold(
      body: activeTab,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabClick,
        currentIndex: currentTabIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.green,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Colors.green,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline_rounded,
              color: Colors.green,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.green,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_sharp,
              color: Colors.green,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
