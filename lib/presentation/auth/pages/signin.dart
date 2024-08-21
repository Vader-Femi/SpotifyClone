import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/presentation/auth/pages/signup.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.appLogo,
          height: 40,
          width: 40,
        ),
      ),
      bottomNavigationBar: null,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            _signinText(),
            const SizedBox(height: 5),
            _supportText(),
            const SizedBox(height: 26),
            _usernameOrEmailField(context),
            const SizedBox(height: 16),
            _passwordField(context),
            _recoverPasswordButton(context),
            const SizedBox(height: 13),
            Hero(
              tag: "Next Button",
              child: BasicAppButton(
                onPressed: () {},
                title: "Sign in",
              ),
            ),
            const SizedBox(height: 29),
            _orText(),
            const SizedBox(height: 20),
            Hero(
              tag: "Icons",
              child: _icons(),
            ),
            const SizedBox(height: 5),
            _registerText(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      "Sign In",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _supportText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "If you need any support",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              "click here",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xff38B432),
              ),
            ))
      ],
    );
  }

  Widget _usernameOrEmailField(BuildContext context) {
    return const TextField(
        decoration: InputDecoration(hintText: "Enter Username or Email"));
  }

  Widget _passwordField(BuildContext context) {
    return const TextField(decoration: InputDecoration(hintText: "Password"));
  }

  Widget _recoverPasswordButton(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Recover password",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget _registerText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Not A Member ?",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const SignUp(),
                  ),
                );
              },
              child: const Text(
                "Register Now",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xff288CE9),
                ),
              ))
        ],
      ),
    );
  }

  Widget _orText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xff5B5B5B), Color(0xff252525)],
                ),
                border: Border.all(color: Colors.transparent, width: 1),
                borderRadius: BorderRadius.circular(30)),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: const Text(
            "Or",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
                color: Color(0xff383838)),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[Color(0xff5B5B5B), Color(0xff252525)],
                ),
                border: Border.all(color: Colors.transparent, width: 1),
                borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ],
    );
  }

  Widget _icons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppVectors.google,
          ),
        ),
        const SizedBox(width: 30),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppVectors.apple,
          ),
        ),
      ],
    );
  }
}
