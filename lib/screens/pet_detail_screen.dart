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
      backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 3 / 2,
              child: Image.asset(
                pet.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pet.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${pet.location} · ${pet.distance}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'About ${pet.breed}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8, // Horizontal space between chips
                    runSpacing: 8, // Vertical space between chips
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
                        Provider.of<CartProvider>(context, listen: false)
                            .addToCart(pet);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${pet.name} added to cart!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: Icon(Icons.add_shopping_cart, size: 24),
                      label: Text('Add to Cart'),
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).colorScheme.secondary,
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
      label: Text('$label: $value', style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.green[50],
      elevation: 4.0,
      shadowColor: Colors.grey[50],
      padding: EdgeInsets.all(8.0),
    );
  }
}
