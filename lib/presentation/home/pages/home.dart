import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/presentation/home/widgets/all_songs.dart';
import 'package:spotify_clone/presentation/home/widgets/news_songs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<String> _tabHeadings = ["News", "Video", "Artists", "Podcast"];
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _tabHeadings.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        showBackButton: false,
        title: SvgPicture.asset(
          AppVectors.appLogo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _homeTopCard(),
            _tabs(),
            SizedBox(
              height: 260,
              child: TabBarView(
                controller: _tabController,
                children: [
                  const NewsSongs(),
                  Container(),
                  Container(),
                  Container()
                ],
              ),
            ),
            const SizedBox(height: 37),
            const AllSongs(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Center(
        child: SizedBox(
          height: 150,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(AppVectors.homeTopCard)),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(AppImages.homeArtist))
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
        controller: _tabController,
        padding: const EdgeInsets.fromLTRB(28, 40, 0, 30),
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        tabs: _tabHeadings
            .map(
              (tab) => Text(
                tab,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )
            .toList());
  }
}
