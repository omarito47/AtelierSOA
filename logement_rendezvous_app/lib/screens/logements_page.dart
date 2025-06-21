import 'package:flutter/material.dart';
import '../models/longement.dart';
import '../services/ApiService.dart';

class LogementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liste Logements')),
      body: FutureBuilder<List<Logement>>(
        future: ApiService.getLogements(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!
                  .map((logement) => ListTile(
                        title: Text(logement.adresse),
                        subtitle: Text('${logement.prix} DT - ${logement.type}'),
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
