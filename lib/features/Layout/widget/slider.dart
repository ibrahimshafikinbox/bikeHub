import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSliderFirebase extends StatefulWidget {
  const ImageSliderFirebase({super.key});

  @override
  State<ImageSliderFirebase> createState() => _ImageSliderFirebaseState();
}

class _ImageSliderFirebaseState extends State<ImageSliderFirebase> {
  late Stream<QuerySnapshot> imageStream;
  int currentSlideIndex = 0;
  CarouselController carouselController = CarouselController();
  @override
  void initState() {
    super.initState();
    var firebase = FirebaseFirestore.instance;
    imageStream = firebase.collection("sliderImages").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: StreamBuilder<QuerySnapshot>(
        stream: imageStream,
        builder: (_, snapshot) {
          if (snapshot.hasData && snapshot.data!.docs.length > 1) {
            return CarouselSlider.builder(
                carouselController: carouselController,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_, index, ___) {
                  DocumentSnapshot sliderImage = snapshot.data!.docs[index];
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              sliderImage['slider'],
                            ))),
                    // child: Image.network(
                    //   sliderImage['slider'],
                    //   fit: BoxFit.contain,
                    // ),
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, _) {
                    setState(() {
                      currentSlideIndex = index;
                    });
                  },
                ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
