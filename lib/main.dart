
import 'package:ecommerce/screens/main_screen_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: App()));
}

class App extends StatelessWidget {
   App({Key? key}) : super(key: key);

   final theme = ThemeData(
     useMaterial3: true,
   );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const MainScreenTab(),
    );
  }
}
