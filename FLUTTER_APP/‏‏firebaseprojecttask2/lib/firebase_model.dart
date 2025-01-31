import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? name;
  final String? age;
  final String? favouritehoppy;


  User({
    this.name,
    this.age,
    this.favouritehoppy,
   
  });

  factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    
  ) {
    final data = snapshot.data();
    return User(
      name: data?['name'],
      age: data?['age'],
      favouritehoppy: data?['favouritehoppy'],
      
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (age != null) "age": age,
      if (favouritehoppy != null) "favouritehoppy": favouritehoppy,
   
    };
  }
}