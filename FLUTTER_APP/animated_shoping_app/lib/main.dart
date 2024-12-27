import 'package:flutter/material.dart';
import 'secondpage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
// bool pass_state = true;
void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  runApp(
     EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'lang', // <-- change the path of the translation files 
      fallbackLocale: Locale('ar', 'EG'),
      child: MyApp()
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool pass_state = true;
  bool Confirm_pass_state = true;
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Confirm_Password = TextEditingController();
  TextEditingController Fullname = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      //barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Account created successfully',
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
                    fontSize: 30.0,
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
                              (context, animation, secondaryAnimation) => Secondpage(),
                          transitionDuration: Duration(
                              seconds: 2), // Duration of the transition
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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
                    controller: Email,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Email is requred';
                      }
                      return null;
                    },
                    // onChanged:(value) {
                    //   Email.text=value;
                    // } ,
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: Password,
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: Confirm_Password,
                    validator: (value) {
                      if (value == null ||
                          value.length < 6 ||
                          value != Password.text) {
                        return 'Incorect Password';
                      }
                      return null;
                    },
                    obscureText: Confirm_pass_state,
                    decoration: InputDecoration(
                        labelText: "Confirm Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              toggle_CONFIRMpassword();
                            },
                            icon: Icon(Confirm_pass_state
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
                        "login",
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
