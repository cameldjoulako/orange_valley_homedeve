import 'package:flutter/material.dart';
import 'package:homedeve_orange_valley_caa/models/video.dart';
import 'package:homedeve_orange_valley_caa/utils/constants.dart';

import 'package:google_fonts/google_fonts.dart';

//-------------------
//-- Widget representant la page de detail d'une video
//---- avec image ou video et description
//---------------------------
class DetailsPage extends StatelessWidget {
  final Video video;
  DetailsPage({this.video});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(video.name),
      ),
      body: Container(
        color: backgroundColor,
        height: double.infinity,
        child: _VideoDetail(video: video),
      ),
    );
  }
}

/////---------------
//Widget permettant d'afficher la liste des information sur les videos
//--------
//
class _VideoDetail extends StatelessWidget {
  final Video video;
  _VideoDetail({this.video});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _DetailsPoster(
          //--image du haut
          posterUrl: video.thumbnail,
        ),
        //separation
        SizedBox(
          height: 20,
        ),
        //description
        Padding(
          padding: EdgeInsets.all(8.0),
          child: _getDescription(),
        ),
        //separaion
        SizedBox(height: 50),

        //affichage des mots clés
        Padding(
          padding: EdgeInsets.all(8.0),
          child: _DetailsKeywords(
            keywords: video.keywords,
          ),
        ),
      ],
    );
  }

//méthode retournant la descrition d'une video
  Widget _getDescription() => Text(
        video.description,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      );
}

//---------Widget affichant l'image en grand d'une video
//---------------------------------------------------------
class _DetailsPoster extends StatelessWidget {
  final posterUrl;
  _DetailsPoster({this.posterUrl});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: posterUrl,
      child: Container(
        width: double.infinity,
        height: 200,
        child: Image.asset(
          "images/homedeve.png",
          fit: BoxFit.cover,
        ),
        /* child: Image.network(
          posterUrl,
          fit: BoxFit.cover,
        ), */
      ),
    );
  }
}

//---------Widget traitant les mots clé de la videos
//---------------------------------------------------------
class _DetailsKeywords extends StatelessWidget {
  final keywords;
  _DetailsKeywords({this.keywords});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          //Exemple de keywords renvoyé par l'api
          //"air, france, French,plein,watercolor,outdoors"
          //on crée donc une nouvelle liste ou chaque element est séparé par la virgule
          for (var genre in keywords.split(','))
            Padding(
              padding: EdgeInsets.all(3.0),
              child: Chip(
                label: Text(genre),
              ),
            ),
        ],
      ),
    );
  }
}
