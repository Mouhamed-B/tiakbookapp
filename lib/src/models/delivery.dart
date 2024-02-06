import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiakbookapp/src/models/client.dart';
import 'package:tiakbookapp/src/models/deliverer.dart';
import 'payment_mode.dart';

class Delivery {
  String? id;
  Client client;
  Deliverer deliverer;
  String source;
  String destination;
  String description;
  bool? accepted;
  DateTime created;
  DateTime? fullfilled;
  String thirdPartyContact;
  PaymentMode paymentMode;

  Delivery(
      {this.id,
      required this.client,
      required this.deliverer,
      required this.source,
      required this.description,
      required this.destination,
      required this.created,
      required this.thirdPartyContact,
      this.accepted,
      this.fullfilled,
      required this.paymentMode});

  Delivery.fromSnapshot(DocumentSnapshot<Delivery> snapshot)
      : this.id = snapshot.id,
        this.accepted = snapshot.data()!.accepted,
        this.client = snapshot.data()!.client,
        this.created = snapshot.data()!.created,
        this.deliverer = snapshot.data()!.deliverer,
        this.destination = snapshot.data()!.destination,
        this.description = snapshot.data()!.description,
        this.fullfilled = snapshot.data()!.fullfilled,
        this.thirdPartyContact = snapshot.data()!.thirdPartyContact,
        this.paymentMode = snapshot.data()!.paymentMode,
        this.source = snapshot.data()!.source;
}
