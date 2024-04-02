// import 'package:bikehub/Login/cubit/login_state.dart';
// import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// // login with emaill and pass
// class LoginCubit extends Cubit<LoginStates> {
//   LoginCubit() : super(LoginInitialState());
//   static LoginCubit get(context) => BlocProvider.of(context);

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> logInWithEmailAndPassword(String email, String password) async {
//     emit(LoginLoadingState());
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//       emit(LoginSuccessState());
//     } on FirebaseAuthException catch (e) {
//       emit(LoginErrorState());
//     }
//   }
// }

import 'package:bikehub/features/Login/cubit/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logInWithEmailAndPassword(String email, String password) async {
    emit(LoginLoadingState());
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      // Consider handling different error codes with specific messages
      emit(LoginErrorState()); // Pass the error code to the state
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    emit(LoginLoadingState()); // Reusing the loading state
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        emit(
            LoginSuccessState()); // Emit success state if user creation is successful
      } else {
        emit(LoginErrorState()); // Handle unexpected null user
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginErrorState()); // Emit error state with the Firebase error code
    }
  }
}
