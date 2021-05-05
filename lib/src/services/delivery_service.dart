import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiakbookapp/src/models/delivery.dart';

class DeliveryService {
  final CollectionReference deliveries =
      FirebaseFirestore.instance.collection('Deliveries');

  Future<bool> addDelivery(Delivery del) async {
    bool a = false;
    deliveries.add({
      'client': del.client,
      'deliverer': del.deliverer,
      'source': del.source,
      'destination': del.destination,
      'created': del.created,
      'paymentMode': del.paymentMode
    }).then((value) => a = true);
    return a;
  }

  Stream<Delivery> getDelivery(String uid) {
    return deliveries
        .doc(uid)
        .snapshots()
        .map((snap) => Delivery.fromSnapshot(snap));
  }

  Stream<List<Delivery>> getDeliveries(String owner, Object ownerObj) {
    return FirebaseFirestore.instance
        .collection('Deliveries')
        .where(owner, isEqualTo: ownerObj)
        .snapshots()
        .map((snaphsots) =>
            snaphsots.docs.map((e) => Delivery.fromSnapshot(e)).toList());
  }
}
