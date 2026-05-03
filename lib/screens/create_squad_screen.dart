import 'package:flutter/material.dart';

class CreateSquadScreen extends StatefulWidget {
  const CreateSquadScreen({super.key});

  @override
  State<CreateSquadScreen> createState() => _CreateSquadScreenState();
}

class _CreateSquadScreenState extends State<CreateSquadScreen> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Create Your Squad',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'STEP 1 OF 2',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 1.5,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tell us about your community',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 32),
                  _buildCategoryCard(
                    index: 0,
                    icon: Icons.book,
                    title: 'Academic & Professional',
                    subtitle: 'Study groups, career networks...',
                  ),
                  const SizedBox(height: 12),
                  _buildCategoryCard(
                    index: 1,
                    icon: Icons.emoji_events,
                    title: 'Sports & Athletics',
                    subtitle: 'Run clubs, intramural teams...',
                  ),
                  const SizedBox(height: 12),
                  _buildCategoryCard(
                    index: 2,
                    icon: Icons.sports_esports,
                    title: 'Casual & Hobby',
                    subtitle: 'Gaming clans, book clubs...',
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Primary Goal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildGoalChip('Scheduling', true),
                      const SizedBox(width: 12),
                      _buildGoalChip('Capacity Tracking', false),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Action Button pinned to bottom
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF007AFF).withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Action for Generate Hub
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007AFF),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Generate Hub',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard({
    required int index,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final isSelected = selectedCategory == index;
    return Card(
      color: const Color(0xFF1C1C1E),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? const Color(0xFF00FFFF) : Colors.transparent,
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });
        },
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          leading: Icon(icon, color: isSelected ? const Color(0xFF00FFFF) : Colors.white, size: 28),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ),
      ),
    );
  }

  Widget _buildGoalChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF0A1A2F) : const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: isSelected ? Colors.white : Colors.transparent,
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
