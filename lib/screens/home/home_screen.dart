import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/bloc/home_bloc.dart';

import 'components/categories.dart';
import 'components/discount_banner.dart';
import 'components/home_header.dart';
import 'components/popular_product.dart';
import 'components/special_offers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(FetchPopularProductsEvent()),
      child: Scaffold(
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is PopularProductsLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PopularProductsSuccessState) {
              return SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      HomeHeader(),
                      DiscountBanner(),
                      Categories(categoryList: state.categoriesList,),
                      SpecialOffers(),
                      SizedBox(height: 20),
                      PopularProducts(
                        productsList: state.productsList,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            }
            else if(state is PopularsProductsFailedState){
              return Center(
                child: Text(state.error),
              );
            }
            else{
              return Container(
                child: Text('I',style: TextStyle(color: Colors.black),),
              );
            }


          },
        ),
      ),
    );
  }
}
