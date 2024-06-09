import 'dart:convert';

import '../../../models/product_model.dart';

import 'package:http/http.dart' as  http;
class HomeRepo{


  final uri = Uri.parse('https://api.escuelajs.co/api/v1/products?offset=0&limit=4');


  Future<List<ProductModel>> allProducts() async{

    final response =  await http.get(uri);


      if(response.statusCode == 200 || response.statusCode == 201){

          List<dynamic> data = json.decode(response.body);
          return data.map((item) => ProductModel.fromJson(item)).toList();

      }
      else{
        print("error: ${response.statusCode}");
        print("error: ${response.body}");
        print('returned empty list');
        return [];
      }




  }
}