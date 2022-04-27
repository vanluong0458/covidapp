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
  void createUserVaccin(String username, String birthday, String phone, String cccd, String typevaccin) {
    _createUserVaccin(userCurrent.uid, username, birthday, phone, cccd, typevaccin);
  }
  _createUserVaccin(String userId, String username, String birthday, String phone, String cccd, String typevaccin) {
    var userVaccin = {
      "username": username,
      "birthday": birthday,
      "phone": phone,
      "cccd": cccd,
      "typevaccin": typevaccin,
    };
    DatabaseReference ref = FirebaseDatabase.instance.ref("uservaccin");
    ref.child(userId).set(userVaccin);
  }
  //var index = 0;
  _createFamilyVaccin(String userId, String username, String birthday, String phone, String cccd, String typevaccin) {
    var userVaccin = {
      "username": username,
      "birthday": birthday,
      "phone": phone,
      "cccd": cccd,
      "typevaccin": typevaccin,
    };
    //index = index + 1;
    DatabaseReference ref = FirebaseDatabase.instance.ref("uservaccin");
    ref.child(userId).child('zfamily').child(username).set(userVaccin);
  }
  void createFamilyVaccin(String username, String birthday, String phone, String cccd, String typevaccin) {
    _createFamilyVaccin(userCurrent.uid, username, birthday, phone, cccd, typevaccin);
  }
}