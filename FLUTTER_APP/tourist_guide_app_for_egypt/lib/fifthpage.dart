//Favorites Page
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class Fifthpage extends StatefulWidget {
  const Fifthpage({super.key});

  @override
  State<Fifthpage> createState() => _FifthpageState();
}

class _FifthpageState extends State<Fifthpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 0, 216, 1),
          title: Row(
            children: [
              Icon(
                Icons.home,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                tr("Home Page MLS "),
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
                  "Suggested Places to Visit:",
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
                  itemCount: 10, // Number of items in your grid
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.network(
                              "https://upload.wikimedia.org/wikipedia/commons/4/42/Sphinx_with_the_third_pyramid.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Place Name ${index+1}"),
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