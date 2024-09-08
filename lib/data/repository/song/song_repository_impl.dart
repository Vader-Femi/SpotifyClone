import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/sources/song/song_firebase_service.dart';
import 'package:spotify_clone/domain/repository/song/song.dart';
import 'package:spotify_clone/service_locator.dart';

class SongRepositoryImpl extends SongsRepository {

  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getAllSongs()  async {
      return await sl<SongFirebaseService>().getAllSongs();
  }

  @override
  Future<Either> addOrRemoveFavouriteSong(String songId) async {
    return await sl<SongFirebaseService>().addOrRemoveFavouriteSong(songId);
  }

  @override
  Future<bool> isFavouriteSong(String songId) async {
    return await sl<SongFirebaseService>().isFavouriteSong(songId);
  }

  @override
  Future<Either> getFavouriteSongs() async {
    return await sl<SongFirebaseService>().getFavouriteSongs();
  }
}