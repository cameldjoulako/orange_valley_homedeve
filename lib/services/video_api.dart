import 'package:homedeve_orange_valley_caa/models/video.dart';
import 'package:http/http.dart' as http;

/* ici nous allons créer une fonction permettant de recuperer le json depuis l'appi :*/

//on retourne une Future qui retourne une liste de videos
Future<List<Video>> getVideosFromApi() async {
  final url = 'https://orangevalleycaa.org/api/videos';
  //requette de recuperation
  var response = await http.get(url);
  if (response.statusCode == 200) {
    //recuperation de la reponse dans le cas ou la requette a été exécuté avec success
    var json = response.body;
    return videoFromJson(json);
  } else {
    return [];
  }
}
