class Student {
  late String id;
  late String nom;
  late String prenom;
  late String address;
  late String niveau;
  late String location;
  late String telephone;
  late String dateNaissance;
  late String userId;

  Student({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.address,
    required this.niveau,
    required this.location,
    required this.telephone,
    required this.dateNaissance,
    required this.userId,
  });

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    nom = json['nom'];
    prenom = json['prenom'];
    address = json['address'];
    niveau = json['niveau'];
    location = json['location'];
    telephone = json['telephone'];
    dateNaissance = json['dateNaissance'];
    userId = json['userId'].toString();
  }
}
