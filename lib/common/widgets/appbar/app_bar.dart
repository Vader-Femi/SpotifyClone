import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helpers/is_light_mode.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool showBackButton;

  const BasicAppbar({super.key, this.showBackButton = true, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: title ?? const Text(""),
      leading: showBackButton
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Container(
                decoration: BoxDecoration(
                    color: context.isLightMode
                        ? AppColours.backButtonContainerLight
                        : AppColours.backButtonContainerDark,
                    shape: BoxShape.circle),
                height: 50,
                width: 50,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 15,
                  color: context.isLightMode
                      ? AppColours.backButtonLight
                      : AppColours.backButtonDark,
                ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}
