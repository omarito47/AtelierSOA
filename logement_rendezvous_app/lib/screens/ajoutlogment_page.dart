import 'package:flutter/material.dart';
import '../models/longement.dart';
import '../services/ApiService.dart';

class AjoutLogementPage extends StatefulWidget {
  @override
  _AjoutLogementPageState createState() => _AjoutLogementPageState();
}

class _AjoutLogementPageState extends State<AjoutLogementPage> {
  final _formKey = GlobalKey<FormState>();
  final logement = Logement(
    reference: 0,
    adresse: '',
    delegation: '',
    gouvernorat: '',
    type: '',
    description: '',
    prix: 0.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ajouter Logement')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextField("Référence", (val) => logement.reference = int.parse(val)),
              buildTextField("Adresse", (val) => logement.adresse = val),
              buildTextField("Délégation", (val) => logement.delegation = val),
              buildTextField("Gouvernorat", (val) => logement.gouvernorat = val),
              buildTextField("Type", (val) => logement.type = val),
              buildTextField("Description", (val) => logement.description = val),
              buildTextField("Prix", (val) => logement.prix = double.parse(val)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final success = await ApiService.addLogement(logement);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(success ? 'Ajouté avec succès' : 'Erreur ajout'),
                    ));
                    if (success) Navigator.pop(context);
                  }
                },
                child: Text('Ajouter'),
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
