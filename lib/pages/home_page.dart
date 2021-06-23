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
  var _selectedFilter = VideoSort.id;
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
        actions: [
          PopupMenuButton(
            onSelected: _onChangeFilter,
            icon: Icon(Icons.sort),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: VideoSort.id,
                child: Text('Par défaut'),
              ),
              PopupMenuItem(
                value: VideoSort.name,
                child: Text('Par nom'),
              ),
              PopupMenuItem(
                value: VideoSort.duration,
                child: Text('Par durée'),
              ),
            ],
            //offet permet d'afficher le popup en dessous de la barre pour avoir un meilleu apect visuel
            offset: Offset(0, 15),
          )
        ],
      ),
      body: Container(
        color: backgroundColor,
        //child: VideosGrid(videos: getFakeVideos()),
        /*  child: VideosGrid(videos: videos), */
        child: FutureBuilder(
          //on precise grace a future de quel maniere on veut recuperer les données
          future: getVideosFromApi(filter: _selectedFilter),
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

  void _onChangeFilter(VideoSort choice) {
    if (choice != _selectedFilter) {
      setState(() {
        _selectedFilter = choice;
      });
    }
  }
}
