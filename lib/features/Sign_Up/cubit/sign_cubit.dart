import 'package:bikehub/features/Sign_Up/cubit/sign_state.dart';
import 'package:bikehub/features/Sign_Up/model/signUp_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());
  static SignUpCubit get(context) => BlocProvider.of(context);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    emit(SignUpLoadingState());
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        // Success
        emit(SignUpSuccessState());
      } else {
        // User is unexpectedly null
        emit(SignUpErrorState());
      }
    } on FirebaseAuthException catch (e) {
      // Handling Firebase auth exception
      emit(SignUpErrorState());
    } catch (e) {
      // Handling any other exceptions
      emit(SignUpErrorState());
    }
  }

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(SignUpLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) async {
      emit(SignUpSuccessState());

      print(value.user?.email);
      print(value.user?.uid);
      userCreate(
        phone: phone,
        email: email,
        uId: value.user?.uid,
        name: name,
      );

      // emit(SocialRegisterSuccessState());
    }).catchError((error) {
      emit(SignUpErrorState());
      print(error.toString());
    });
  }

  void userCreate({
    required String? email,
    required String? name,
    required String? phone,
    required String? uId,
  }) {
    UserModel? model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      bio: ' bio ... ',
      image:
          "https://as2.ftcdn.net/v2/jpg/01/29/56/11/1000_F_129561138_wNgoPFeBUA3J2buXxxOkb5YoKejUoSnb.jpg",
      cover:
          ' https://img.freepik.com/free-vector/blue-futuristic-networking-technology_53876-97395.jpg?w=740&t=st=1660859146~exp=1660859746~hmac=9248c9215bad57f45a3fa67a15f5f43470a6fd32e488a380251b6b0c13eb3f86',
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) async {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState());
      print(error.toString());
    });
  }
}
