import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/presentation/auth/pages/signin.dart';
import 'package:spotify_clone/presentation/auth/pages/signup.dart';

class SignupOrSignin extends StatelessWidget {
  const SignupOrSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.signupOrSigninTopWave),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.signupOrSigninBg),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.signupOrSigninBottomWave),
          ),
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            children: [
              const SizedBox(height: 100),
              Hero(
                tag: "Spotify Logo",
                child: SvgPicture.asset(AppVectors.appLogo),
              ),
              const SizedBox(height: 55),
              const Text(
                "Enjoy listening to music",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 21),
              const Text(
                "Spotify is a proprietary Swedish audio streaming and media services provider",
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
              ),
              const SizedBox(height: 30),
              Hero(
                tag: "Next Button",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: BasicAppButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                              const SignUp(),
                            ),
                          );
                        },
                        title: "Register",
                        height: 73,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                              const SignIn(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          minimumSize: const Size.fromHeight(73),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Sign In",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
