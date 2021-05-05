import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiakbookapp/src/utils/mediaqueries.dart';

// ignore: must_be_immutable
class CardButton extends StatelessWidget {
  IconData icon;
  String text;
  Widget route;
  CardButton({required this.icon, required this.route, required this.text});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          elevation: MaterialStateProperty.all<double>(5)),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => route));
      },
      child: Container(
        height: vh(context, .25),
        width: vw(context, .4),
        child: Column(
          children: [
            Icon(
              icon,
              size: 120,
              color: Colors.blue,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  text,
                  style: GoogleFonts.raleway(
                      color: Colors.black54,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
