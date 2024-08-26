import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _homeTopCard(),
              const SizedBox(height: 41),
              _tabs(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
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
    );
  }

  Widget _tabs() {
    return TabBar(
        controller: _tabController,
        tabs: _tabHeadings
            .map(
              (tab) => Text(tab),
            )
            .toList());
  }
}
