import 'package:flutter/material.dart';
import 'package:flutter_gobarber/app/core/consts/app_colors_const.dart';
import 'package:flutter_gobarber/app/screens/profile/profile.dart';

class CircularAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(right: 24),
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          color: CustomColors.input,
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(ProfileScreen.routeName);
      },
    );
  }
}
