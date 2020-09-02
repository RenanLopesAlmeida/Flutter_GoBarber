import 'package:flutter/material.dart';
import 'package:flutter_gobarber/app/controllers/auth/auth_controller.dart';
import 'package:flutter_gobarber/app/core/consts/app_colors_const.dart';
import 'package:flutter_gobarber/app/shared/widgets/circular_avatar.dart';

class HomeAppBar extends StatelessWidget {
  final _authController = AuthController();

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
                FutureBuilder(
                  future: _authController.userFirstName,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data,
                        style: TextStyle(
                          fontSize: 20,
                          color: CustomColors.primary,
                        ),
                      );
                    }

                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ),
        CircularAvatar(),
      ],
    );
  }
}
