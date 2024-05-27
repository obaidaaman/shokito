part of 'log_in_bloc.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}


final class TextChangeValidState extends LogInState {
}

final class TextChangeInvalidState extends LogInState{
  final String errorMessage;

  TextChangeInvalidState(this.errorMessage);
}

final class LogInSuccessState extends LogInState{

}
final class LogInErrorState extends LogInState{
  final String error;

  LogInErrorState(this.error);

}
final class LogInLoadingState extends LogInState{

}
