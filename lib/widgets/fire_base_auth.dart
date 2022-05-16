import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void signUp(String email, String password, String username, String phone, Function onSuccess) {
    _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)
    .then((user) {
      _createUser(user.user!.uid, username, phone, onSuccess);
      //print(user);
    }).catchError((err) {
      // todo
    });
  }

  _createUser(String userId, String username, String phone, Function onSuccess) {
    var user = {
      "username": username,
      "phone": phone,
    };
    DatabaseReference ref = FirebaseDatabase.instance.ref("users");
    ref.child(userId).set(user).then((user) {
      onSuccess();
    }).catchError((err) {
      // todo
    });
  }
}

class Vaccin {
  final userCurrent = FirebaseAuth.instance.currentUser!;
  void createUserVaccin(String username, String birthday, String phone, String cccd, String number, String typevaccin) {
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
  //var index = 0;
  void createFamilyVaccin(String username, String birthday, String phone, String cccd, String number, String typevaccin) {
    _createFamilyVaccin(userCurrent.uid, username, birthday, phone, cccd, number, typevaccin);
  }
  _createFamilyVaccin(String userId, String username, String birthday, String phone, String cccd, String number, String typevaccin) {
    //var key = ref.child(userId).child('afamily').push().key;
    
    var userFVaccin = {
      //"id": key,
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
  void createUserDeclaration(String username, String birthday, String phone, String cccd, String gender, String job, String address, String dateDeclaration, String f0, String dateF0) {
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
  void createFamilyDeclaration(String username, String birthday, String phone, String cccd, String gender, String job, String address, String dateDeclaration, String f0, String dateF0) {
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