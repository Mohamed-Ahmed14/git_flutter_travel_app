

import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/feature/destination/view/screens/destination_screen.dart';

import '../../../account/view/screens/account_screen.dart';
import '../../../booking/view/screens/trips_screen.dart';
import '../../../favourite/view/screens/favourite_screen.dart';
import '../../../home/view/screens/home_screen.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState>{

  LayoutCubit():super(LayoutInitState());

  static LayoutCubit get(context)=>BlocProvider.of<LayoutCubit>(context);

  List<Widget> screens = [
    HomeScreen(),
    DestinationScreen(),
    FavouriteScreen(),
    TripsScreen(),
    AccountScreen(),
  ];

  int current_index = 0;

  void changeLayout(int value){
    current_index = value;
    emit(ChangeLayoutSuccessState());
  }
}