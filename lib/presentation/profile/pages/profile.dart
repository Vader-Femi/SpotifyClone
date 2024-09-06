import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helpers/is_light_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: const Text("Profile"),
        backgroundColour: context.isLightMode ? Colors.white : const Color(0xff2C282B),
      ),
      body: Column(
        children: [
          _profileInfo(context),
        ],
      ),
    );
  }

  Widget _profileInfo(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: BoxDecoration(
        color: context.isLightMode ? Colors.white : const Color(0xff2C282B),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
      ),
    );
  }
}
