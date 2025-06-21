import 'package:flutter/material.dart';
import 'package:logement_rendezvous_app/services/ApiService.dart';
import '../models/rendezvous.dart';

class RendezVousPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liste Rendez-vous')),
      body: FutureBuilder<List<RendezVous>>(
        future: ApiService.getRendezVous(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!
                  .map((rdv) => ListTile(
                        title: Text('Date: ${rdv.date} - Heure: ${rdv.heure}'),
                        subtitle: Text('Tel: ${rdv.numTel}\nLogement: ${rdv.logement.adresse}'),
                      ))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
