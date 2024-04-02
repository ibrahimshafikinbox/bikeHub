// import 'package:bikehub/features/Layout/View/home_view.dart';
// import 'package:flutter/material.dart';

// import 'package:bikehub/features/resources/images/images.dart';
// import 'package:bikehub/features/resources/styles/app_sized_box.dart';

// class NewBycicleView extends StatefulWidget {
//   const NewBycicleView({super.key});

//   @override
//   State<NewBycicleView> createState() => _NewBycicleViewState();
// }

// class _NewBycicleViewState extends State<NewBycicleView> {
//   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   void _openDrawer() {
//     _scaffoldKey.currentState?.openDrawer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 AppSizedBox.sizedW25,
//                 GestureDetector(
//                   onTap: _openDrawer,
//                   child: SizedBox(
//                       height: 35,
//                       width: 35,
//                       child: Image.asset("assets/images/list.jpg")),
//                 ),
//                 AppSizedBox.sizedW75,
//                 Center(
//                   child:
//                       SizedBox(width: 150, child: Image.asset(AppImages.logo)),
//                 ),
//               ],
//             ),
//             const CustomDivider(),
//             AppSizedBox.sizedH15,
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text("New Bickes ",
//                     style: TextStyle(
//                         color: Color.fromARGB(255, 125, 160, 187),
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600)),
//               ],
//             ),
//             AppSizedBox.sizedH40,
//             GridView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               itemCount: 2,
//               itemBuilder: (BuildContext context, int index) {
//                 return ProductBuildItem(text: names[index]);
//               },
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 1.0,
//                 mainAxisSpacing: 1.0,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ProductBuildItem extends StatelessWidget {
//   final String text;
//   const ProductBuildItem({
//     Key? key,
//     required this.text,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black),
//                 borderRadius: BorderRadius.circular(8)),
//             // width: MediaQuery.of(context).size.width / 2,
//             child: Column(
//               children: [
//                 Image.asset(
//                   'assets/images/download.jpeg',
//                   fit: BoxFit.fill,
//                 ),
//                 AppSizedBox.sizedH20,
//                 Container(
//                   width: double.infinity,
//                   color: const Color.fromARGB(
//                       255, 201, 223, 240), // Change color as needed
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           text,
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black, // Change text color as needed
//                           ),
//                         ),
//                       ),
//                       const CustomDivider(),
//                       const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(
//                           "2900",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black, // Change text color as needed
//                           ),
//                         ),
//                       ),
//                       const CustomDivider(),
//                       const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(
//                           "add cart ",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black, // Change text color as needed
//                           ),
//                         ),
//                       ),
//                       // DefaultButton(width: MediaQuery.of(context).size.width/2, function:() {}, text: "text")
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
              // ... Add more widgets if needed
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
