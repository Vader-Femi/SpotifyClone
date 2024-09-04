import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify_clone/presentation/now_playing/bloc/now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState>{

  AudioPlayer audioPlayer = AudioPlayer();

  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  NowPlayingCubit() : super(NowPlayingLoading()){
    audioPlayer.positionStream.listen((position) {
      songPosition = position;
      updateNowPlaying();
    });

    audioPlayer.durationStream.listen((duration) {
      songDuration = duration!;
    });
  }


  void updateNowPlaying(){
    emit(
      NowPlayingLoaded()
    );
  }


  Future<void> loadSong(String url) async {
    try {
      await audioPlayer.setUrl(url);
      playOrPauseSong();
      emit(
        NowPlayingLoaded()
      );

    } catch (e) {
      emit(
          NowPlayingFailure()
      );
    }
  }

  void playOrPauseSong() async {
    if (audioPlayer.playing){
      audioPlayer.stop();
    } else {
      audioPlayer.play();
    }

    emit(NowPlayingLoaded());
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}