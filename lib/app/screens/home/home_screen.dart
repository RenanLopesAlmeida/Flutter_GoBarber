import 'package:flutter/material.dart';
import 'package:flutter_gobarber/app/controllers/auth/auth_controller.dart';
import 'package:flutter_gobarber/app/core/consts/app_colors_const.dart';
import 'package:flutter_gobarber/app/screens/home/widgets/barber_tile.dart';
import 'package:flutter_gobarber/app/shared/widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = '/home';
  final _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundDarkLight,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomAppbar(context: context, homeAppBar: true),
            Container(
              margin: const EdgeInsets.all(24),
              child: Text('Barbers',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.white,
                  )),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 16),
                itemCount: 3,
                itemBuilder: (ctx, index) {
                  return BarberTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
