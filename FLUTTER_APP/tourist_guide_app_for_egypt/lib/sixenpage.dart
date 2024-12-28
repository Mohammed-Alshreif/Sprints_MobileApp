//profile

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
//import 'package:easy_localization/easy_localization.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:tourist_guide_app_for_egypt/third.dart';
import 'main.dart';

class pagesix extends StatefulWidget {
  const pagesix({super.key});

  @override
  State<pagesix> createState() => _pagesixState();
}

class _pagesixState extends State<pagesix> {
  @override
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
          "Login Page MLS",
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  readOnly: true,
                  controller: Fullname,
                  decoration: InputDecoration(labelText: "Full Name"),
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  readOnly: true,
                  controller: Email,
                  decoration: InputDecoration(labelText: "Email"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  readOnly: true,
                  controller: Password,
                  obscureText: pass_state,
                  decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                          onPressed: () {
                            toggle_password();
                          },
                          icon: Icon(pass_state
                              ? Icons.visibility
                              : Icons.visibility_off))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
