import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SPRINT',
      home: Scaffold(
        appBar: AppBar(title: Text("My First Project"),titleTextStyle: TextStyle(fontSize: 30,color: Color.fromRGBO(255, 255, 255, 1)),
          backgroundColor:  Color.from(alpha: 1, red: 0.192, green: 0.243, blue: 0.961) ,),
        
        body:SafeArea(
          child:Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 200.0,
                      width: 200.0,
                      margin: EdgeInsetsDirectional.all(25),
                      color: Color.fromRGBO(1, 115, 246, 0.656),
                      child: SizedBox(child: Image(image: AssetImage("images/flowers.jpg"))),
                       
                   ),
                   Container(
                      height: 200.0,
                      width: 200.0,
                      margin: EdgeInsetsDirectional.all(25),
                      color: Color.fromRGBO(1, 115, 246, 0.656),
                      child: Image(image: AssetImage("images/flowers.jpg")),
                       
                   ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "The two images are displayed",style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(132, 131, 131, 0.933),
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
                ),
              ],
            ))),
        
       ),
      
    );
  }
}
