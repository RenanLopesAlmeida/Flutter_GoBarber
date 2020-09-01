import 'package:flutter/material.dart';
import 'package:flutter_gobarber/app/core/consts/app_colors_const.dart';
import 'package:flutter_gobarber/app/shared/widgets/default_appbar.dart';
import 'package:flutter_gobarber/app/shared/widgets/home_appbar.dart';

class CustomAppbar extends StatelessWidget {
  final BuildContext context;
  final bool homeAppBar;
  final String title;
  final bool showAvatar;
  final bool transparentHeader;
  final Function function;

  CustomAppbar({
    this.context,
    this.homeAppBar = false,
    this.title = '',
    this.showAvatar = false,
    this.transparentHeader = false,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      color:
          transparentHeader ? Colors.transparent : CustomColors.backgroundDark,
      child: homeAppBar
          ? HomeAppBar()
          : DefaultAppbar(
              title: title,
              context: context,
            ),
    );
  }
}
