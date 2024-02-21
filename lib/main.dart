import 'package:flutter/material.dart';
import 'package:pet_shop_app/models/pet.dart';
import 'package:pet_shop_app/utils/routes.dart';
import 'package:provider/provider.dart';
import 'providers/pet_provider.dart';
import 'providers/cart_provider.dart';
import 'theme.dart';
import 'screens/splash_screen.dart';
import 'screens/catalog_screen.dart';
import 'screens/pet_detail_screen.dart';
import 'screens/cart_screen.dart'; // Import the screens

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => PetProvider()),
          ChangeNotifierProvider(create: (ctx) => CartProvider()),
        ],
        child: MaterialApp(
          title: 'Pet Shop App',
          theme: appTheme,
          initialRoute: Routes.splashScreen,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case Routes.splashScreen:
                return MaterialPageRoute(builder: (_) => SplashScreen());
              case Routes.catalogScreen:
                return MaterialPageRoute(builder: (_) => CatalogScreen());
              case Routes.petDetailScreen:
                final pet = settings.arguments as Pet;
                return MaterialPageRoute(
                  builder: (_) => PetDetailScreen(pet: pet),
                );
              // Define other routes as needed
            }
          },
          // You can comment out or remove the direct routes map if using onGenerateRoute
          // routes: {
          //   Routes.splashScreen: (ctx) => SplashScreen(),
          //   Routes.catalogScreen: (ctx) => CatalogScreen(),
          //   // Other routes...
          // },
        ));
  }
}
