import 'package:app_devfest_batna/components/secondry_color.dart';
import 'package:app_devfest_batna/startUp%20ui/DashboardScreen.dart';
import 'package:app_devfest_batna/startUp%20ui/RecommendationScreen.dart';
import 'package:app_devfest_batna/startUp%20ui/SalesForecastingScreen.dart';
import 'package:app_devfest_batna/startUp%20ui/SalesInvestorScreen.dart';
import 'package:app_devfest_batna/startUp%20ui/quick_access.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WebSidebar extends StatefulWidget {
  @override
  _WebSidebarState createState() => _WebSidebarState();
}

class _WebSidebarState extends State<WebSidebar> {
  String selectedMenuItem = 'Quick Access'; // Default selected item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 250, // Width of the sidebar
            color: secondryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo or Header
                Container(
                  height: 100,
                  color: secondryColor,
                  child: Center(
                    child: Image.asset(
                      'images/logo.png',
                      color: Colors.white,
                    ),
                  ),
                ),
                // Menu Items
                Expanded(
                  child: ListView(
                    children: [
                      _buildMenuItem(Icons.home, 'Quick Access'),
                      _buildMenuItem(Icons.dashboard, 'Dashboard'),
                      _buildMenuItem(Icons.person, 'Sales Forecasting'),
                      _buildMenuItem(Icons.settings, 'Sales Investor'),
                      _buildMenuItem(Icons.recommend, 'Recommendation'),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Accounts',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _buildMenuItem(Icons.settings, 'Settings'),
                      _buildMenuItem(Icons.help_outline, 'FAQ'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Main Content Area
          Expanded(
            child: _getContentForSelectedItem(selectedMenuItem),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    final isSelected = selectedMenuItem == label;
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.white54,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.white54,
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        setState(() {
          selectedMenuItem = label; // Update selected menu item
        });
      },
    );
  }

  Widget _getContentForSelectedItem(String selectedItem) {
    switch (selectedItem) {
      case 'Quick Access':
        return QuickAccess(
          onNavigate: (menuItem) {
            setState(() {
              selectedMenuItem = menuItem; // Update the sidebar's menu item
            });
          },
        );
      case 'Dashboard':
        return const DashboardScreen();
      case 'Sales Forecasting':
        return const SalesForecastingScreen();
      case 'Sales Investor':
        return const SalesInvestorScreen();
      case 'Recommendation':
        return const RecommendationScreen();
      case 'Settings':
        return _buildPlaceholder('Adjust your settings here');
      case 'FAQ':
        return _buildPlaceholder('Frequently Asked Questions');
      default:
        return _buildPlaceholder('Main Content Area');
    }
  }

  Widget _buildPlaceholder(String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
