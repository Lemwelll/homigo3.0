import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'screens/landing_page.dart';
import 'screens/auth/renter_login_screen.dart';
import 'screens/auth/renter_signup_screen.dart';
import 'screens/auth/landlord_login_screen.dart';
import 'screens/auth/landlord_signup_screen.dart';
import 'screens/landlord/landlord_home_screen.dart';
import 'screens/renter/renter_home_screen.dart';
import 'screens/public/property_listings_screen.dart';
import 'screens/public/about_us_screen.dart';
import 'screens/public/how_it_works_screen.dart';
import 'screens/landlord/notification_settings_screen.dart';
import 'screens/landlord/privacy_security_settings_screen.dart';
import 'screens/landlord/help_support_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const LandingPage(),
        ),
        GoRoute(
          path: '/renter/login',
          builder: (context, state) => const RenterLoginScreen(),
        ),
        GoRoute(
          path: '/renter/signup',
          builder: (context, state) => const RenterSignupScreen(),
        ),
        GoRoute(
          path: '/landlord/login',
          builder: (context, state) => const LandlordLoginScreen(),
        ),
        GoRoute(
          path: '/landlord/signup',
          builder: (context, state) => const LandlordSignupScreen(),
        ),
        GoRoute(
          path: '/renter/home',
          builder: (context, state) => const RenterHomeScreen(),
        ),
        GoRoute(
          path: '/landlord/home',
          builder: (context, state) => const LandlordHomeScreen(),
        ),
        GoRoute(
          path: '/properties',
          builder: (context, state) => const PropertyListingsScreen(),
        ),
        GoRoute(
          path: '/about',
          builder: (context, state) => const AboutUsScreen(),
        ),
        GoRoute(
          path: '/how-it-works',
          builder: (context, state) => const HowItWorksScreen(),
        ),
        GoRoute(
          path: '/landlord/notification-settings',
          builder: (context, state) => const NotificationSettingsScreen(),
        ),
        GoRoute(
          path: '/landlord/privacy-security-settings',
          builder: (context, state) => const PrivacySecuritySettingsScreen(),
        ),
        GoRoute(
          path: '/landlord/help-support',
          builder: (context, state) => const HelpSupportScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Homigo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
