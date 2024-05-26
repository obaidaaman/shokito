import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/models/sign_up.dart';
import 'package:shop_app/screens/sign_in/repo/LogInRepo.dart';
import 'package:shop_app/screens/sign_up/bloc/sign_up_bloc.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(LogInInitial()) {
    on<SignInButtonClickedEvent>(signInButtonClicked);
  }






  FutureOr<void> signInButtonClicked(SignInButtonClickedEvent event, Emitter<LogInState> emit) async {

    emit(LogInLoadingState());
    final response = await LogInRepo.LogIn(event.username, event.password);
    final token = response;
    final response2 = await LogInRepo.getCurrentUser(token.toString());
    print(response2);
    emit(LogInSuccessState(response2!));

  }
}
