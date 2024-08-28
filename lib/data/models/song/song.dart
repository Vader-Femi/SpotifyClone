import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;

  SongModel(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.releaseDate});

  SongModel.fromJson(Map<String,dynamic> data){
    title = data["title"];
    artist = data["artist"];
    duration = data["duration"];
    releaseDate = data["releaseDate"];
  }
}

extension SongModelx on SongModel {

  SongEntity toEntity(){
    return SongEntity(
      title: title ?? "Unknown",
      artist: artist ?? "Unknown",
      duration: duration ?? 0.0,
      releaseDate: releaseDate ?? Timestamp.fromMicrosecondsSinceEpoch(8640000000000000000) // 1970-01-01T00:00:00Z (UTC).
    );
  }
}
