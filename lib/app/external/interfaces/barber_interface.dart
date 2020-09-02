import 'package:flutter_gobarber/app/shared/models/barbers.dart';

abstract class BarberInterface {
  Future<List<BarbersModel>> get fetchBarbers;
}
