import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pet_provider.dart';
import '../widgets/pet_card.dart'; // Assuming you have a PetCard widget

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the pet data from the PetProvider
    final petData = Provider.of<PetProvider>(context);
    final pets = petData.pets;

    return Scaffold(
      appBar: AppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headline1),
        backgroundColor: Colors.transparent, // Assuming a transparent app bar
        elevation: 0,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: pets.length,
        itemBuilder: (ctx, i) => PetCard(
            pet: pets[i]), // PetCard is a custom widget for displaying each pet
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          childAspectRatio: 3 / 2, // Aspect ratio of each grid card
          crossAxisSpacing: 10, // Horizontal space between cards
          mainAxisSpacing: 10, // Vertical space between cards
        ),
      ),
      // Placeholder for the nav bar, to be replaced with the actual NavBar widget
      bottomNavigationBar: Container(
        color: Colors.grey[200], // Temporary color for the placeholder
        height: 60, // Temporary height for the placeholder
        child: Center(child: Text('NavBar placeholder')),
      ),
    );
  }
}
