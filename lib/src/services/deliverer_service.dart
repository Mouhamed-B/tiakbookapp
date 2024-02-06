import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiakbookapp/src/models/deliverer.dart';

class DelivererService {
  final CollectionReference deliverers =
      FirebaseFirestore.instance.collection('Deliverers');

  Future<bool> addDeliverer(Deliverer del) async {
    bool a = false;
    try {
        deliverers.add({
        'id': del.id,
        'firstName': del.firstName,
        'lastName': del.lastName,
        'created': del.created,
        'vehicleType': del.vehicleType
      } as Deliverer).then((value) {
        a = true;
      });
    } catch (e) {
    }
    return a;
  }

  Stream<List<Deliverer>> getDeliverers() {
    return (deliverers).snapshots().map((snaphots) =>
        snaphots.docs.map((e) => Deliverer.fromSnapshot(e.data() as Map<String, dynamic>)).toList());
  }


  Stream<Deliverer> getDeliverer(String uid) {
    return (deliverers)
        .doc(uid)
        .snapshots()
        .map((snap) => Deliverer.fromSnapshot(snap.data() as Map<String, dynamic>));
  }
}
