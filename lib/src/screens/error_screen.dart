import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.cloud_off,
              size: 130,
              color: Colors.blue,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                    "Réseau indisponible\nVeuillez vérifier votre connexion internet",
                    style: TextStyle(
                      color: Colors.grey[350],
                      fontSize: 20,
                    )),
              ),
            )
          ],
        ));
  }
}
