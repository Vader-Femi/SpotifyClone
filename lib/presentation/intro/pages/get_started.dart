import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/helpers/is_light_mode.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/presentation/choose_mode/pages/choose_mode.dart';

import '../../choose_mode/bloc/theme_cubit.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.introBg),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(context.isLightMode ? 0 : 0.15), // This elvis operator pretty much does nothing visible because the image covers the background, but I like is so just leave it. Thanks
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                      tag: "Spotify Logo",
                      child: SvgPicture.asset(AppVectors.appLogo)),
                ),
                const Spacer(),
                const Text(
                  "Enjoy listening to music",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,),
                ),
                const SizedBox(height: 21),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: AppColours.grey,
                      fontSize: 13),
                ),
                const SizedBox(height: 21),
                Hero(
                  tag: "Next Button",
                  child: BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ChooseModePage(),
                        ),
                      );
                    },
                    title: "Get Started",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
