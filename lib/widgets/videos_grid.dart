import 'package:flutter/material.dart';
import 'package:homedeve_orange_valley_caa/models/video.dart';
import 'package:homedeve_orange_valley_caa/pages/details_page.dart';

//----------------------------------------------
//---------Widget affichant une GridView--------
//----------------------------------------------
class VideosGrid extends StatelessWidget {
  //final List<Video> videos = [];
  final List<Video> videos;

  VideosGrid({this.videos});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        for (var video in videos)
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsPage(video: video))),
            child: _VideoTile(
              imageUrl: video.thumbnail,
              title: video.name,
            ),
          )
      ],
    );
  }
}

//----------------------------------------------
//-Widget representant un élement de la GridView---
//----------------------------------------------
// ignore: must_be_immutable
class _VideoTile extends StatelessWidget {
  String imageUrl, title;
  _VideoTile({this.imageUrl, this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      //mettre un espace autour de chaque element de la GridView
      padding: EdgeInsets.all(10.0),
      child: Stack(
        children: [
          // -- Image ---
          Hero(
            tag: imageUrl,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: ClipRRect(
                //pour avoir des rebords arrondis dans le container
                borderRadius: BorderRadius.circular(8.0),
                /* child: Image.asset(
                  "images/homedeve.png",
                  fit: BoxFit.cover,
                ), */
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          //Titre de la video
          Align(
            //pour positioner le texte en bas, au centre, dans la stack
            alignment: Alignment.bottomCenter,
            child: Container(
              //on baisse l'opassité pour avoir un effet sémi-transparent
              color: Colors.black.withOpacity(0.6),
              height: 35,
              child: Center(
                child: Text(
                  title, //pasé en parametre au constructeur
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
