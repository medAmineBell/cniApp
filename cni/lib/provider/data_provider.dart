import 'dart:convert';
import 'package:cni/models/stage.dart';
import 'package:cni/models/student.dart';
import 'package:cni/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataProvider with ChangeNotifier {
  List<Stage> stages = [];
  List<Student> students = [];
  List<User> users = [];
  late User user;

  String serverUrl = "http://10.0.2.2:8081";

  Future<bool> login(String cin, String password) async {
    bool resultat = false;
    final url = serverUrl + '/api/users/login';

    final response = await http
        .post(Uri.parse(url), body: {"cin": cin, "password": password});

    try {
      final extractedData = json.decode(response.body) as List<dynamic>;

      if (extractedData.isNotEmpty) {
        user = User.fromJson(extractedData.first);
        resultat = true;
      }
    } catch (e) {
      print(e.toString());
    }
    return resultat;
  }

  Future<User> addUser(String cin, String password) async {
    late User student;
    final url = serverUrl + '/api/users';

    final response = await http.post(Uri.parse(url),
        body: {"cin": cin, "password": password, "role": "student"});

    try {
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      if (extractedData.isNotEmpty) {
        student = User.fromJson(extractedData);
      }
    } catch (e) {
      print(e.toString());
    }
    return student;
  }

  Future<void> addStudent(
      String nom,
      String prenom,
      String address,
      String niveau,
      String location,
      String telephone,
      String dateNaissance,
      String userId) async {
    final url = serverUrl + '/api/students';

    final response = await http.post(Uri.parse(url), body: {
      "nom": nom,
      "prenom": prenom,
      "address": address,
      "niveau": niveau,
      "location": location,
      "telephone": telephone,
      "dateNaissance": dateNaissance,
      "userId": userId,
    });

    try {
      final extractedData = json.decode(response.body) as List<dynamic>;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addStage(String type, String sujet, String encadrant,
      String dateDep, String dateFin, bool payer, String userId) async {
    final url = serverUrl + '/api/stages';

    final response = await http.post(Uri.parse(url), body: {
      "type": type,
      "sujet": sujet,
      "encadrant": encadrant,
      "dateDep": dateDep,
      "dateFin": dateFin,
      "payer": payer.toString(),
      "userId": userId,
    });

    try {
      final extractedData = json.decode(response.body) as List<dynamic>;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> checkStageStatus(String userId) async {
    bool status = false;
    final url = '$serverUrl/api/stages';

    final response = await http.get(
      Uri.parse(url),
    );

    try {
      final stageData = json.decode(response.body) as List<dynamic>;

      if (stageData.isNotEmpty) {
        stages = [];
        stageData.forEach((element) {
          final stage = Stage.fromJson(element);
          stages.add(stage);
        });
        status = stages.firstWhere((stage) => stage.userId == userId).status;
      }
    } catch (e) {
      print(e.toString());
    }
    return status;
  }

  Future<void> getStages() async {
    final url = '$serverUrl/api/stages';

    final response = await http.get(
      Uri.parse(url),
    );

    try {
      final stageData = json.decode(response.body) as List<dynamic>;

      if (stageData.isNotEmpty) {
        stages = [];
        stageData.forEach((element) {
          final stage = Stage.fromJson(element);
          stages.add(stage);
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getStudents() async {
    final url = '$serverUrl/api/students';

    final response = await http.get(
      Uri.parse(url),
    );

    try {
      final studentData = json.decode(response.body) as List<dynamic>;

      if (studentData.isNotEmpty) {
        students = [];
        studentData.forEach((element) {
          final student = Student.fromJson(element);
          students.add(student);
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getUsers() async {
    final url = '$serverUrl/api/users';

    final response = await http.get(
      Uri.parse(url),
    );

    try {
      final userData = json.decode(response.body) as List<dynamic>;

      if (userData.isNotEmpty) {
        users = [];
        userData.forEach((element) {
          final user = User.fromJson(element);
          users.add(user);
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> validateStage(String stageId) async {
    final url = serverUrl + '/api/stages/$stageId';

    final response =
        await http.put(Uri.parse(url), body: {"status": true.toString()});

    try {
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
    } catch (e) {
      print(e.toString());
    }
    await getStages();
  }
}
