import 'package:bikehub/Core/config/helper/navigation_helper.dart';
import 'package:bikehub/Core/config/helper/show_toast.dart';
import 'package:bikehub/features/Layout/View/home_view.dart';
import 'package:bikehub/features/Login/View/Widgets/custom_Tap_button.dart';
import 'package:bikehub/features/Login/View/Widgets/custom_text_form_field.dart';
import 'package:bikehub/features/Login/cubit/login_cubit.dart';
import 'package:bikehub/features/Login/cubit/login_state.dart';
import 'package:bikehub/features/Sign_Up/View/signup_view.dart';
import 'package:bikehub/features/categories/clothes/xlothes.dart';
import 'package:bikehub/features/resources/images/images.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("email not found "),
          ));
        } else if (state is LoginSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Logged in Successful "),
          ));
          // Navigate to your home screen or dashboard here
          navigateTo(context, HomeView());
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: formKey,
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(AppImages.logo),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DefaultFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        label: "Email",
                        hint: 'ibr@gmail.com',
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
                        type: TextInputType.visiblePassword,
                        label: "Password",
                        hint: '************',
                        onValidate: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        lines: null,
                      ),
                    ),
                    BlocBuilder<LoginCubit, LoginStates>(
                      builder: (context, state) {
                        return ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (BuildContext context) => DefaultButton(
                            text: "Login",
                            function: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context)
                                    .logInWithEmailAndPassword(
                                  emailController.text,
                                  passwordController.text,
                                );
                              }
                            },
                            width: MediaQuery.of(context).size.width / 2.5,
                          ),
                          fallback: (BuildContext context) =>
                              const Center(child: CircularProgressIndicator()),
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultButton(
                          function: () {
                            navigateTo(context, SignUpView());
                          },
                          text: 'Sign Up',
                          width: MediaQuery.of(context).size.width / 2.5,
                        ),
                        DefaultButton(
                          function: () {
                            navigateTo(context, ImageSliderFirebase());
                          },
                          text: 'Forget Pass',
                          width: MediaQuery.of(context).size.width / 2.5,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
