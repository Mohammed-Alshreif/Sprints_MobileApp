import 'package:flutter/material.dart';
import 'package:userprofile/models/user_model.dart';

class UserDetailes extends StatefulWidget {
  User userDetailes ;
   UserDetailes({super.key,required this.userDetailes});

  @override
  State<UserDetailes> createState() => _UserDetailesState();
}

class _UserDetailesState extends State<UserDetailes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color.from(alpha: 0.945, red: 0, green: 0, blue: 0.667),
        title: Text(
          "USER PROFILE MLS",
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),

      body: Center(
        child: ListTile(
                      
                      title: Text(widget.userDetailes.name),
                      subtitle: Column(
                        children: [
                          Text(widget.userDetailes.email),
                          Text(widget.userDetailes.phone),
                          Text(widget.userDetailes.address.toString()),
                          Text(widget.userDetailes.company.toString()),
                          
                        ],
                      ),
                      
        
                      
                    ),
      ),
    );


  }
}
