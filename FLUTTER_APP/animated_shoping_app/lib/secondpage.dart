import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({super.key});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 0, 216, 1),
          title: Row(
            children: [
              Icon(
                Icons.shopping_basket,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                tr("shopping_app_title"),
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
                child: GridView.builder(
                    shrinkWrap: true, // Ensures GridView fits in Column
                    physics: NeverScrollableScrollPhysics(), // Disables GridView scrolling very important (:
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Set appropriate value
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 30, // Number of items in your grid
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.network(
                              "https://media.licdn.com/dms/image/v2/C4D16AQFKf_Isf31efQ/profile-displaybackgroundimage-shrink_350_1400/profile-displaybackgroundimage-shrink_350_1400/0/1660325879339?e=1740614400&v=beta&t=UokOllHF1dH2kufDo_3b-uYvaYTwbXVeuJC5dM-ptx8",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(tr("product")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text(tr('item_added_to_cart')),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.add_shopping_cart)),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(tr("hot_offers"),style: TextStyle(fontSize: 20),),
              ),
              ListView.builder(
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(tr("hot_offers"),style: TextStyle(fontSize: 20),),
                  );
                },
              ),

            ],
          ),
        ));
  }
}
