import 'package:flutter/material.dart';
import 'package:pet_shop_app/utils/routes.dart';
import 'package:provider/provider.dart';
import '../models/pet.dart';
import '../widgets/navbar.dart'; // Make sure to import your NavBar widget
import 'package:pet_shop_app/providers/cart_provider.dart';

class PetDetailScreen extends StatelessWidget {
  final Pet pet;

  PetDetailScreen({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle attributeLabelStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.grey[800],
    );

    // Define the text style for the pet attribute values
    TextStyle attributeValueStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.secondary,
    );

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
            Image.asset(
              pet.imageUrl,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height *
                  0.4, // Image takes 40% of screen height
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pet.name,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${pet.location} · ${pet.distance}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'About ${pet.breed}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _AttributeCard(
                        attribute: 'Weight',
                        value: '${pet.weight} kg',
                        labelStyle: attributeLabelStyle,
                        valueStyle: attributeValueStyle,
                      ),
                      _AttributeCard(
                        attribute: 'Height',
                        value: '${pet.height} cm',
                        labelStyle: attributeLabelStyle,
                        valueStyle: attributeValueStyle,
                      ),
                      _AttributeCard(
                        attribute: 'Color',
                        value: pet.color,
                        labelStyle: attributeLabelStyle,
                        valueStyle: attributeValueStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
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
        selectedIndex: 1,
        onItemSelected: (index) {
          if (index == 1) {
          } else if (index == 2) {
            Navigator.pushNamed(context, Routes.cartScreen);
          }
        },
      ),
    );
  }

  Widget _AttributeCard(
      {required String attribute,
      required String value,
      required TextStyle labelStyle,
      required TextStyle valueStyle}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(attribute, style: labelStyle),
          Text(value, style: valueStyle),
        ],
      ),
    );
  }
}
