import 'package:flutter/material.dart';
import 'package:flutter_gobarber/app/controllers/barbers/barber_controller.dart';
import 'package:flutter_gobarber/app/core/consts/app_colors_const.dart';
import 'package:flutter_gobarber/app/screens/home/widgets/barber_tile.dart';
import 'package:flutter_gobarber/app/shared/models/barbers.dart';
import 'package:flutter_gobarber/app/shared/widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = '/home';
  final _barberController = BarberController();

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
              child: FutureBuilder<List<BarbersModel>>(
                future: _barberController.barbers,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      padding: const EdgeInsets.only(top: 16),
                      itemCount: snapshot.data.length,
                      itemBuilder: (ctx, index) {
                        return BarberTile(barber: snapshot.data[index]);
                      },
                    );
                  }

                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ListView.builder(
//                 padding: const EdgeInsets.only(top: 16),
//                 itemCount: 3,
//                 itemBuilder: (ctx, index) {
//                   return BarberTile();
//                 },
//               ),
