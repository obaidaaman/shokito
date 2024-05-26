part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}


class TextFieldChangeEvent extends SignUpEvent{

  final String email;
  final String password;


  TextFieldChangeEvent( this.email, this.password);
}

class SignUpButtonClickedEvent extends SignUpEvent{

  final String name;
  final String email;
  final String password;
  final String address;

  SignUpButtonClickedEvent(this.name, this.email, this.password, this.address);
}

