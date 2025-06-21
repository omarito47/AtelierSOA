import 'package:flutter/material.dart';
import 'ajoutlogment_page.dart';
import 'ajoutrendezvous_page.dart';
import 'logements_page.dart';
import 'rendezvous_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accueil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Voir Logements'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => LogementsPage()));
              },
            ),
            ElevatedButton(
              child: Text('Voir Rendez-vous'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => RendezVousPage()));
              },
            ),
            ElevatedButton(
  child: Text('Ajouter Logement'),
  onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (_) => AjoutLogementPage()));
  },
),
ElevatedButton(
  child: Text('Ajouter Rendez-vous'),
  onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (_) => AjoutRendezVousPage()));
  },
),

          ],
        ),
      ),
    );
  }
}
