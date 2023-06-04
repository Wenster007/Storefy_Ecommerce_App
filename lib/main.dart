import 'package:ecommerce/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
   App({Key? key}) : super(key: key);

   final theme = ThemeData(
     useMaterial3: true,
     colorScheme: ColorScheme.fromSeed(
       brightness: Brightness.light,
       seedColor: const Color.fromARGB(255, 139, 243, 50),
     ),

   );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: MainScreen(),
    );
  }
}
