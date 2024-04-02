import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bikehub/features/resources/colors/colors.dart';
import 'package:bikehub/features/resources/styles/app_sized_box.dart';
import 'package:bikehub/features/resources/styles/app_text_style.dart';

class ImageWithText extends StatelessWidget {
  final String text;
  final String requiredImage;

  const ImageWithText({
    Key? key,
    required this.text,
    required this.requiredImage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Material(
        // elevation: 1,
        child: Container(
          width:
              MediaQuery.of(context).size.width / 2, // Adjust width as needed
          child: Column(
            children: [
              SizedBox(
                  height: 120,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Image.asset(
                    requiredImage,
                    fit: BoxFit.cover,
                  )),
              AppSizedBox.sizedH10,
              Container(
                height: 50,
                width: double.infinity,
                color: Color.fromRGBO(
                    201, 221, 228, 1.0), // Change color as needed
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(text,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleMediumBlack),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
