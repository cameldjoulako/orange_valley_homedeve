import 'package:flutter/material.dart';
import 'package:homedeve_orange_valley_caa/services/video_api.dart';
import 'package:homedeve_orange_valley_caa/utils/constants.dart';
import 'package:homedeve_orange_valley_caa/utils/helper.dart';
import 'package:homedeve_orange_valley_caa/widgets/videos_grid.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var videos = [];
  @override
  Widget build(BuildContext context) {
    //1ere methode pour recuperer les données
    /*  getVideosFromApi().then((value) {
      setState(() {
        videos = value;
      });
    }); */
    return Scaffold(
      appBar: AppBar(
        title: Text('Orange Valley CAA - Homedeve'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: backgroundColor,
        //child: VideosGrid(videos: getFakeVideos()),
        /*  child: VideosGrid(videos: videos), */
        child: FutureBuilder(
          //on precise grace a future de quel maniere on veut recuperer les données
          future: getVideosFromApi(),
          builder: (context, snapshot) {
            //si on est en attente de la recuperation de données:
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            else if (snapshot.hasError)
              return Center(child: Text(snapshot.error));
            else
              return VideosGrid(videos: snapshot.data);
          },
        ),
      ),
    );
  }
}
