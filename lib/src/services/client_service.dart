import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiakbookapp/src/models/client.dart';

class ClientService {
  static final CollectionReference clients =
      FirebaseFirestore.instance.collection('Clients');

  Future<bool> addClient(Client clt) async {
    bool a = false;
    clients.add({
      'id': clt.id,
      'firstName': clt.firstName,
      'lastName': clt.lastName,
      'created': clt.created,
      'adresses': clt.adresses
    }).then((value) {
      a = true;
    });
    return a;
  }

  Stream<Client> getClient(String uid) {
    return clients
        .doc(uid)
        .snapshots()
        .map((snap) => Client.fromSnapshot(snap));
  }
}
