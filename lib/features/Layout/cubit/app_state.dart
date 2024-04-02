import 'package:equatable/equatable.dart';

//  of 'slider_image_cubit.dart';

abstract class AppStates extends Equatable {
  @override
  List<Object> get props => [];
}

class AppInitialState extends AppStates {}

class AppLoadingState extends AppStates {}

class AppSuccessState extends AppStates {}

// class AppLoaded extends AppStates {

//   @override
//   List<Object> get props => [images];
// }

class AppErrorState extends AppStates {}
