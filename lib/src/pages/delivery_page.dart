import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SaisieContact extends StatefulWidget {
  @override
  _SaisieContactState createState() => _SaisieContactState();
}

class _SaisieContactState extends State<SaisieContact> {
  String numeroDestinataire = '';
  String lieuExpedition = '';
  String descriptionColie = '';
  String lieuDeRecup = '';
  String modeDePaiement = '';
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "images/livraison.png",
                  height: 100.0,
                  width: 100.0,
                ),
                Text(
                  'Veuiller remplir le formulaire pour contacter un livreur',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Numero destinataire/expediteur',
                      border: OutlineInputBorder()),
                  validator: (val) =>
                      val!.isEmpty ? 'Entrez le numero du destinataire' : null,
                  onChanged: (val) => numeroDestinataire = val,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Lieu d\'expedition',
                      border: OutlineInputBorder()),
                  validator: (val) =>
                      val!.isEmpty ? 'Entrez le lieu d\'expedition' : null,
                  onChanged: (val) => lieuExpedition = val,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Description du Colis',
                      border: OutlineInputBorder()),
                  validator: (val) =>
                      val!.isEmpty ? 'expliquez le contenue du colis' : null,
                  onChanged: (val) => descriptionColie = val,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Lieu de recupération',
                      border: OutlineInputBorder()),
                  validator: (val) => val!.isEmpty
                      ? 'Entrez le lieu de recuperation du colis'
                      : null,
                  onChanged: (val) => lieuDeRecup = val,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Mode de paiement',
                      border: OutlineInputBorder()),
                  validator: (val) =>
                      val!.isEmpty ? 'choisir le mode de paiement' : null,
                  onChanged: (val) => modeDePaiement = val,
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: FlatButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        //TODO logical sequences
                        //
                      }
                    },
                    color: Colors.blue,
                    child: Text(
                      'Contactez un livreur',
                      style: GoogleFonts.pacifico(
                          color: Colors.white, fontSize: 22),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
