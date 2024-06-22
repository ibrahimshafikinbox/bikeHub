 
import 'package:flutter/material.dart';

class BikeListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // This allows the column to scroll
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, index) {
                    return BikeCard(title: "title", price: "price");
                  })
             ],
          ),
        ),
      ),
    );
  }
}

class BikeCard extends StatelessWidget {
  final String title;
  final String price;

  const BikeCard({Key? key, required this.title, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width *
            0.4, // Taking 40% of screen width for each card
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              'assets/images/gears.jpg',
              width: 100, // Set image width to your preference
              height: 100, // Set image height to your preference
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              price,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add your onPressed code here
              },
              child: Text('add cart'),
            ),
          ],
        ),
      ),
    );
  }
}
