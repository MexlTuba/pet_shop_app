import 'package:flutter/material.dart';
import 'package:pet_shop_app/models/pet.dart';
import 'package:pet_shop_app/utils/routes.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/navbar.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final petsInCart = cartProvider.items.values.toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Cart',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 26)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: cartProvider.items.isEmpty
          ? Center(
              child: Text('Your cart is empty'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.items.length,
                    itemBuilder: (ctx, i) {
                      Pet pet = petsInCart[i];
                      return ListTile(
                        leading: Image.asset(pet.imageUrl),
                        title: Text(pet.name),
                        subtitle: Text('\$${pet.price}'),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_shopping_cart),
                          onPressed: () {
                            cartProvider.removeFromCart(pet.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${pet.name} removed from cart!'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(20),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Chip(
                          label: Text(
                            '\$${cartProvider.totalAmount.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .headline6
                                  ?.color,
                            ),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO: Implement checkout functionality
                          },
                          child: Text('CHECKOUT'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
      bottomNavigationBar: NavBar(
        selectedIndex: 2,
        onItemSelected: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, Routes.catalogScreen);
          } else if (index == 2) {}
        },
      ),
    );
  }
}
