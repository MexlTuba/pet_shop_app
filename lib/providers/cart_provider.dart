import 'package:flutter/material.dart';
import 'package:pet_shop_app/models/pet.dart';

class CartProvider with ChangeNotifier {
  Map<String, Pet> _items = {};

  Map<String, Pet> get items => _items;

  void addToCart(Pet pet) {
    if (_items.containsKey(pet.id)) {
      // update the quantity if needed
    } else {
      _items.putIfAbsent(pet.id, () => pet);
    }
    notifyListeners();
  }
}
