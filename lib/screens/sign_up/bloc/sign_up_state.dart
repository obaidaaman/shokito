part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}


final class SignUpLoading extends SignUpState{

}

final class SignUpLoaded extends SignUpState{

}

final class SignUpError extends SignUpState{
  final String error;

  SignUpError(this.error);


 }

 final class TextFieldValidState extends SignUpState{

 }

 final class TextFieldInvalidState extends SignUpState{

  final String error;

  TextFieldInvalidState({required this.error});


}