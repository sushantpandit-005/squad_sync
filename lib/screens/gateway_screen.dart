import 'package:flutter/material.dart';
// ignore: unused_import
import 'pacer_matrix_screen.dart';
import 'run_club_hub_screen.dart';
import 'create_squad_screen.dart';

class GatewayScreen extends StatelessWidget {
  const GatewayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    // --- Header Section ---
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF39FF14),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.person, color: Colors.black, size: 40),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'SquadSync',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Select your squad to continue',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 48),

                    // --- Cards Section ---
                    _buildSquadCard(
                      context: context,
                      overlineText: 'STUDENT SOCIETY',
                      title: 'KOI Society Club',
                      subtitle: '247 members',
                      borderColor: const Color(0xFF00FFFF),
                      imagePath: 'assets/images/Society.png',
                      onTap: () {
                        debugPrint('KOI Society Club tapped');
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildSquadCard(
                      context: context,
                      overlineText: 'RUN CLUB',
                      title: 'Hamro Run Club',
                      subtitle: '89 members',
                      borderColor: const Color(0xFF39FF14),
                      imagePath: 'assets/images/hrc black.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RunClubHubScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            // --- Footer Section ---
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't see your squad? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CreateSquadScreen()),
                      );
                    },
                    child: const Text(
                      'Create one',
                      style: TextStyle(
                        color: Color(0xFF39FF14),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSquadCard({
    required BuildContext context,
    required String overlineText,
    required String title,
    required String subtitle,
    required Color borderColor,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return Card(
      color: const Color(0xFF1C1C1E),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: borderColor, width: 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(overlineText, style: TextStyle(color: borderColor, fontSize: 10, fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
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