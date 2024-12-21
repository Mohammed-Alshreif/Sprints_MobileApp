import 'package:flutter/material.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                "Shopping App",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(255, 255, 255, 0.918),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GridView Section
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                         "images/flowers.jpg",
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),

                        // Display item text
                        Text(
                          "Item $index",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),

                        IconButton(
                          icon: Icon(Icons.add_shopping_cart),
                          color: Colors.blue,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Item $index added to the cart'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Hot Offers",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 42, 0, 0.918),
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.whatshot,
                    color: Color.fromRGBO(255, 242, 0, 1),
                  ),
                ],
              ),
            ),

            // ListView Builder - Displays 5 items
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Display 5 items
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons
                        .star), // You can change the icon to something related to the offer
                    title: Text(
                      'Offer Item ${index + 1}', // You can customize the text here
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text('Description of offer item ${index + 1}'),
                    trailing: Icon(Icons.arrow_forward),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
