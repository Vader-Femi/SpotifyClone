import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/helpers/is_light_mode.dart';
import 'package:spotify_clone/common/widgets/favourite_button/favourite_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/domain/usecases/song/add_or_remove_favourite_song.dart';
import 'package:spotify_clone/presentation/home/bloc/all_songs_state.dart';
import 'package:spotify_clone/presentation/home/bloc/all_songs_cubit.dart';
import 'package:spotify_clone/presentation/now_playing/pages/now_playing.dart';

class AllSongs extends StatelessWidget {
  const AllSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AllSongsCubit()..getAllSongs(),
      child: BlocBuilder<AllSongsCubit, AllSongsState>(
        builder: (context, state) {
          if (state is AllSongsLoading) {
            return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }

          if (state is AllSongsLoaded) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Playlist",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "See More",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _songs(context, state.songs),
              ],
            );
          }

          return Container();
        },
      ),
    );
  }

  Widget _songs(BuildContext context, List<SongEntity> songs) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => NowPlayingPage(
                                song: songs[index],
                              )));
                },
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.isLightMode
                          ? AppColours.playIconBGLight
                          : AppColours.playIconBGDark),
                  transform: Matrix4.translationValues(-10, 10, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6.5),
                    child: SvgPicture.asset(
                      AppVectors.play,
                      colorFilter: ColorFilter.mode(
                          context.isLightMode
                              ? AppColours.playIconLight
                              : AppColours.playIconDark,
                          BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      songs[index].title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      songs[index].artist,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Row(
                children: [
                  Text(
                    songs[index].duration.toString().replaceAll(".", ":"),
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                  FavouriteButton(songs[index]),
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: songs.length,
    );
  }
}
