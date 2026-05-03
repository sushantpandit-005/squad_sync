import 'package:flutter/material.dart';
import 'pacer_matrix_screen.dart';

class GatewayScreen extends StatelessWidget {
  const GatewayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Deep Charcoal background
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // --- Header Section ---
                Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                ),
                const SizedBox(height: 24),
                const Text(
                  'SquadSync',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Select your squad to continue',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                
                // Spacing between header and cards
                const SizedBox(height: 48), 

                // --- Cards Section ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      // Card 1: KOI Society Club
                      _buildSquadCard(
                        title: 'KOI Society Club',
                        subtitle: '247 members',
                        borderColor: const Color(0xFF00FFFF), // Cyan
                        onTap: () {
                          // Generic onTap function
                          debugPrint('KOI Society Club tapped');
                        },
                      ),
                      const SizedBox(height: 16),
                      
                      // Card 2: Hamro Run Club
                      _buildSquadCard(
                        title: 'Hamro Run Club',
                        subtitle: '89 members',
                        borderColor: const Color(0xFF39FF14), // Neon Lime
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const PacerMatrixScreen()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Modular helper method to build custom styled cards
  Widget _buildSquadCard({
    required String title,
    required String subtitle,
    required Color borderColor,
    required VoidCallback onTap,
  }) {
    return Card(
      color: const Color(0xFF1E1E1E), // Dark grey background for the card
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: borderColor,
          width: 1.0, // Thin border
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          title: Text(
            title,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(color: Colors.white70), // Light grey text
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.white54),
        ),
      ),
    );
  }
}