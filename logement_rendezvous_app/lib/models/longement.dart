class Logement {
  late final int reference;
  late final String adresse;
  late final String delegation;
 late final String gouvernorat;
  late final String type;
  late final String description;
  late final double prix;

  Logement({
    required this.reference,
    required this.adresse,
    required this.delegation,
    required this.gouvernorat,
    required this.type,
    required this.description,
    required this.prix,
  });

  factory Logement.fromJson(Map<String, dynamic> json) {
    return Logement(
      reference: json['reference'],
      adresse: json['adresse'],
      delegation: json['delegation'],
      gouvernorat: json['gouvernorat'],
      type: json['type'],
      description: json['description'],
      prix: (json['prix'] as num).toDouble(),
    );
  }
}
