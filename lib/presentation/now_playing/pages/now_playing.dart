import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/core/configs/constants/app_urls.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/presentation/now_playing/bloc/now_playing_cubit.dart';
import 'package:spotify_clone/presentation/now_playing/bloc/now_playing_state.dart';

class NowPlayingPage extends StatelessWidget {
  final SongEntity song;

  const NowPlayingPage({required this.song, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        showBackButton: false,
        title: const Text(
          "Now Playing",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        action: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert_rounded,
            size: 22,
          ),
        ),
      ),
      body: BlocProvider(
        create: (_) => NowPlayingCubit()..loadSong(
              "${AppURLS.songFirestorage}${song.artist} - ${song.title}.mp3?${AppURLS.mediaAlt}"),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _songCover(context),
              const SizedBox(height: 17),
              _songDetails(context, song),
              const SizedBox(height: 50),
              _songPlayer(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "${AppURLS.coverFirestorage}${song.artist} - ${song.title}.jpeg?${AppURLS.mediaAlt}",
              ),
            )),
      ),
    );
  }

  Widget _songDetails(BuildContext context, SongEntity song) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  song.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 6),
                Text(
                  song.artist,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 20),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.favorite_border_rounded,
                size: 24, color: Color(0xff6C6C6C)),
          ),
        ],
      ),
    );
  }

  Widget _songPlayer(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
        builder: (context, state) {
      if (state is NowPlayingLoading) {
        return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator());
      }

      if (state is NowPlayingLoaded) {
        return Column(
          children: [
            Slider(
                value: context
                    .read<NowPlayingCubit>()
                    .songPosition
                    .inSeconds
                    .toDouble(),
                min: 0.0,
                max: context
                    .read<NowPlayingCubit>()
                    .songDuration
                    .inSeconds
                    .toDouble(),
                onChanged: (value) {}),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatDuration(
                      context.read<NowPlayingCubit>().songPosition,
                    ),
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 12),
                  ),
                  Text(
                    formatDuration(
                      context.read<NowPlayingCubit>().songDuration,
                    ),
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: (){
                context.read<NowPlayingCubit>().playOrPauseSong();
              },
              child: Container(
                height: 72,
                width: 72,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColours.primary),
                child: Icon(context.read<NowPlayingCubit>().audioPlayer.playing
                    ? Icons.pause
                    : Icons.play_arrow),
              ),
            ),
          ],
        );
      }

      return Container();
    });
  }

  String formatDuration(Duration duration) {
    final minute = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return "${minute.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
  }
}
