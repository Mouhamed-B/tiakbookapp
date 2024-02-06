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

  Deliverer.fromSnapshot(Map<String, dynamic> snapshot)
      : this.id = snapshot['id'],
        this.created = snapshot['created'],
        this.lastName = snapshot['lastName'],
        this.phoneNumber = snapshot['phoneNumber'],
        this.vehicleType = snapshot['vehicleType'],
        this.firstName = snapshot['firstName'],
        this.isAvailable = snapshot['isAvailable'],
        this.zones = snapshot['zones'];
}
