import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/home/bloc/home_bloc.dart';

import '../details/details_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  static String routeName = "/products";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(FetchAllProductsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is PopularProductsLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PopularProductsSuccessState) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                      itemCount: state.productsList.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: state.productsList[index],
                          onPress: () => Navigator.pushNamed(
                            context,
                            DetailsScreen.routeName,
                            arguments: ProductDetailsArguments(
                                product: state.productsList[index]),
                          ),
                        );
                      }),
                ),
              );
            }
            else{
              return Container(
                width: 20,
                height: 20,
                color: Colors.green,
              );
            }
          },
        ),
      ),
    );
  }
}
