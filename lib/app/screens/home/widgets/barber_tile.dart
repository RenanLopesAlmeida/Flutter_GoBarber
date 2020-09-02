import 'package:flutter/material.dart';
import 'package:flutter_gobarber/app/core/consts/app_colors_const.dart';
import 'package:flutter_gobarber/app/shared/models/barbers.dart';

class BarberTile extends StatelessWidget {
  final BarbersModel barber;

  BarberTile({this.barber});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      height: 112,
      decoration: BoxDecoration(
        color: CustomColors.input,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            leading: Container(
              margin: const EdgeInsets.only(right: 24),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: CustomColors.primary,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            title: Text(
              barber.name,
              style: TextStyle(
                  color: CustomColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            subtitle: Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.calendar_today,
                        color: CustomColors.primary,
                        size: 15,
                      ),
                      SizedBox(width: 11.75),
                      Text(
                        'Weekdays',
                        style: TextStyle(
                          color: CustomColors.lightGrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.6),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color: CustomColors.primary,
                        size: 15,
                      ),
                      SizedBox(width: 11.75),
                      Text(
                        '${barber.startHour} to ${barber.endHour}',
                        style: TextStyle(
                          color: CustomColors.lightGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
