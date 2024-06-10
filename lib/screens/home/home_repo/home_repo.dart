import 'dart:convert';

import '../../../models/category_model.dart';
import '../../../models/product_model.dart';

import 'package:http/http.dart' as http;

class HomeRepo {
  final uriPagination =
      Uri.parse('https://api.escuelajs.co/api/v1/products?offset=0&limit=4');
  final uri = Uri.parse('https://api.escuelajs.co/api/v1/products');

  Future<List<ProductModel>> popularProducts() async {
    final response = await http.get(uriPagination);

    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      print("error: ${response.statusCode}");
      print("error: ${response.body}");
      print('returned empty list');
      return [];
    }
  }

  Future<List<ProductModel>> allProducts() async {
    final response = await http.get(uri);

    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      print("error: ${response.statusCode}");
      print("error: ${response.body}");
      print('returned empty list');
      return [];
    }
  }

  Future<List<CategoriesModel>> fetchCategories() async {
    final uri = Uri.parse('https://api.escuelajs.co/api/v1/categories?offset=0&limit=5');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final categoryList = categoriesFromJson(response.body);
      return categoryList;
    } else {
      print('Error in response : ${response.statusCode}');
      print('Error in Detail : ${response.body}');
      print('Returned empty list');
      return [];
    }
  }
}
