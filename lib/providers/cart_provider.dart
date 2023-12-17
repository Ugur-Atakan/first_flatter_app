import 'package:flutter/material.dart';
import 'package:htppapp/models/product_model.dart';

class CartProvider with ChangeNotifier {

  Map<Product, int> items = {};

  List<Product> get getCart => items.keys.toList();

  Map<Product, int> get getCartWithQuantity => Map.from(items);

  void addToCart(Product product) {
    if (items.containsKey(product)) {
      // Eğer ürün zaten sepette ise miktarını arttır
      items[product] = items[product]! + 1;
    } else {
      // Eğer ürün sepette değilse, yeni bir öğe olarak ekle
      items[product] = 1;
    }

    notifyListeners();
  }

  void removeFromCart(Product product) {
    if (items.containsKey(product)) {
      // Eğer ürün sepette ise miktarını azalt
      items[product] = items[product]! - 1;

      // Eğer miktar 0'a düştüyse ürünü sepette tamamen kaldır
      if (items[product] == 0) {
        items.remove(product);
      }

      notifyListeners();
    }
  }

  void deleteItemfromCart(Product product) {
    items.remove(product);
    notifyListeners();
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }
}
