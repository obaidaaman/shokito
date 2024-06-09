import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/screens/home/components/popular_product.dart';
import 'package:shop_app/screens/home/home_repo/home_repo.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchPopularProductsEvent>(fetchPopularProducts);
  }

  FutureOr<void> fetchPopularProducts(
      FetchPopularProductsEvent event, Emitter<HomeState> emit) async {
    emit(PopularProductsLoadingState());

      try{
        final List<ProductModel> productsList = await HomeRepo().allProducts();

        if (productsList.isNotEmpty) {
          print('productList is not Empty'
          );
          emit(PopularProductsSuccessState(productsList));
        } else {
          emit(PopularsProductsFailedState('The list is empty'));
        }
      }
      catch(error){
        emit(PopularsProductsFailedState('Error fetching products from api'));
      }


  }
}
