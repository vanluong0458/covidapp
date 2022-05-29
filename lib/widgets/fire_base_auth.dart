import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Vaccin {
  final userCurrent = FirebaseAuth.instance.currentUser!;
  Future<void> createUserVaccin(String username, String birthday, String phone, String cccd, String number, String typevaccin) async {
    _createUserVaccin(userCurrent.uid, username, birthday, phone, cccd, number, typevaccin);
  }
  _createUserVaccin(String userId, String username, String birthday, String phone, String cccd, String number, String typevaccin) {
    var userVaccin = {
      "username": username,
      "birthday": birthday,
      "phone": phone,
      "cccd": cccd,
      "number": number,
      "typevaccin": typevaccin,
    };
    DatabaseReference ref = FirebaseDatabase.instance.ref("uservaccin");
    ref.child(userId).set(userVaccin);
  }
  Future<void> createFamilyVaccin(String username, String birthday, String phone, String cccd, String number, String typevaccin) async {
    _createFamilyVaccin(userCurrent.uid, username, birthday, phone, cccd, number, typevaccin);
  }
  _createFamilyVaccin(String userId, String username, String birthday, String phone, String cccd, String number, String typevaccin) {   
    var userFVaccin = {
      "username": username,
      "birthday": birthday,
      "phone": phone,
      "cccd": cccd,
      "number": number,
      "typevaccin": typevaccin,
    };
    DatabaseReference ref = FirebaseDatabase.instance.ref("uservaccin");
    ref.child(userId).child('afamily').push().set(userFVaccin);
  }
}

class Declaration {
  final userCurrent = FirebaseAuth.instance.currentUser!;
  Future<void> createUserDeclaration(String username, String birthday, String phone, String cccd, String gender, String job, String address, String dateDeclaration, String f0, String dateF0) async {
    _createUserDeclaration(userCurrent.uid, username, birthday, phone, cccd, gender, job, address, dateDeclaration, f0, dateF0);
  }
  _createUserDeclaration(String userId, String username, String birthday, String phone, String cccd, String gender, String job, String address, String dateDeclaration, String f0, String dateF0) {
    var userDeclaration = {
      "username": username,
      "birthday": birthday,
      "phone": phone,
      "cccd": cccd,
      "gender": gender,
      "job": job,
      "address": address,
      "dateDeclaration": dateDeclaration,
      "f0": f0,
      "dateF0": dateF0,
    };
    DatabaseReference ref = FirebaseDatabase.instance.ref("userDeclaration");
    ref.child(userId).child('person').push().set(userDeclaration);
  }
  Future<void> createFamilyDeclaration(String username, String birthday, String phone, String cccd, String gender, String job, String address, String dateDeclaration, String f0, String dateF0) async {
    _createFamilyDeclaration(userCurrent.uid, username, birthday, phone, cccd, gender, job, address, dateDeclaration, f0, dateF0);
  }
  _createFamilyDeclaration(String userId, String username, String birthday, String phone, String cccd, String gender, String job, String address, String dateDeclaration, String f0, String dateF0) {
    var userDeclaration = {
      "username": username,
      "birthday": birthday,
      "phone": phone,
      "cccd": cccd,
      "gender": gender,
      "job": job,
      "address": address,
      "dateDeclaration": dateDeclaration,
      "f0": f0,
      "dateF0": dateF0,
    };
    DatabaseReference ref = FirebaseDatabase.instance.ref("userDeclaration");
    ref.child(userId).child('family').push().set(userDeclaration);
  }
}