import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/screens/profile/repository/profile_details_repo.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetUserEvent>((event, emit) async {
      emit(DetailsLoadingState());
      try{
        final token = _getToken();

        final response =
        await ProfileDetailsRepository.getUserDetails(token.toString());

        if (response != null) {
          emit(DetailsLoadedState(response.name, response.email));

        } else {
          emit(DetailsLoadingErrorState('Error Loading Details'));
        }
      }catch (e){
        emit(DetailsLoadingErrorState('Error Loading Details'));
      }
    });

  }

  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();

    final token =  prefs.getString('token');
    print(token.toString());
    return token!;
  }
}
