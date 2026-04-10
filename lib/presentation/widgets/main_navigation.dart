import 'package:flutter/material.dart';
import 'package:easply/presentation/pages/home/home_page.dart';
import 'package:easply/presentation/pages/letter_page.dart';
import 'package:easply/presentation/pages/tools/tools_page.dart';
import 'package:easply/presentation/pages/profile/profile_page.dart';
import 'package:easply/core/theme/app_colors.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    LetterPage(),
    ToolsPage(),
    ProfilePage(),
  ];

  void _onTap(int index) {
    setState(() => _currentIndex = index);
  }

  Widget _navItem({required IconData icon, required int index}) {
    final isActive = _currentIndex == index;

    return GestureDetector(
      onTap: () => _onTap(index),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedScale(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              scale: isActive ? 1.25 : 1.0,
              child: Icon(
                icon,
                color: isActive ? AppColors.primary : AppColors.textSecondary,
              ),
            ),

            const SizedBox(height: 4),

            // DOT INDICATOR
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 4,
              width: isActive ? 4 : 0,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: _pages[_currentIndex],

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          border: Border(
            top: BorderSide(
              color: Color(0x14000000), // lebih soft & modern
            ),
          ),
        ),

        padding: const EdgeInsets.symmetric(vertical: 10),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(icon: Icons.home_outlined, index: 0),
            _navItem(icon: Icons.description_outlined, index: 1),
            _navItem(icon: Icons.build_outlined, index: 2),
            _navItem(icon: Icons.person_outline, index: 3),
          ],
        ),
      ),
    );
  }
}
