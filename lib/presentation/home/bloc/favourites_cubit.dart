import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/domain/usecases/song/get_favourite_songs.dart';
import 'package:spotify_clone/presentation/home/bloc/favourites_songs_state.dart';
import 'package:spotify_clone/service_locator.dart';

class FavouriteSongsCubit extends Cubit<FavouriteSongsState> {
  FavouriteSongsCubit(): super(FavouriteSongsLoading());

  List<SongEntity> favouriteSongs = [];

  Future<void> getFavouriteSongs() async {
    var results = await sl<GetFavouriteSongsUseCase>().call();
    results.fold((l) {
      emit(FavouriteSongsLoadFailure());
    }, (data) {
      favouriteSongs = data;
      emit(FavouriteSongsLoaded(songs: data));
    });
  }

  Future<void> removeFromFavourite(int index) async {
    favouriteSongs.removeAt(index);
    emit(FavouriteSongsLoaded(songs: favouriteSongs));

  }
}
