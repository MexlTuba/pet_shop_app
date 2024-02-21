import 'package:flutter/material.dart';
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
                  // Navigate to the PetDetail screen with the selected pet
                  Navigator.pushNamed(context, Routes.petDetailScreen,
                      arguments: pets[i]);
                },
                child: PetCard(
                  pet: pets[i],
                  onAddToCart: () {
                    // TODO: Implement add to cart functionality
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
      // Placeholder for the nav bar, to be replaced with the actual NavBar widget
      bottomNavigationBar: Container(
        color: Colors.grey[200],
        height: 60,
        child: Center(child: Text('NavBar placeholder')),
      ),
    );
  }
}
