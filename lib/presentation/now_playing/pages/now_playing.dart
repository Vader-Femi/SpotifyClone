import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:spotify_clone/common/helpers/is_light_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/core/configs/constants/app_urls.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            _songCover(context),
            const SizedBox(height: 17),
            _nameAndLike(context, song),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "${AppURLS.firestorage}${song.artist} - ${song.title}.jpeg?${AppURLS.mediaAlt}",
              ),
            )),
      ),
    );
  }

  Widget _nameAndLike(BuildContext context, SongEntity song) {
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
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
}
