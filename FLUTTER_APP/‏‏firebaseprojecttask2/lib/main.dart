import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'secondpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var db = FirebaseFirestore.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ...

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool pass_state = true;
  bool Confirm_pass_state = true;
  TextEditingController age = TextEditingController();
  TextEditingController favourite_hobby = TextEditingController();
  TextEditingController Fullname = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      //barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('account created successfully'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Welcom'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('close'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Secondpage()),
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:
              Color.from(alpha: 0.945, red: 0, green: 0, blue: 0.667),
          title: Text(
            "MOHAMMED MLS",
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
                    "https://media.licdn.com/dms/image/v2/C4D16AQFKf_Isf31efQ/profile-displaybackgroundimage-shrink_350_1400/profile-displaybackgroundimage-shrink_350_1400/0/1660325879339?e=1740614400&v=beta&t=UokOllHF1dH2kufDo_3b-uYvaYTwbXVeuJC5dM-ptx8"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: Fullname,
                    validator: (value) {
                      if (value!.isEmpty ||
                          (value[0] != value[0].toUpperCase())) {
                        return 'enter your name corectly that the first letter is capitalized';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: "Full Name"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: age,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'age';
                      }
                      return null;
                    },
                    // onChanged:(value) {
                    //   Email.text=value;
                    // } ,
                    decoration: InputDecoration(labelText: "age"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: favourite_hobby,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'favourite hobby';
                      }
                      return null;
                    },
                    // onChanged:(value) {
                    //   Email.text=value;
                    // } ,
                    decoration: InputDecoration(labelText: "favourite hobby"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Builder(builder: (context) {
                    /*Builder allows you to create a new context
                     that is a child of the Scaffold.
                     This ensures the ScaffoldMessenger can properly 
                     access the Scaffold's context when calling ScaffoldMessenger.of(context). */
                    return ElevatedButton(
                        onPressed: () async {
                          // try {
                          //   final credential = await FirebaseAuth.instance
                          //       .signInWithEmailAndPassword(
                          //           email: Email.text, password: Password.text);

                          //   if(credential.user!=null){
                          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //       content: Text(
                          //           'You Are Login \n Email :${Email.text} \n Password :${Password.text}')));
                          //   _showMyDialog(context);

                          // }
                          // else{
                          //    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //       content: Text(
                          //           'Login faild')));
                          // }
                          // } on FirebaseAuthException catch (e) {

                          //      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //       content: Text(
                          //           '${e.message}')));

                          // } catch (e) {
                          //   print(e);
                          // }

                          // // if (_formkey.currentState!.validate()) {
                          // //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          // //       content: Text(
                          // //           'You Are Login \n Email :${Email.text} \n Password :${Password.text}')));
                          // //   _showMyDialog(context);
                          // // } else {
                          // //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          // //       content: Text('ERROR > Enter a valid data...')));
                          // // }
                          _showMyDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.from(
                                alpha: 0.733,
                                red: 0.004,
                                green: 0.451,
                                blue: 1)),
                        child: Text(
                          "login",
                          style: TextStyle(
                              color: Color.from(
                                  alpha: 1, red: 1, green: 1, blue: 1)),
                        ));
                  }),
                ),
                Builder(builder: (context) {
                  /*Builder allows you to create a new context
                   that is a child of the Scaffold.
                   This ensures the ScaffoldMessenger can properly 
                   access the Scaffold's context when calling ScaffoldMessenger.of(context). */
                  return ElevatedButton(
                      onPressed: () async {
                        // Add a new document with a generated id.
                        final data = {"name":Fullname.text , "age": age.text,"favouritehoppy":favourite_hobby.text};

                        db.collection("Users").add(data).then(
                            (documentSnapshot){
                              Fullname.clear();
                              age.clear();
                              favourite_hobby.clear();
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Added Data with ID: ${documentSnapshot.id}")));

                            });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.from(
                              alpha: 0.733, red: 0.004, green: 0.451, blue: 1)),
                      child: Text(
                        "add user",
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
