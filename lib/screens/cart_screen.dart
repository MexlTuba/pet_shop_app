import 'package:flutter/material.dart';
import 'package:pet_shop_app/utils/routes.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/navbar.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This would be your CartProvider where you get the cart items and total
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
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
                    itemBuilder: (ctx, i) => ListTile(
                      leading: Image.asset(
                          cartProvider.items.values.toList()[i].imageUrl),
                      title: Text(cartProvider.items.values.toList()[i].name),
                      subtitle: Text(
                          '\$${cartProvider.items.values.toList()[i].price}'),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_shopping_cart),
                        onPressed: () {
                          // TODO: Implement remove from cart functionality
                        },
                      ),
                    ),
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
        selectedIndex: 2, // Assuming 'Cart' is the third item
        onItemSelected: (index) {
          if (index == 1) {
            // Navigate back to the Catalog screen
            Navigator.pushNamed(context, Routes.catalogScreen);
          } else if (index == 2) {
            // Cart is already selected, do nothing
          }
          // Implement navigation logic for other indices if needed
        },
      ),
    );
  }
}
