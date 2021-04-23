import 'package:cloud_firestore/cloud_firestore.dart';

class Deliverer {
  String? id;
  String firstName;
  String lastName;
  DateTime created;
  String phoneNumber;
  String vehicleType;

  Deliverer(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.created,
      required this.phoneNumber,
      required this.vehicleType});

  Deliverer.fromSnapshot(DocumentSnapshot snapshot)
      : assert(snapshot != null),
        this.id = snapshot.id,
        this.created = snapshot.data()!['created'],
        this.lastName = snapshot.data()!['lastName'],
        this.phoneNumber = snapshot.data()!['phoneNumber'],
        this.vehicleType = snapshot.data()!['vehicleType'],
        this.firstName = snapshot.data()!['firstName'];
}
