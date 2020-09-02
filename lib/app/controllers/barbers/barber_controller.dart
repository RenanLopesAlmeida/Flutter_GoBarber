import 'package:flutter_gobarber/app/external/repositories/barbers_repository.dart';
import 'package:flutter_gobarber/app/shared/models/barbers.dart';
import 'package:mobx/mobx.dart';
part 'barber_controller.g.dart';

class BarberController = _BarberControllerBase with _$BarberController;

abstract class _BarberControllerBase with Store {
  final _barberRepository = BarberRepository();

  @observable
  List<BarbersModel> _barbers = [];

  Future<List<BarbersModel>> get barbers async {
    _barbers = await _barberRepository.fetchBarbers;
    return _barbers;
  }
}
