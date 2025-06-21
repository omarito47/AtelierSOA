
import 'package:logement_rendezvous_app/models/longement.dart';

class RendezVous {
  late final int id;
  late final String date;
  late final String heure;
  late final String numTel;
  late final Logement logement;

  RendezVous({
    required this.id,
    required this.date,
    required this.heure,
    required this.numTel,
    required this.logement,
  });

  factory RendezVous.fromJson(Map<String, dynamic> json) {
    return RendezVous(
      id: json['id'],
      date: json['date'],
      heure: json['heure'],
      numTel: json['numTel'],
      logement: Logement.fromJson(json['logement']),
    );
  }
}
