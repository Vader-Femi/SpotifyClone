import 'package:dartz/dartz.dart';

abstract class SongsRepository {

  Future<Either> getNewsSongs();
  Future<Either> getAllSongs();
  Future<Either> addOrRemoveFavouriteSong(String songId);
  Future<bool> isFavouriteSong(String songId);
  Future<Either> getFavouriteSongs();
}