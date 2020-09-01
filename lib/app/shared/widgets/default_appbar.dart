import 'package:flutter/material.dart';
import 'package:flutter_gobarber/app/controllers/auth/auth_controller.dart';
import 'package:flutter_gobarber/app/core/consts/app_colors_const.dart';
import 'package:flutter_gobarber/app/screens/auth/auth_screen.dart';
import 'package:flutter_gobarber/app/shared/widgets/circular_avatar.dart';

class DefaultAppbar extends StatelessWidget {
  final title;
  final bool showAvatar;
  final BuildContext context;
  final _authController = AuthController();
  final Function function;

  DefaultAppbar({
    this.title,
    this.context,
    this.function,
    this.showAvatar = false,
  });

  Future<void> _logout() async {
    try {
      await _authController.logout();
      Navigator.of(context).pushReplacementNamed('/');
    } catch (error) {
      print('Error when tried to logout. ERROR: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Flexible(
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: CustomColors.lightGrey,
              size: 32,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Flexible(
          flex: 2,
          child: Text(
            title,
            style: TextStyle(
              color: CustomColors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
        Flexible(
          child: showAvatar
              ? CircularAvatar()
              : IconButton(
                  icon: Icon(
                    Icons.power_settings_new,
                    color: CustomColors.lightGrey,
                  ),
                  onPressed: _logout,
                ),
        ),
      ],
    );
  }
}
