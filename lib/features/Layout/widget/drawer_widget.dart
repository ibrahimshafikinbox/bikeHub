import 'package:bikehub/features/Layout/View/home_view.dart';
import 'package:bikehub/features/Layout/widget/item_darwer.dart';
import 'package:bikehub/features/resources/styles/app_sized_box.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.1,
      bottom: 0,
      left: 0,
      child: Container(
        width:
            MediaQuery.of(context).size.width * 0.6, // Adjust width as needed
        color: Colors.black.withOpacity(0.6), // Adjust opacity as needed
        child: const Column(
          children: [
            AppSizedBox.sizedH50,
            Divider(
              color: Colors.blueGrey,
            ),
            DrawerBuildItem(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            CustomDivider(),
            DrawerBuildItem(
              icon: Icons.motorcycle_outlined,
              text: 'bicycles',
            ),
            CustomDivider(),
            DrawerBuildItem(
              icon: Icons.view_compact_alt_sharp,
              text: 'accessories',
            ),
            CustomDivider(),
            DrawerBuildItem(
              icon: Icons.monetization_on_sharp,
              text: 'Maintenance',
            ),
            CustomDivider(),
            DrawerBuildItem(
              icon: Icons.shopping_cart_checkout_outlined,
              text: 'My Cart',
            ),
            CustomDivider(),
            DrawerBuildItem(
              icon: Icons.account_circle_outlined,
              text: 'My Account',
            ),
            CustomDivider(),
            DrawerBuildItem(
              icon: Icons.phone,
              text: 'Contact Us ',
            ),
            CustomDivider(),
            DrawerBuildItem(
              icon: Icons.signal_cellular_alt_1_bar_outlined,
              text: 'About Us ',
            ),
          ],
        ),
      ),
    );
  }
}
