import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/bloc/favourite_button/favourite_button_cubit.dart';
import 'package:spotify_clone/common/bloc/favourite_button/favourite_button_state.dart';
import 'package:spotify_clone/common/helpers/is_light_mode.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

class FavouriteButton extends StatelessWidget {
  final SongEntity song;
  const FavouriteButton(this.song, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteButtonCubit(),
      child: BlocBuilder<FavouriteButtonCubit, FavouriteButtonState>(
        builder: (context, state) {
          if (state is FavouriteButtonInitial) {
            return IconButton(
              onPressed: () {
                context.read<FavouriteButtonCubit>().favouriteButtonUpdated(song.songId);
              },
              padding: EdgeInsets.zero,
              icon: Icon(
                song.isFavourite ? Icons.favorite_outlined :Icons.favorite_border_outlined,
                size: 22,
                color: song.isFavourite ? Colors.red :
                context.isLightMode
                    ? AppColours.favouriteIconLight
                    : AppColours.favouriteIonDark,
              ),
            );
          }

          if (state is FavouriteButtonUpdated) {
            return IconButton(
              onPressed: () {
                context.read<FavouriteButtonCubit>().favouriteButtonUpdated(song.songId);
              },
              padding: EdgeInsets.zero,
              icon: Icon(
                state.isFavourite ? Icons.favorite_outlined :Icons.favorite_border_outlined,
                size: 22,
                color: state.isFavourite ? Colors.red :
                context.isLightMode
                    ? AppColours.favouriteIconLight
                    : AppColours.favouriteIonDark,
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
