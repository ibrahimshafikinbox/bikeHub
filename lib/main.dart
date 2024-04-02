import 'package:bikehub/features/Layout/View/home_view.dart';
import 'package:bikehub/features/Layout/cubit/app_cubit.dart';
import 'package:bikehub/features/Login/View/Login_View.dart';
import 'package:bikehub/features/Login/cubit/login_cubit.dart';
import 'package:bikehub/features/Sign_Up/cubit/sign_cubit.dart';
import 'package:bikehub/features/categories/clothes/xlothes.dart';
import 'package:bikehub/features/categories/new_bycycle/view/new_bycycle_view.dart';
import 'package:bikehub/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // var devicetoken = await FirebaseMessaging.instance.getToken() ?? '';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => AppCubit(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bike_Hub ',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          home: BikeListWidget()),
    );
  }
}
