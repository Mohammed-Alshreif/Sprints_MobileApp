import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseproject/user_firebase_services.dart';
import 'package:flutter/material.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({super.key});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  var users=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_user_from_firebade();
  }
  get_user_from_firebade()async{
    var userfirebase= await UserFirebaseServices().Get_user_firebase();
    setState(() {
      users=userfirebase;
    });

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios_sharp)),
          backgroundColor:
              Color.from(alpha: 0.945, red: 0, green: 0, blue: 0.667),
          title: Text(
            "Second form>> MLS",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        body: SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true, // Ensures GridView fits in Column
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: users.length,
                      itemBuilder: (BuildContext context, int index) {
                       return ListTile(
                        title: Text(users[index].name),
                         subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${users[index].age}"),
                          Text("${users[index].favouritehoppy}"),
                        ],
                      ),
                       );
                      },
                    ),
                   
                   
                   
                  ],
                ),
              ),
            )
      ),
    );
  }
}
