// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import '../models/pet.dart';

class PetProvider with ChangeNotifier {
  List<Pet> _pets = [
    Pet(
        id: '1',
        name: 'Persian Cat',
        breed: 'Persian',
        price: 185.0,
        location: 'Cebu',
        distance: '5km',
        weight: 3.5,
        height: 20,
        color: 'White',
        imageUrl: 'assets/images/Persian.png'),
    Pet(
        id: '2',
        name: 'Sphinx Cat',
        breed: 'Sphinx',
        price: 620.0,
        location: 'Tambuli',
        distance: '50km',
        weight: 30.5,
        height: 200,
        color: 'Red',
        imageUrl: 'assets/images/Sphinx.png'),
    Pet(
        id: '3',
        name: 'Bengal Cat',
        breed: 'Bengal',
        price: 895.0,
        location: 'Valenzuela',
        distance: '599km',
        weight: 33.5,
        height: 2890,
        color: 'Orange',
        imageUrl: 'assets/images/Bengal.png'),
    Pet(
        id: '4',
        name: 'Abyssinian Cat',
        breed: 'Abyssinian',
        price: 770.0,
        location: 'Queens',
        distance: '555km',
        weight: 344.5,
        height: 203,
        color: 'Yellow',
        imageUrl: 'assets/images/Abyssinian.png'),
    Pet(
        id: '5',
        name: 'Burmese Cat',
        breed: 'Burmese',
        price: 285.0,
        location: 'Zapatera',
        distance: '55km',
        weight: 31.5,
        height: 860,
        color: 'Green',
        imageUrl: 'assets/images/Burmese.png'),
    Pet(
        id: '6',
        name: 'Russian Blue Cat',
        breed: 'Russian Blue',
        price: 160.0,
        location: 'Escario',
        distance: '15km',
        weight: 43.5,
        height: 210,
        color: 'Blue',
        imageUrl: 'assets/images/Russian.png'),
  ];

  List<Pet> get pets => [..._pets];
}
