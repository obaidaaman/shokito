part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}


final class GetUserEvent extends ProfileEvent{

}

final class SettingsButtonClickedEvent extends ProfileEvent{

}


final class LogOutButtonClickedEvent extends ProfileEvent{

}

final class NotificationsButtonClickedEvent extends ProfileEvent{

}
