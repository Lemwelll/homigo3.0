import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homigo/screens/landlord/landlord_dashboard_screen.dart';
import 'package:homigo/screens/landlord/property_management_screen.dart';
import 'package:homigo/screens/landlord/landlord_account_screen.dart';
import '../../theme/app_theme.dart';

class LandlordHomeScreen extends StatefulWidget {
  const LandlordHomeScreen({super.key});

  @override
  State<LandlordHomeScreen> createState() => _LandlordHomeScreenState();
}

class _LandlordHomeScreenState extends State<LandlordHomeScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  final List<Widget> _screens = [
    const LandlordDashboardScreen(),
    const PropertyManagementScreen(),
    const LandlordAccountScreen(),
  ];

  final List<IconData> _unselectedIcons = [
    Icons.dashboard_outlined,
    Icons.home_work_outlined,
    Icons.person_outline,
  ];

  final List<IconData> _selectedIcons = [
    Icons.dashboard_rounded,
    Icons.home_work_rounded,
    Icons.person_rounded,
  ];

  final List<String> _labels = [
    'Dashboard',
    'Properties',
    'Account',
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    if (index != _currentIndex) {
      // Haptic feedback for better user experience
      HapticFeedback.lightImpact();
      
      // Animation for tab selection
      _animationController.forward().then((_) {
        setState(() {
          _currentIndex = index;
        });
        _animationController.reverse();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: IndexedStack(
              index: _currentIndex,
              children: _screens,
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: _onTabTapped,
            backgroundColor: Colors.transparent,
            elevation: 0,
            height: 75,
            indicatorColor: AppTheme.primaryColor.withOpacity(0.1),
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            destinations: List.generate(3, (index) {
              final isSelected = _currentIndex == index;
              return NavigationDestination(
                icon: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? AppTheme.primaryColor.withOpacity(0.15)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    isSelected ? _selectedIcons[index] : _unselectedIcons[index],
                    color: isSelected 
                        ? AppTheme.primaryColor 
                        : Colors.grey[600],
                    size: 24,
                  ),
                ),
                selectedIcon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _selectedIcons[index],
                    color: AppTheme.primaryColor,
                    size: 24,
                  ),
                ),
                label: _labels[index],
              );
            }),
          ),
        ),
      ),
    );
  }
}