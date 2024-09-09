import 'package:spotify_clone/domain/entities/song/song.dart';

abstract class FavouriteSongsState {}

class FavouriteSongsLoading extends FavouriteSongsState {}

class FavouriteSongsLoaded extends FavouriteSongsState {
  final List<SongEntity> songs;
  FavouriteSongsLoaded({required this.songs});
}

class FavouriteSongsLoadFailure extends FavouriteSongsState {}