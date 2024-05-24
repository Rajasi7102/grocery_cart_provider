// ignore_for_file: prefer_final_fields, file_names

import 'package:flutter/material.dart';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _availProducts = [
    Product(
        id: '1',
        title: 'Sugar',
        description: "it's a Sugar",
        image: 'assets/images/sugar.jpg',
        price: 42),
    Product(
        id: '2',
        title: 'Eggs',
        description: "it's a Eggs",
        image: 'assets/images/Eggs.jpg',
        price: 10),
    Product(
        id: '3',
        title: 'Fruits Basket',
        description: "it's a Fruit Basket",
        image: 'assets/images/fruitbasket.jpg',
        price: 200),
    Product(
        id: '4',
        title: 'Bread',
        description: "it's a Bread",
        image: 'assets/images/bread.jpg',
        price: 40),
    Product(
        id: '5',
        title: 'Fish',
        description: "it's a Fish",
        image: 'assets/images/fishes.jpg',
        price: 500),
    Product(
        id: '6',
        title: 'Meat',
        description: "it's a Meat",
        image: 'assets/images/meat.jpg',
        price: 800),
    Product(
        id: '6',
        title: 'Onion',
        description: "it's a onion",
        image: 'assets/images/onion.jpg',
        price: 40),
   Product(
        id: '7',
        title: 'Bottle',
        description: "it's a Bottle",
        image: 'assets/images/bottol.jpg',
        price: 30),
        

        


  ];

  List<Product> get favoriteProducts {
    return _availProducts.where((product) => product.isFavorite).toList();
  }

  List<Product> get availProducts => _availProducts;

  Product findById(String id) {
    return _availProducts.firstWhere((product) => product.id == id);
  }
}
