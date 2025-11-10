import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'browse_listings_screen.dart';
import 'favorites_screen.dart';
import 'renter_account_screen.dart';

class RenterHomeScreen extends StatefulWidget {
  const RenterHomeScreen({super.key});

  @override
  State<RenterHomeScreen> createState() => _RenterHomeScreenState();
}

class _RenterHomeScreenState extends State<RenterHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const BrowseListingsScreen(),
    const FavoritesScreen(),
    const RenterAccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.white,
          elevation: 0,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.search),
              selectedIcon: Icon(
                Icons.search,
                color: AppTheme.primaryColor,
              ),
              label: 'Browse',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_border),
              selectedIcon: Icon(
                Icons.favorite,
                color: AppTheme.primaryColor,
              ),
              label: 'Favorites',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(
                Icons.person,
                color: AppTheme.primaryColor,
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}