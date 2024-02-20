import 'package:flutter/foundation.dart';
import 'package:pet_shop_app/models/pet.dart';

class Cart with ChangeNotifier {
  Map<String, Pet> _items = {};

  Map<String, Pet> get items => {..._items};

  void addItem(Pet pet) {
    if (_items.containsKey(pet.id)) {
      // If the item already exists, you might increase the quantity or handle accordingly
    } else {
      _items.putIfAbsent(pet.id, () => pet);
    }
    notifyListeners();
  }

  // Additional cart functionality...
}
