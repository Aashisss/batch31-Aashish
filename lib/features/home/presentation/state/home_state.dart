import 'package:flutter/material.dart';

class HomeState {
  final int index;
  final List<Widget> lstScreen;

  HomeState({required this.index, required this.lstScreen});

  HomeState.initialState() 
  :  index= 0,
   lstScreen= [
      // const DashboardView(),
      // const FavoritePageView(),
      // const CartPageView(),
      // const ProfileView(),
    ];
  

  HomeState copyWith({
    int? index,
  }){
    return HomeState(index: index?? this.index, lstScreen: lstScreen);
  }
}

class AddCourseView {
  const AddCourseView();
}
