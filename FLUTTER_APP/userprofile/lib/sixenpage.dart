//profile
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userprofile/models/user_model.dart';
import 'package:userprofile/services/user_services.dart';
import 'package:userprofile/views/user_detailes.dart';

// ignore: non_constant_identifier_names
TextEditingController ID = TextEditingController();
TextEditingController email = TextEditingController();

TextEditingController name = TextEditingController();

class pagesix extends StatefulWidget {
  const pagesix({super.key});

  @override
  State<pagesix> createState() => _pagesixState();
}

class _pagesixState extends State<pagesix> {
  final _formkey = GlobalKey<FormState>();
  List<User> cachdatauser = [];
  Getuserformcach() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString("userdata") ?? '';
    var cachdata = jsonDecode(data);
    cachdata.forEach((item) {
      cachdatauser.add(User.fromJson(item));
    });
    print(cachdata.length);
    setState(() {});
  }

  // Add a new user
  void createUser(User newUser) {
    setState(() {
      cachdatauser.add(newUser);
    });
  }

  // Read user details (already implemented as ListTile UI)

  // Update user details
  void updateUser(int index, User updatedUser) {
    setState(() {
      cachdatauser[index] = updatedUser;
    });
  }

  // Delete user details
  void deleteUser(int index) {
    setState(() {
      cachdatauser.removeAt(index);
    });
  }

  @override
  bool loading = true;
  List<User> user = [];
  getmyusers() async {
    user = await UserServices().getusers();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getmyusers();
    Getuserformcach();
  }

  bool pass_state = true;
  void toggle_password() {
    pass_state = !pass_state;
    setState(() {});
  }

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
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true, // Ensures GridView fits in Column
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cachdatauser.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserDetailes(
                                        userDetailes: cachdatauser[index])));
                          },
                          child: ListTile(
                            leading: Text(cachdatauser[index].id.toString()),
                            title: Text(cachdatauser[index].name),
                            subtitle: Text(cachdatauser[index].email),
                            trailing: Icon(Icons.person),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: ID,
                        decoration: InputDecoration(labelText: "ID"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: name,
                        decoration: InputDecoration(labelText: "Name"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(labelText: "Email"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (cachdatauser.isNotEmpty) {
                            if (ID.hashCode > cachdatauser.length) {
                              deleteUser(int.parse(ID.text)-1);
                              print(int.parse(ID.text));
                            }
                          }
                        },
                        child: Text("Delete"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (cachdatauser.isNotEmpty) {
                            User updatedUser = User(
                              name: name.text,
                              email: email.text,
                              phone: "9876543210",
                              address: Address(
                                street: "street",
                                suite: '',
                                city: '',
                                zipcode: '',
                                geo: Geo(lat: '', lng: ''),
                              ),
                              company: Company(
                                  name: 'name',
                                  catchPhrase: 'catchPhrase',
                                  bs: 'bs'),
                              id: int.parse(ID.text),
                              username: '',
                              website: '',
                            );
                            updateUser(int.parse(ID.text)-1, updatedUser); // Update the first user
                          }
                        },
                        child: Text("Update"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (cachdatauser.isNotEmpty) {
                            User updatedUser = User(
                              name: name.text,
                              email: email.text,
                              phone: "1234567",
                              address: Address(
                                street: "street",
                                suite: '',
                                city: '',
                                zipcode: '',
                                geo: Geo(lat: '', lng: ''),
                              ),
                              company: Company(
                                  name: 'name',
                                  catchPhrase: 'catchPhrase',
                                  bs: 'bs'),
                              id: int.parse(ID.text),
                              username: '',
                              website: '',
                            );
                            createUser(updatedUser); // Update the first user
                          }
                        },
                        child: Text("ADD"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
