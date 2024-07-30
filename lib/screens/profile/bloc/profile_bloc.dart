import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/screens/profile/model/profile_model.dart';
import 'package:shop_app/screens/profile/repository/profile_details_repo.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetUserEvent>((event, emit) async {
      if (state is DetailsLoadedState) {
        // If details are already loaded, do nothing
        return;
      }
      emit(DetailsLoadingState());
      try {
        final response = await ProfileDetailsRepository.getUserDetails();

        if (response != null) {
          _storeToken(response);
          emit(DetailsLoadedState(
              '${response.name.firstname} ${response.name.lastname}',
              response.email));
        } else {
          emit(DetailsLoadingErrorState('Error Loading Details'));
        }
      } catch (e) {
        emit(DetailsLoadingErrorState(e.toString()));
      }
    });
  }

  Future<void> _storeToken(ProfileModel response) async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.setString(
        'details', '${response.name.firstname} ${response.name.lastname}');
    print(token.toString());
  }
}
