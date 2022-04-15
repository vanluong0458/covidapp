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