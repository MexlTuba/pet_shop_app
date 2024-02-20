// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pet_shop_app/theme.dart'; // make sure to import your theme.dart
import 'package:pet_shop_app/utils/routes.dart'; // and your routes.dart

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                Image.asset('assets/images/splashCat.png', fit: BoxFit.cover),
                Image.asset('assets/images/splashCat2.png', fit: BoxFit.cover),
                Image.asset('assets/images/splashCat3.png', fit: BoxFit.cover),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(3, (int index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 8,
                      width: _currentPage == index ? 24 : 8,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: _currentPage == index
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.primary
                          // .withOpacity(0.5),
                          ),
                    );
                  }),
                ),
                SizedBox(height: 26.27),
                Text(
                  'Your One-Stop Pet Shop Experience!',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge, // defined in theme.dart
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'Connect with 5-star pet caregivers near you who offer boarding, walking, house sitting or day care.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context,
                                Routes
                                    .catalogScreen); // assuming this is the next screen
                          },
                          child: Text('Get Started',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).secondaryHeaderColor)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context)
                                .primaryColor, // use your theme's primary color
                            padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 12),
                            textStyle: TextStyle(
                              fontSize: 17.51,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
