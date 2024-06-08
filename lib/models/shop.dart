import 'package:flutter/material.dart';
import 'package:minimalecomute/models/product.dart';

class Shop extends ChangeNotifier {
  //products for sale

  final List<Product> _shop = [
    Product(
        name: 'Product 1', price: 24.00, description: 'product description'),
    Product(
        name: 'Product 1', price: 24.00, description: 'product description'),
    Product(
        name: 'Product 1', price: 24.00, description: 'product description'),
    Product(
        name: 'Product 1', price: 24.00, description: 'product description'),
  ];

  //user cart

  List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeToCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
