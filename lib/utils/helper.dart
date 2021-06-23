/* get FakeVideos est une fonction temporaire qui va nous retourner une liste de videos.
  cette liste est un extrait de notre Api, ceci pour nous eviter de faire des requetes: 
  car on se focalise premierement sur la construction de luser interface 
 */

import 'package:homedeve_orange_valley_caa/models/video.dart';

List<Video> getFakeVideos() {
  return [
    Video(
      name: "Modeling Faces in Clay with Janet Blake",
      description:
          "This workshop, lead by acclaimed sculptor, and OVCAA resident artist, Janet Blake, is a don't miss experience. Janet shares tips and tricks that have made her one of the foremost artists in modeling faces in clay. Her engaging style will have you clamoring for more.",
      thumbnail:
          "http://orangevalleycaa.org/api/media/images/thumbs/WomanSculptsClay_042009083.png",
      keywords: "clay,face,janet blake,sculpture",
    ),
    Video(
      name: "Fire Dancers Shine Bright",
      description:
          "This workshop, lead by acclaimed sculptor, and OVCAA resident artist, Janet Blake, is a don't miss experience. Janet shares tips and tricks that have made her one of the foremost artists in modeling faces in clay. Her engaging style will have you clamoring for more.",
      thumbnail:
          "http://orangevalleycaa.org/api/media/images/thumbs/FireDancers_042981315.png",
      keywords: "clay,face,janet blake,sculpture",
    ),
    Video(
      name: "Modeling Faces in Clay with Janet Blake",
      description:
          "This workshop, lead by acclaimed sculptor, and OVCAA resident artist, Janet Blake, is a don't miss experience. Janet shares tips and tricks that have made her one of the foremost artists in modeling faces in clay. Her engaging style will have you clamoring for more.",
      thumbnail:
          "http://orangevalleycaa.org/api/media/images/thumbs/WomanSculptsClay_042009083.png",
      keywords: "clay,face,janet blake,sculpture",
    ),
    Video(
      name: "Modeling Faces in Clay with Janet Blake",
      description:
          "This workshop, lead by acclaimed sculptor, and OVCAA resident artist, Janet Blake, is a don't miss experience. Janet shares tips and tricks that have made her one of the foremost artists in modeling faces in clay. Her engaging style will have you clamoring for more.",
      thumbnail:
          "http://orangevalleycaa.org/api/media/images/thumbs/WomanSculptsClay_042009083.png",
      keywords: "clay,face,janet blake,sculpture",
    ),
    Video(
      name: "Modeling Faces in Clay with Janet Blake",
      description:
          "This workshop, lead by acclaimed sculptor, and OVCAA resident artist, Janet Blake, is a don't miss experience. Janet shares tips and tricks that have made her one of the foremost artists in modeling faces in clay. Her engaging style will have you clamoring for more.",
      thumbnail:
          "http://orangevalleycaa.org/api/media/images/thumbs/WomanSculptsClay_042009083.png",
      keywords: "clay,face,janet blake,sculpture",
    ),
  ];
}

//VideoSort ne permettra d'avoir
//qu'une des 3 valeurs qu'il énumere

enum VideoSort {
  id,
  name,
  duration
  //par exemple pour avoir le nom on fera VideoSort.name
}

//extension sur une enumerat
extension ParseEnumName on VideoSort {
  String filterName() {
    //si par exemple "VideoSort.duration"
    //on ne retourne que la partie de droite du poinr
    return this.toString().split('.').last;
  }
}
