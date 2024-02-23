import 'package:flutter/material.dart';
import 'package:pet_shop_app/models/pet.dart';

class CartProvider with ChangeNotifier {
  Map<String, Pet> _items = {};

  Map<String, Pet> get items => _items;

  // Calculate the total amount
  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, pet) {
      total += pet.price;
    });
    return total;
  }

  void addToCart(Pet pet) {
    if (_items.containsKey(pet.id)) {
      // update the quantity if needed
    } else {
      _items.putIfAbsent(pet.id, () => pet);
    }
    notifyListeners();
  }

  // Implement a method to remove an item from the cart
  void removeFromCart(String petId) {
    _items.remove(petId);
    notifyListeners();
  }
}
