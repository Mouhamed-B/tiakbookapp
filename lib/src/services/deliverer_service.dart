import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tiakbookapp/src/models/deliverer.dart';

class ClientService {
  final CollectionReference deliverers =
      FirebaseFirestore.instance.collection('Deliverers');

  Future<bool> addDeliverer(Deliverer del, BuildContext context) async {
    bool a = false;
    deliverers.add({
      'id': del.id,
      'firstName': del.firstName,
      'lastName': del.lastName,
      'created': del.created,
      'vehicleType': del.vehicleType
    }).then((value) {
      a = true;
    });
    return a;
  }

  Stream<List<Deliverer>> getDeliverers() {
    return deliverers.snapshots().map((snaphots) =>
        snaphots.docs.map((e) => Deliverer.fromSnapshot(e)).toList());
  }

  Stream<Deliverer> getDeliverer(String uid) {
    return deliverers
        .doc(uid)
        .snapshots()
        .map((snap) => Deliverer.fromSnapshot(snap));
  }
}
