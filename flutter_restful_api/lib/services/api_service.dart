import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // GET REQUEST
  Future getAllPosts() async {
    final allProductUrl = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(allProductUrl);

    if (kDebugMode) {
      print(response.statusCode);
      print(response.body);
    }

    return json.decode(response.body);
  }

  Future getSingleProduct(int id) async {
    final singleProductUrl = Uri.parse("https://fakestoreapi.com/products/$id");
    final response = await http.get(singleProductUrl);

    if (kDebugMode) {
      print(response.statusCode);
      print(response.body);
    }

    return json.decode(response.body);
  }

  Future getAllCategory() async {
    final allCategoryUrl =
        Uri.parse("https://fakestoreapi.com/products/categories");
    final response = await http.get(allCategoryUrl);

    if (kDebugMode) {
      print(response.statusCode);
      print(response.body);
    }

    return json.decode(response.body);
  }

  Future getProductByCategory(String catName) async {
    final fetchProductCategoryUrl =
        Uri.parse("https://fakestoreapi.com/products/category/$catName");
    final response = await http.get(fetchProductCategoryUrl);

    if (kDebugMode) {
      print(response.statusCode);
      print(response.body);
    }

    return json.decode(response.body);
  }

  Future getCart(String userId) async {
    final fetchCartProducts =
        Uri.parse("https://fakestoreapi.com/carts/$userId");
    final response = await http.get(fetchCartProducts);

    if (kDebugMode) {
      print(response.statusCode);
      print(response.body);
    }

    return json.decode(response.body);
  }

  // POST REQUEST
  Future userLogin(String username, String password) async {
    final loginUrl = Uri.parse("https://fakestoreapi.com/auth/login");
    final response = await http
        .post(loginUrl, body: {'username': username, 'password': password});

    if (kDebugMode) {
      print(response.statusCode);
      print(response.body);
    }

    return json.decode(response.body);
  }
}
