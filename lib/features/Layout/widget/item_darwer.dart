import 'package:bikehub/features/resources/colors/colors.dart';
import 'package:bikehub/features/resources/styles/app_sized_box.dart';
import 'package:bikehub/features/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class DrawerBuildItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const DrawerBuildItem({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
            color: AppColors.white,
          ),
          AppSizedBox.sizedW35,
          Text(
            text,
            style: AppTextStyle.textStyleWhiteRegular15,
          )
        ],
      ),
    );
  }
}
