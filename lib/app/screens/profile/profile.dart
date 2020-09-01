import 'package:flutter/material.dart';
import 'package:flutter_gobarber/app/controllers/auth/auth_controller.dart';
import 'package:flutter_gobarber/app/core/consts/app_colors_const.dart';
import 'package:flutter_gobarber/app/shared/widgets/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  static final String routeName = '/profile';
  final _authController = AuthController();

//nao funcionar por causa que o default app bar não tem mais contexto
  void _logout(BuildContext context) async {
    try {
      await _authController.logout();

      //print('Is logged in? ${_authController.isAuthenticated}');
      Navigator.of(context).pushReplacementNamed('/');
    } catch (error) {
      print('Error when tried to logout. ERROR: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundDarkLight,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CustomAppbar(
              context: context,
              title: 'My Profile',
              transparentHeader: true,
              function: _logout,
            ),
          ],
        ),
      ),
    );
  }
}
