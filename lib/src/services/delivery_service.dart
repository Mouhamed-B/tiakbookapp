import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiakbookapp/src/models/delivery.dart';

class DeliveryService {
  final CollectionReference<Delivery> deliveries =
      FirebaseFirestore.instance.collection('Deliveries') as CollectionReference<Delivery>;

  Future<bool> addDelivery(Delivery del) async {
    bool a = false;
    deliveries.add({
      'client': del.client,
      'deliverer': del.deliverer,
      'source': del.source,
      'destination': del.destination,
      'created': del.created,
      'paymentMode': del.paymentMode
    }as Delivery).then((value) => a = true);
    return a;
  }

  Stream<Delivery> getDelivery(String uid) {
    return deliveries
        .doc(uid)
        .snapshots()
        .map((snap) => Delivery.fromSnapshot(snap));
  }

  Stream<List<Delivery>> getDeliveries(String owner, Object ownerObj) {
    return deliveries
        .where(owner, isEqualTo: ownerObj)
        .snapshots()
        .map((snaphsots) =>
            snaphsots.docs.map((e) => Delivery.fromSnapshot(e)).toList());
  }
}
