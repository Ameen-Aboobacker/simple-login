import 'package:flutter/material.dart';
import 'package:sample_project/screens/splash.dart';

const savekeyname='User Logged in';

main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ScreenSplash(),
    );
  }
}
