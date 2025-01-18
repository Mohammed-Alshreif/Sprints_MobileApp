//loge in

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
//import 'package:easy_localization/easy_localization.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'main.dart';
import 'firstpage.dart';
class Secondpage extends StatefulWidget {
  const Secondpage({super.key});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  // ignore: non_constant_identifier_names
  bool pass_state = true;
  // ignore: non_constant_identifier_names
  bool Confirm_pass_state = true;
  TextEditingController Login_Email = TextEditingController();
  TextEditingController Login_Password = TextEditingController();


  final _formkey = GlobalKey<FormState>();

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      //barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('successful login',
              style: TextStyle(
                color: Color.fromARGB(255, 10, 2, 255),
              )),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Agne',
                    color: Color.fromARGB(255, 10, 2, 255),
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [TypewriterAnimatedText('WELCOME...')],
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Agne',
                    color: Color.fromARGB(255, 10, 2, 255),
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('CLOSE'),
                    ],
                    onTap: () {
                      Navigator.of(context).pop();

                      // Use PageRouteBuilder to create a fade-in transition for the second page
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) => Firstpage(),
                          transitionDuration: Duration(
                              seconds: 1), // Duration of the transition
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            // Fade the current page out and the second page in
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  )),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Firstpage()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void toggle_password() {
    pass_state = !pass_state;
    setState(() {});
  }

  void toggle_CONFIRMpassword() {
    Confirm_pass_state = !Confirm_pass_state;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
            key: _formkey,
            child: Column(
              children: [
                Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Sphinx_with_the_third_pyramid.jpg/500px-Sphinx_with_the_third_pyramid.jpg"),
  
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: Login_Email,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Email is requred';
                      }
                      else if(value!=Email.text){
                        return 'Incorect Email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: Login_Password,
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      if (value != Password.text) {
                        return 'Incorect Password';
                      }
                      return null;
                    },
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
                
                Builder(builder: (context) {
                  /*Builder allows you to create a new context
                   that is a child of the Scaffold.
                   This ensures the ScaffoldMessenger can properly 
                   access the Scaffold's context when calling ScaffoldMessenger.of(context). */
                  return ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'You Are Login \n Email :${Email.text} \n Password :${Password.text}')));
                          _showMyDialog(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('ERROR > Enter a valid data...')));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.from(
                              alpha: 0.733, red: 0.004, green: 0.451, blue: 1)),
                      child: Text(
                        "Signin",
                        style: TextStyle(
                            color: Color.from(
                                alpha: 1, red: 1, green: 1, blue: 1)),
                      ));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
