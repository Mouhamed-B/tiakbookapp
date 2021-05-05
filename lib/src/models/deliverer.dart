import 'package:cloud_firestore/cloud_firestore.dart';

class Deliverer {
  String? id;
  String firstName;
  String lastName;
  Timestamp created;
  String phoneNumber;
  int vehicleType;
  bool isAvailable;
  List? zones;
  Deliverer(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.created,
      required this.phoneNumber,
      required this.vehicleType,
      required this.isAvailable,
      this.zones});

  Deliverer.fromSnapshot(DocumentSnapshot snapshot)
      : this.id = snapshot.id,
        this.created = snapshot.data()!['created'],
        this.lastName = snapshot.data()!['lastName'],
        this.phoneNumber = snapshot.data()!['phoneNumber'],
        this.vehicleType = snapshot.data()!['vehicleType'],
        this.firstName = snapshot.data()!['firstName'],
        this.isAvailable = snapshot.data()!['isAvailable'],
        this.zones = snapshot.data()!['zones'];
}
