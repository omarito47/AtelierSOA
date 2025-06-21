import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logement_rendezvous_app/models/longement.dart';
import '../models/rendezvous.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8082/LogementRendezVous_Etudiant_war_exploded/api'; // localhost Android emulator

  static Future<List<Logement>> getLogements() async {
    final response = await http.get(Uri.parse('$baseUrl/logement/getAll'));
    if (response.statusCode == 200) {
      List jsonList = json.decode(response.body);
      return jsonList.map((e) => Logement.fromJson(e)).toList();
    } else {
      throw Exception('Erreur chargement logements');
    }
  }

  static Future<List<RendezVous>> getRendezVous() async {
    final response = await http.get(Uri.parse('$baseUrl/rendezvous/getAll'));
    if (response.statusCode == 200) {
      List jsonList = json.decode(response.body);
      return jsonList.map((e) => RendezVous.fromJson(e)).toList();
    } else {
      throw Exception('Erreur chargement rendez-vous');
    }
  }
  // POST Logement
static Future<bool> addLogement(Logement logement) async {
  final response = await http.post(
    Uri.parse('$baseUrl/logement/Add'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'reference': logement.reference,
      'adresse': logement.adresse,
      'delegation': logement.delegation,
      'gouvernorat': logement.gouvernorat,
      'type': logement.type,
      'description': logement.description,
      'prix': logement.prix
    }),
  );
  return response.statusCode == 200 && response.body == 'true';
}

// POST RendezVous
static Future<bool> addRendezVous(RendezVous rdv) async {
  final response = await http.post(
    Uri.parse('$baseUrl/rendezvous/Add'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'id': rdv.id,
      'date': rdv.date,
      'heure': rdv.heure,
      'numTel': rdv.numTel,
      'logement': {
        'reference': rdv.logement.reference,
        'adresse': rdv.logement.adresse,
        'delegation': rdv.logement.delegation,
        'gouvernorat': rdv.logement.gouvernorat,
        'type': rdv.logement.type,
        'description': rdv.logement.description,
        'prix': rdv.logement.prix
      }
    }),
  );
  return response.statusCode == 200 && response.body == 'true';
}

}
