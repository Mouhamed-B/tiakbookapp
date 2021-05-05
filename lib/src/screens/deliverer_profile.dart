import 'package:flutter/material.dart';
import 'package:tiakbookapp/src/models/deliverer.dart';
import 'package:tiakbookapp/src/screens/delivery_page.dart';

// ignore: must_be_immutable
class DelivererProfile extends StatelessWidget {
  late Deliverer d;
  DelivererProfile({required this.d});
  @override
  Widget build(BuildContext context) {
    List list = [
      'Motocycliste',
      'poids lourds',
      'vehicule particulier',
    ];
    String a = "";
    Color b = Colors.green;
    if (!d.isAvailable) {
      a = "Non ";
      b = Colors.red;
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Profil du livreur")),
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false)),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: Image.asset("assets/images/contact.png"),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                  child: Text(
                a + "Disponible",
                style: TextStyle(color: b, fontSize: 13),
              )),
              SizedBox(
                height: 15,
              ),
              Container(
                  child: Card(
                elevation: 5,
                margin: EdgeInsets.all(25),
                child: Column(
                  children: [
                    Text(
                      d.firstName + " " + d.lastName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 30),
                    Text(
                      list[d.vehicleType],
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [Text("Zones : ")] +
                          List.generate(d.zones!.length,
                              (index) => Text(d.zones![index] + " ")),
                    )
                  ],
                ),
              )),
              SizedBox(height: 40),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeliveryPage()));
                  },
                  style: ButtonStyle(
                      alignment: Alignment.center,
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text("Contacter"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
