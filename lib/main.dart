
import 'package:ecommerce/screens/main_screen_tab.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
   App({Key? key}) : super(key: key);

   final theme = ThemeData(
     useMaterial3: true,
   );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const MainScreenTab(),
    );
  }
}
