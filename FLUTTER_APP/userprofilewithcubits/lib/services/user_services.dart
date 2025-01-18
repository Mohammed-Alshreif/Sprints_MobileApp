import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userprofile/models/user_model.dart';

final dio = Dio();

class UserServices {
  List<User> users=[];
  String endpoint="https://jsonplaceholder.typicode.com/users";
  Future<List<User>> getusers() async {
    try {
      final response = await dio.get(endpoint);
      var data =response.data;
      var cachdata=jsonEncode(data);
      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("userdata",cachdata);
                          
      data.forEach((json){
        User user =User.fromJson(json);
        users.add(user);

      });
      print(response);
    } catch (e) {
      print(e);
    }
    
    return users;
    
  }
}