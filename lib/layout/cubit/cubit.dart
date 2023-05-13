

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poads_app/layout/cubit/states.dart';

import '../../screens/categories/categories_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/settings/settings_screen.dart';

class PoadcastCubit extends Cubit<PodcastStates> {
  PoadcastCubit() : super(PodcastInitialState());

  static PoadcastCubit get(context) => BlocProvider.of(context);

  /////// current var For index /////
  int currentIndex = 0;

//////// Screen  List //////////
  List<Widget> screenBottom = [
    HomeScreen(),
     const CategoriesScreen(),
    const SettingsScreen(),
  ];


  void changeBottom(int index) {
    currentIndex = index;
    emit(PodcastBottomNavigationBarState());
  }

}