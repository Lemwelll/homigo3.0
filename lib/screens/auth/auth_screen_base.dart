import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/app_theme.dart';

class AuthScreenBase extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;
  final bool isRenter;

  const AuthScreenBase({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children,
    required this.isRenter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              AppTheme.primaryColor.withOpacity(0.1),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(12),
                  ),
                ).animate().fadeIn().slideX(begin: -1),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Icon(
                      isRenter ? Icons.search_rounded : Icons.home_work_rounded,
                      size: 32,
                      color: AppTheme.primaryColor,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: AppTheme.headingStyle,
                    ),
                  ],
                ).animate().fadeIn().slideX(),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: AppTheme.subheadingStyle,
                ).animate().fadeIn().slideX(delay: 200.ms),
                const SizedBox(height: 32),
                ...children.animate(interval: 200.ms).fadeIn().slideY(begin: 0.2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}