import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/category_model.dart';

class Categories extends StatelessWidget {
  final List<CategoriesModel> categoryList;

  const Categories({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {

    return  CategoriesProducts(categories: categoryList);
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFFFECDF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image(
              image: NetworkImage(icon),
            ),
          ),
          const SizedBox(height: 4),
          Text(text, textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
    this.textColor = Colors.black,
    this.backgroundColor,
  });

  final String title, image;

  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(right: 14),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(100),
              ),
              child: Image(
                image: NetworkImage(image),
                fit: BoxFit.cover,

              ),
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoriesProducts extends StatelessWidget {

  final List<CategoriesModel> categories;
  const CategoriesProducts({
    super.key, required this.categories
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return VerticalImageText(
            image: categories[index].image,
            title: categories[index].name,
            onTap: () {},
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}
