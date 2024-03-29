import 'package:flutter/material.dart';
import 'package:pet_shop_app/providers/cart_provider.dart';
import 'package:pet_shop_app/screens/pet_detail_screen.dart';
import 'package:pet_shop_app/widgets/navbar.dart';
import 'package:provider/provider.dart';
import '../providers/pet_provider.dart';
import '../widgets/pet_card.dart'; // Assuming you have a PetCard widget
import '../utils/routes.dart'; // Make sure you have the routes defined

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the pet data from the PetProvider
    final petData = Provider.of<PetProvider>(context);
    final pets = petData.pets;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Store',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 26)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Product or Brand',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: pets.length,
              itemBuilder: (ctx, i) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.petDetailScreen,
                    arguments: pets[i],
                  );
                },
                child: PetCard(
                  pet: pets[i],
                  onAddToCart: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addToCart(pets[i]);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${pets[i].name} added to cart!'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),
        ],
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
}
