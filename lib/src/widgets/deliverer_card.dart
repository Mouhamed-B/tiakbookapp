import 'package:flutter/material.dart';
import 'package:tiakbookapp/src/models/deliverer.dart';
import 'package:tiakbookapp/src/screens/deliverer_profile.dart';
import 'package:tiakbookapp/src/utils/mediaqueries.dart';

// ignore: must_be_immutable
class DelivererCard extends StatelessWidget {
  late Deliverer del;
  List listItem = [
    '2 Roues',
    'Voiture',
    'Poids lourd',
  ];
  DelivererCard({required this.del});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            padding:
                MaterialStateProperty.all(EdgeInsets.only(top: 5, bottom: 5)),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black87)),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DelivererProfile(d: del)));
        },
        child: Container(
          //padding: EdgeInsets.all(5),
          height: vw(context, .3),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Image.asset(
              'assets/images/' + del.vehicleType.toString() + '.png',
            ),
            Column(
              children: [
                SizedBox(
                  height: vh(context, .01),
                ),
                Row(children: [
                  Text(del.firstName + " "),
                  Text(del.lastName),
                ]),
                SizedBox(
                  height: vh(context, .02),
                ),
                Row(
                  children: List.generate(del.zones!.length,
                      (index) => Text(del.zones![index] + " ")),
                ),
                SizedBox(
                  height: vh(context, .02),
                ),
                Row(
                  children: [
                    Text(listItem[del.vehicleType] + " - "),
                    Text(del.phoneNumber),
                  ],
                ),
              ],
            ),
          ]),
        ));
  }
}
