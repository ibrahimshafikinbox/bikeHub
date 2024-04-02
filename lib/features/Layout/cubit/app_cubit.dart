import 'package:bikehub/features/Layout/cubit/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// part 'slider_image_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  List<QueryDocumentSnapshot> data = [];

  Future<void> getCaroselSliderDate() async {
    emit(AppLoadingState());
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("sliderImages").get();
    data.addAll(querySnapshot.docs);
    print(querySnapshot.docs.length);
  }
}
