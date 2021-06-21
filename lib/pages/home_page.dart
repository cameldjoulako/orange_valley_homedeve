import 'package:flutter/material.dart';
import 'package:homedeve_orange_valley_caa/services/video_api.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getVideosFromApi().then((value) => print(value.length));
    return Scaffold(
      appBar: AppBar(
        title: Text('Orange Valley CAA - Homedeve'),
      ),
      body: Container(),
    );
  }
}
