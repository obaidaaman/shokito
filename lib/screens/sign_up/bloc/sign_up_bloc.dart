import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';

import '../../../constants.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<TextFieldChangeEvent>(textFieldChangeEvent);
  }

  FutureOr<void> textFieldChangeEvent(
      TextFieldChangeEvent event, Emitter<SignUpState> emit) {
    if (event.email.isNotEmpty && event.password.isNotEmpty) {
      if (EmailValidator.validate(event.email)) {
        emit(TextFieldValidState());
      } else {
        emit(TextFieldInvalidState(
            error: 'Please Enter a valid email and password'));
      }
    }
  }
}
