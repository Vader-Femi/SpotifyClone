import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/widgets/favourite_button/favourite_button.dart';
import 'package:spotify_clone/core/configs/constants/app_urls.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/presentation/home/bloc/favourites_cubit.dart';
import 'package:spotify_clone/presentation/home/bloc/favourites_songs_state.dart';
import 'package:spotify_clone/presentation/now_playing/pages/now_playing.dart';

class FavouriteSongs extends StatelessWidget {
  const FavouriteSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavouriteSongsCubit()..getFavouriteSongs(),
      child: BlocBuilder<FavouriteSongsCubit, FavouriteSongsState>(
        builder: (_, state) {
          if (state is FavouriteSongsLoading) {
            return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }

          if (state is FavouriteSongsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Favourites",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                const SizedBox(height: 17),
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
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => NowPlayingPage(
                            song: songs[index],
                          )));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 56,
                  width: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "${AppURLS.coverFirestorage}${songs[index].artist} - ${songs[index].title}.jpeg?${AppURLS.mediaAlt}",
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songs[index].title,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        songs[index].artist,
                        textAlign: TextAlign.start,
                        maxLines: 2,
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
                    const SizedBox(width: 5),
                    FavouriteButton(
                      songs[index],
                      key: UniqueKey(),
                      extraFunction: () {
                        context
                            .read<FavouriteSongsCubit>()
                            .removeFromFavourite(index);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: songs.length,
    );
  }
}
