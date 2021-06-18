import 'package:flutter/material.dart';
import 'package:homedeve_orange_valley_caa/pages/home_page.dart';

void main() {
  runApp(HomedeveOrangeValley());
}

class HomedeveOrangeValley extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
