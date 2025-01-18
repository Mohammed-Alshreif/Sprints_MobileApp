//Governments

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class Fourthpage extends StatefulWidget {
  const Fourthpage({super.key});

  @override
  State<Fourthpage> createState() => _FourthpageState();
}

class _FourthpageState extends State<Fourthpage> {
  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      //barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('first .......',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 10, 2, 255),
              )),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
              Text('second .......',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 10, 2, 255),
              )),
               
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
                    },
                  )),
              onPressed: () {
                Navigator.of(context).pop();

              },
            ),
          ],
        );
      },
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 0, 216, 1),
          title: Row(
            children: [
             
              Text(
                tr("Governments Page: MLS"),
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(255, 255, 255, 0.918),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Egyptian governorates",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true, // Ensures GridView fits in Column
                  physics:
                      NeverScrollableScrollPhysics(), // Disables GridView scrolling very important (:
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Set appropriate value
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 3, // Number of items in your grid
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiC7EDMxvqPY9H10mpdws1KbTx0t7oTTnYIA&s",
                                fit: BoxFit.cover,
                                
                              ),
                              onTap: () {
                                _showMyDialog(context);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("governorate Name ${index+1}"),
                          ),
                          
                        ],
                      ),
                    );
                  },
                ),
              ),
              
            ],
          ),
        ));
  }
}