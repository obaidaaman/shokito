import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/product_card.dart';
import '../../../models/Product.dart';
import '../../../models/product_model.dart';
import '../../details/details_screen.dart';
import '../../products/products_screen.dart';
import '../bloc/home_bloc.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {

  final List<ProductModel> productsList;

  const PopularProducts({super.key, required this.productsList});


  @override
  Widget build(BuildContext context) {

    return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SectionTitle(
                  title: "Popular Products",
                  press: () {
                    Navigator.pushNamed(context, ProductsScreen.routeName);
                  },
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      productsList.length,
                          (index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: ProductCard(
                              product: productsList[index],
                              onPress: () =>
                                  Navigator.pushNamed(
                                    context,
                                    DetailsScreen.routeName,
                                    arguments: ProductDetailsArguments(
                                        product: productsList[index]),
                                  ),
                            ),
                          );


                         // here by default width and height is 0
                      },
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              )
            ],
          );


  }
}
