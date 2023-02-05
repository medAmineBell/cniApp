class User {
  late String id;
  late String cin;
  late String password;
  late String role;

  User({
    required this.id,
    required this.cin,
    required this.password,
    required this.role,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    cin = json['cin'];
    password = json['password'];
    role = json['role'];
  }
}
