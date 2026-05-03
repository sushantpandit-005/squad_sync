import 'package:flutter/material.dart';
import 'pacer_matrix_screen.dart';

class RunClubHubScreen extends StatefulWidget {
  const RunClubHubScreen({super.key});

  @override
  State<RunClubHubScreen> createState() => _RunClubHubScreenState();
}

class _RunClubHubScreenState extends State<RunClubHubScreen> {
  bool isJoined = false;
  int bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hamro Run Club',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              'Run Club',
              style: TextStyle(color: Color(0xFF39FF14), fontSize: 14),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Card
            Card(
              color: const Color(0xFF1C1C1E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.asset(
                          'assets/images/hrc team.JPG',
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF39FF14),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'UPCOMING',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sunday Social Run',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        const SizedBox(height: 12),
                        _buildInfoRow(Icons.calendar_today, 'Sunday, April 27, 2026'),
                        _buildInfoRow(Icons.access_time, '7:00 AM - 9:00 AM'),
                        _buildInfoRow(Icons.location_on_outlined, 'Central Park, South Gate'),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => setState(() => isJoined = !isJoined),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isJoined ? Colors.transparent : const Color(0xFF39FF14),
                              side: isJoined ? const BorderSide(color: Color(0xFF39FF14)) : null,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text(
                              isJoined ? 'Confirmed' : 'Join Squad',
                              style: TextStyle(color: isJoined ? const Color(0xFF39FF14) : Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Sub-Clubs Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Sub-Clubs', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                Text('View all', style: TextStyle(color: Colors.grey, fontSize: 14)),
              ],
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildSubClubCard(
                    title: 'Pacer Squad',
                    members: '24 members',
                    icon: Icons.person,
                    hasBorder: true,
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PacerMatrixScreen())),
                  ),
                  _buildSubClubCard(
                    title: 'Media Team',
                    members: '8 members',
                    icon: Icons.camera_alt,
                    hasBorder: false,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1C1C1E),
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomNavIndex,
        selectedItemColor: const Color(0xFF39FF14),
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => bottomNavIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Members'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildSubClubCard({required String title, required String members, required IconData icon, required bool hasBorder, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
        child: Card(
          color: const Color(0xFF1C1C1E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: hasBorder ? const BorderSide(color: Color(0xFF39FF14), width: 1) : BorderSide.none,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: Colors.white, size: 24),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  members,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}