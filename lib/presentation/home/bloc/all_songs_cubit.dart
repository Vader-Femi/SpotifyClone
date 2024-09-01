import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/get_all_songs.dart';
import 'package:spotify_clone/presentation/home/bloc/all_songs_state.dart';
import 'package:spotify_clone/service_locator.dart';

class AllSongsCubit extends Cubit<AllSongsState> {
  AllSongsCubit(): super(AllSongsLoading());

  Future<void> getAllSongs() async {
    var returnedSongs = await sl<GetAllSongsUseCase>().call();
    returnedSongs.fold((l) {
      emit(AllSongsLoadFailure());
    }, (data) {
      emit(AllSongsLoaded(songs: data));
    });
  }
}
