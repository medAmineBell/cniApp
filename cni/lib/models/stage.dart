class Stage {
  late String id;
  late String type;
  late String sujet;
  late String encadrant;
  late String dateDep;
  late String dateFin;
  late bool payer;
  late bool status;
  late String userId;

  Stage({
    required this.id,
    required this.type,
    required this.sujet,
    required this.encadrant,
    required this.dateDep,
    required this.dateFin,
    required this.payer,
    required this.status,
    required this.userId,
  });

  Stage.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    type = json['type'];
    sujet = json['sujet'];
    encadrant = json['encadrant'];
    dateDep = json['dateDep'];
    dateFin = json['dateFin'];
    payer = json['payer'];
    status = json['status'];
    userId = json['userId'].toString();
  }
}
