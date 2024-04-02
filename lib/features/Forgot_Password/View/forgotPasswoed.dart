import 'package:bikehub/features/Login/View/Widgets/custom_Tap_button.dart';
import 'package:bikehub/features/Login/View/Widgets/custom_text_form_field.dart';
import 'package:bikehub/features/resources/styles/app_sized_box.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var mailController = TextEditingController();
  var confirmPassController = TextEditingController();
  var codeController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/images/app_logo.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultFormField(
                  controller: mailController,
                  type: TextInputType.visiblePassword,
                  label: "Mail ",
                  hint: 'Mail',
                  // prefix: Icons.phone,
                  onValidate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'field is required ';
                    }
                    return null;
                  },
                  lines: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultFormField(
                  controller: phoneController,
                  type: TextInputType.visiblePassword,
                  label: "Phone  ",
                  hint: 'phone  ',
                  // prefix: Icons.phone,
                  onValidate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'field is required ';
                    }
                    return null;
                  },
                  lines: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultFormField(
                  controller: codeController,
                  type: TextInputType.visiblePassword,
                  label: "enter Code  ",
                  hint: 'Enter Code ',
                  // prefix: Icons.phone,
                  onValidate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'field is required ';
                    }
                    return null;
                  },
                  lines: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultFormField(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  label: "Password ",
                  hint: '************',
                  // prefix: Icons.phone,
                  onValidate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'field is required ';
                    }
                    return null;
                  },
                  lines: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultFormField(
                  controller: confirmPassController,
                  type: TextInputType.visiblePassword,
                  label: "confirm Password ",
                  hint: '*******',
                  // prefix: Icons.phone,
                  onValidate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'field is required ';
                    }
                    return null;
                  },
                  lines: null,
                ),
              ),
              AppSizedBox.sizedH20,
              DefaultButton(
                function: () {},
                text: 'Change Password ',
                width: MediaQuery.of(context).size.width / 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
