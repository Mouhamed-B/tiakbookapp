import 'package:cloud_firestore/cloud_firestore.dart';

class Client {
  String? id;
  String firstName;
  String lastName;
  DateTime created;
  String phoneNumber;
  List<String> adresses;

  Client(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.created,
      required this.phoneNumber,
      required this.adresses});

  Client.fromSnapshot(DocumentSnapshot snapshot)
      : this.id = snapshot.id,
        this.firstName = snapshot.data()!['firstName'],
        this.created = snapshot.data()!['created'],
        this.lastName = snapshot.data()!['lastName'],
        this.phoneNumber = snapshot.data()!['phoneNumber'],
        this.adresses = snapshot.data()!['adresses'];
}
