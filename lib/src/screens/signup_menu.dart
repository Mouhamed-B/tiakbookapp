import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiakbookapp/src/screens/client_signup.dart';
import 'package:tiakbookapp/src/screens/deliverer_signup.dart';
import 'package:tiakbookapp/src/utils/mediaqueries.dart';
import 'package:tiakbookapp/src/widgets/card_button.dart';

class SignupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Inscription"),
            centerTitle: true,
            automaticallyImplyLeading: true,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context, false)),
          ),
          body: Container(
            child: Column(
              children: [
                SizedBox(
                  height: vh(context, .03),
                ),
                Center(
                  child: Text(
                    "Choisissez un type de compte :",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                        fontSize: 25,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                CardButton(
                    icon: Icons.delivery_dining,
                    route: DelivererSignup(),
                    text: "Livreur"),
                SizedBox(
                  height: 50,
                ),
                CardButton(
                    icon: Icons.person, route: ClientSignup(), text: "Client")
              ],
            ),
          ),
        ));
  }
}
