import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/screens/sign_in/repo/LogInRepo.dart';


part 'log_in_event.dart';

part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(LogInInitial()) {
    on<SignInButtonClickedEvent>(signInButtonClicked);
  }

  FutureOr<void> signInButtonClicked(SignInButtonClickedEvent event,
      Emitter<LogInState> emit) async {
    emit(LogInLoadingState());
    final response = await LogInRepo.LogIn(event.username, event.password);
    final token = response;

    if (token != null) {
      _storeToken(token);
      print('bearer token is: $token');
      emit(LogInSuccessState());
    }
    else{
    emit(LogInErrorState('Error occured! Enter correct details'));
    }
  }




  Future<void> _storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();

    token = token.trim();
    await prefs.setString('token', token);
  }
}
