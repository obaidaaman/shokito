part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}


final class FetchPopularProductsEvent extends HomeEvent{

}

final class FetchAllProductsEvent extends HomeEvent{

}

final class FetchAllCategoriesEvent extends HomeEvent{

}