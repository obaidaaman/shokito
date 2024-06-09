part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}



final class DetailsLoadedState extends ProfileState{

  final String name;
  final String email;

  DetailsLoadedState(this.name, this.email);

}

final class DetailsLoadingState extends ProfileState{

}

final class DetailsLoadingErrorState extends ProfileState{
final String error;

  DetailsLoadingErrorState(this.error);

}


final class NotificationNavigateEvent extends ProfileState{

}

final class SettingNavigateEvent extends ProfileState{

}
final class LogOutNavigateEvent extends ProfileState{

}