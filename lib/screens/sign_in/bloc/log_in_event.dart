part of 'log_in_bloc.dart';

@immutable
sealed class LogInEvent {}

class TextChangedEvent extends LogInEvent{

  final String email;
  final String password;

  TextChangedEvent(this.email, this.password);
}

class ContinueButtonClickedEvent extends LogInEvent{

}


class ForgotPasswordTextClickedEvent extends LogInEvent{

}

class GoogleButtonClickedEvent extends LogInEvent{

}

class TwitterButtonClickedEvent extends LogInEvent{

}
class FacebookButtonClickedEvent extends LogInEvent{

}

class SignInButtonClickedEvent extends LogInEvent{


  final String username;
  final String password;

  SignInButtonClickedEvent(this.username, this.password);
}