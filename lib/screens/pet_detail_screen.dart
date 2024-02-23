import 'package:flutter/material.dart';
import 'package:pet_shop_app/utils/routes.dart';
import 'package:provider/provider.dart';
import '../models/pet.dart';
import '../widgets/navbar.dart';
import 'package:pet_shop_app/providers/cart_provider.dart';

class PetDetailScreen extends StatelessWidget {
  final Pet pet;

  PetDetailScreen({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {
              // TODO: Implement share functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              // TODO: Implement favorite functionality
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              pet.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pet.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: Colors.black),
                  ),
                  Text(
                    '${pet.location} · ${pet.distance}',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'About ${pet.breed}',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _InfoChip(label: 'Weight', value: '${pet.weight} kg'),
                      _InfoChip(label: 'Height', value: '${pet.height} cm'),
                      _InfoChip(label: 'Color', value: pet.color),
                    ],
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Access your CartProvider and call the method to add the pet to the cart
                        Provider.of<CartProvider>(context, listen: false)
                            .addToCart(pet);

                        // Show a confirmation message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${pet.name} added to cart!'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      icon: Icon(Icons.add_shopping_cart, size: 24),
                      label: Text('Add to Cart'),
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context)
                            .colorScheme
                            .secondary, // Use the accent color from your theme
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: 1, // Assuming 'Catalog' is the second item
        onItemSelected: (index) {
          if (index == 1) {
            // Catalog is already selected, do nothing
          } else if (index == 2) {
            // Navigate to the Cart screen
            Navigator.pushNamed(context, Routes.cartScreen);
          }
          // Implement navigation logic for other indices if needed
        },
      ),
    );
  }

  Widget _InfoChip({required String label, required String value}) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.green[200],
        child: Text(label[0].toUpperCase()),
      ),
      label: Text(
        '$label: $value',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.green[50],
      elevation: 4.0,
      shadowColor: Colors.grey[50],
      padding: EdgeInsets.all(8.0),
    );
  }
}
