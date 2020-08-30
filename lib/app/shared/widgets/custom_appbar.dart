import 'package:flutter/material.dart';
import 'package:flutter_gobarber/app/core/consts/app_colors_const.dart';

class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Welcome,',
                  style: TextStyle(fontSize: 20, color: CustomColors.grey),
                ),
                Text(
                  'Renan',
                  style: TextStyle(fontSize: 20, color: CustomColors.primary),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 24),
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: CustomColors.input,
            borderRadius: BorderRadius.circular(28),
          ),
        ),
      ],
    );
  }
}
