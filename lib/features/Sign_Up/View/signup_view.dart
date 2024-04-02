import 'package:bikehub/features/Login/View/Widgets/custom_Tap_button.dart';
import 'package:bikehub/features/Login/View/Widgets/custom_text_form_field.dart';
import 'package:bikehub/features/Sign_Up/cubit/sign_cubit.dart';
import 'package:bikehub/features/Sign_Up/cubit/sign_state.dart';
import 'package:bikehub/features/resources/styles/app_sized_box.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPassController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Sign Up Successful"),
            ));
            // Navigate to the next page or perform any actions after signup
          } else if (state is SignUpErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("email already exists"),
            ));
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: ListView(
              children: [
                Image.asset("assets/images/app_logo.png", height: 300),

                // Repeat for other fields, adjusting TextInputType as necessary
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    label: "Email",
                    hint: 'Enter your email',
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                    lines: null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultFormField(
                    controller: nameController,
                    type: TextInputType.emailAddress,
                    label: "Name",
                    hint: 'Enter your Name',
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
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
                    type: TextInputType.emailAddress,
                    label: "Phone",
                    hint: 'Enter your phone',
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
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
                    type: TextInputType.name,
                    label: "password",
                    hint: 'Enter your password',
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                    lines: null,
                  ),
                ),
                AppSizedBox.sizedH20,
                ConditionalBuilder(
                  condition: state is! SignUpLoadingState,
                  builder: (BuildContext context) => DefaultButton(
                    text: "Sign Up",
                    function: () {
                      if (formKey.currentState!.validate()) {
                        // Call sign up method
                        // SignUpCubit.get(context).createUserWithEmailAndPassword(
                        //   emailController.text,
                        //   passwordController.text,
                        // );
                        SignUpCubit.get(context).userRegister(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                            phone: phoneController.text);
                      }
                    },
                    width: MediaQuery.of(context).size.width / 2.5,
                  ),
                  fallback: (BuildContext context) =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
