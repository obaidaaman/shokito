import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/screens/sign_up/repo/SignUpRepo.dart';

import '../../../constants.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<TextFieldChangeEvent>(textFieldChangeEvent);
    on<SignUpButtonClickedEvent>(signUpButtonClicked);
  }

  FutureOr<void> textFieldChangeEvent(
      TextFieldChangeEvent event, Emitter<SignUpState> emit) {
    if (event.email.isNotEmpty || event.password.isNotEmpty) {
      if (EmailValidator.validate(event.email)) {
        emit(TextFieldValidState());
      } else {
        emit(TextFieldInvalidState(
            error: 'Please Enter a valid email and password'));
      }
    }
  }

  FutureOr<void> signUpButtonClicked(
      SignUpButtonClickedEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());

    try {
    var response =   await Signuprepo.signUpUser(event.name, event.email, event.password);
      emit(SignUpSubmitted(id: response?.id.toString()));
    } catch (e) {
      print('api error');
    }
  }
}
