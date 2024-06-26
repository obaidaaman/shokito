part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}


final class PopularProductsSuccessState extends HomeState{
  final List<ProductModel> productsList;
  final List<CategoriesModel> categoriesList;

  PopularProductsSuccessState(this.productsList, this.categoriesList);
}
final class PopularProductsLoadingState extends HomeState{

}

final class PopularsProductsFailedState extends HomeState{

  final String error;

  PopularsProductsFailedState(this.error);
}