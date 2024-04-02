import 'package:bikehub/Core/config/helper/navigation_helper.dart';
import 'package:bikehub/features/Layout/cubit/app_cubit.dart';
import 'package:bikehub/features/Layout/widget/category_image.dart';
import 'package:bikehub/features/Layout/widget/drawer_widget.dart';
import 'package:bikehub/features/Layout/widget/item_darwer.dart';
import 'package:bikehub/features/Layout/widget/slider.dart';
import 'package:bikehub/features/categories/new_bycycle/view/new_bycycle_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bikehub/features/resources/colors/colors.dart';
import 'package:bikehub/features/resources/images/images.dart';
import 'package:bikehub/features/resources/styles/app_sized_box.dart';
import 'package:bikehub/features/resources/styles/app_text_style.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppSizedBox.sizedH30,
              Row(
                children: [
                  AppSizedBox.sizedW25,
                  GestureDetector(
                    onTap: _openDrawer,
                    child: SizedBox(
                        height: 25,
                        width: 35,
                        child: Image.asset("assets/images/menu (2) 1.png")),
                  ),
                  AppSizedBox.sizedW75,
                  GestureDetector(
                    onTap: () {
                      AppCubit.get(context).getCaroselSliderDate();
                    },
                    child: Center(
                      child: SizedBox(
                          height: 100,
                          width: 150,
                          child: Image.asset(AppImages.logo)),
                    ),
                  ),
                ],
              ),
              const Divider(),
              ImageSliderFirebase(),
              AppSizedBox.sizedH15,
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Category",
                        style: TextStyle(
                            color: Color(0xFF60989A),
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 200,
              //   child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: 3,
              //       itemBuilder: (BuildContext context, int index) {
              //         return ImageWithText(
              //           text: names[index],
              //           requiredImage: '',
              //         );
              //       }),
              // ),
              // SizedBox(
              //   height: 200,
              //   child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: 3,
              //       itemBuilder: (BuildContext context, int index) {
              // return ImageWithText(
              //   text: names[index],
              //   requiredImage: images[index],
              // );
              //       }),
              // ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                ),
                itemCount: names.length, // Number of items in the grid
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        navigateTo(context, BikeListWidget());
                      }
                    },
                    child: ImageWithText(
                      text: names[index],
                      requiredImage: images[index],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

final List<String> images = [
  AppImages.usedbikes,
  AppImages.newbikes,
  AppImages.gears,
  AppImages.clothes,
  AppImages.mobilementenance
];
final List<String> names = [
  "Used bikes ",
  "New Bikes ",
  " Geard ",
  "clothes",
  "Mobile mentenance"
];

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.blueGrey,
    );
  }
}
