import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zephyr/borrow_screen.dart';
import 'package:zephyr/collateral_screen.dart';
import 'package:zephyr/dashboard_screen.dart';
import 'package:zephyr/profile_screen.dart';
import 'package:zephyr/repay_screen.dart';



class AppNavigator extends StatefulWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {



  int _selectedIndex = 0;

  // Placeholder widgets for each tab
  // Replace these with your actual screens
  final List<Widget> _screens = [
    const DashboardScreen(),
    const BorrowScreen(),
    const RepayScreen(),
    const CollateralScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Add haptic feedback for better UX
      HapticFeedback.lightImpact();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 30, 0, 70),
          selectedItemColor: const Color(0xFFA855F7),
          unselectedItemColor: Colors.grey.shade500,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 11,
          ),
          elevation: 8,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_rounded),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Borrow',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payments_rounded),
              label: 'Repay',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shield_rounded),
              label: 'Collateral',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder widgets - replace these with your actual screens
class DashboardPlaceholder extends StatelessWidget {
  const DashboardPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(
      'Dashboard',
      Icons.dashboard_rounded,
      'View your active loans and financial overview',
    );
  }
}

class BorrowPlaceholder extends StatelessWidget {
  const BorrowPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(
      'Borrow',
      Icons.account_balance_wallet,
      'Apply for a new loan with crypto collateral',
    );
  }
}

class RepayPlaceholder extends StatelessWidget {
  const RepayPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(
      'Repay',
      Icons.payments_rounded,
      'Make payments on your existing loans',
    );
  }
}

class CollateralPlaceholder extends StatelessWidget {
  const CollateralPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(
      'Collateral',
      Icons.shield_rounded,
      'Manage and top-up your collateral assets',
    );
  }
}

class ProfilePlaceholder extends StatelessWidget {
  const ProfilePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(
      'Profile',
      Icons.person_rounded,
      'View your credit score and account settings',
    );
  }
}

// Helper method to build placeholder screens
Widget _buildPlaceholderScreen(String title, IconData icon, String description) {
  return SafeArea(
    child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 0, 50),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80,
              color: const Color(0xFFA855F7),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

