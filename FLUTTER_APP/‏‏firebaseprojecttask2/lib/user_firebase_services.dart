import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseproject/firebase_model.dart';

class UserFirebaseServices {
  var db = FirebaseFirestore.instance;
  Future<List<User>> Get_user_firebase() async {
    List<User> users = [];
    await db.collection("Users").get().then((event) {
      for (var doc in event.docs) {
        users.add(User.fromFirestore(doc));
      }
    });
    return users;
  }
}
