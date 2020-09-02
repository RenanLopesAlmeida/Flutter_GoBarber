import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gobarber/app/external/interfaces/barber_interface.dart';
import 'package:flutter_gobarber/app/shared/models/barbers.dart';

class BarberRepository extends BarberInterface {
  CollectionReference barbersCollection =
      FirebaseFirestore.instance.collection('barbers');

  List<BarbersModel> barberList = [];

  Future<List<BarbersModel>> get fetchBarbers async {
    BarbersModel barber;

    QuerySnapshot querySnapshot = await barbersCollection.get();

    querySnapshot.docs.forEach((doc) {
      barber = BarbersModel.fromJson(doc.data());
      barberList.add(barber);
    });

    return [...barberList];
  }
}
