import 'package:flutter/material.dart';
import '../models/longement.dart';
import '../models/rendezvous.dart';
import '../services/ApiService.dart';

class AjoutRendezVousPage extends StatefulWidget {
  @override
  _AjoutRendezVousPageState createState() => _AjoutRendezVousPageState();
}

class _AjoutRendezVousPageState extends State<AjoutRendezVousPage> {
  final _formKey = GlobalKey<FormState>();
  final rdv = RendezVous(
    id: 0,
    date: '',
    heure: '',
    numTel: '',
    logement: Logement(
      reference: 0,
      adresse: '',
      delegation: '',
      gouvernorat: '',
      type: '',
      description: '',
      prix: 0.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ajouter Rendez-vous')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextField("ID", (val) => rdv.id = int.parse(val)),
              buildTextField("Date (YYYY-MM-DD)", (val) => rdv.date = val),
              buildTextField("Heure", (val) => rdv.heure = val),
              buildTextField("Numéro Téléphone", (val) => rdv.numTel = val),
              Divider(),
              Text("Infos Logement", style: TextStyle(fontWeight: FontWeight.bold)),
              buildTextField("Référence", (val) => rdv.logement.reference = int.parse(val)),
              buildTextField("Adresse", (val) => rdv.logement.adresse = val),
              buildTextField("Délégation", (val) => rdv.logement.delegation = val),
              buildTextField("Gouvernorat", (val) => rdv.logement.gouvernorat = val),
              buildTextField("Type", (val) => rdv.logement.type = val),
              buildTextField("Description", (val) => rdv.logement.description = val),
              buildTextField("Prix", (val) => rdv.logement.prix = double.parse(val)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final success = await ApiService.addRendezVous(rdv);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(success ? 'Rendez-vous ajouté' : 'Erreur'),
                    ));
                    if (success) Navigator.pop(context);
                  }
                },
                child: Text('Ajouter Rendez-vous'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, Function(String) onChanged) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        decoration: InputDecoration(labelText: label),
        validator: (value) => value == null || value.isEmpty ? 'Champ requis' : null,
        onChanged: onChanged,
      ),
    );
  }
}
