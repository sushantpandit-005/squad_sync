import 'package:flutter/material.dart';
import '../widgets/pacer_member_tile.dart';

class PacerMatrixScreen extends StatelessWidget {
  const PacerMatrixScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> squadData = [
      {'name': 'Saugat', 'role': 'Pacer', 'isActive': true},
      {'name': 'Manish', 'role': 'Pacer', 'isActive': true},
      {'name': 'Suprima', 'role': 'Pacer', 'isActive': true},
      {'name': 'Nitisha', 'role': 'Pacer', 'isActive': true},
      {'name': 'Sandesh', 'role': 'Pacer', 'isActive': true},
      {'name': 'Prajwal', 'role': 'Pacer', 'isActive': true},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Pacer Squad Matrix',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'MEMBER CAPACITY OVERVIEW',
              style: TextStyle(
                color: Color(0xFF39FF14),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: squadData.length,
              itemBuilder: (context, index) {
                final member = squadData[index];
                return PacerMemberTile(
                  name: member['name'],
                  role: member['role'],
                  isActive: member['isActive'],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24.0),
            decoration: const BoxDecoration(
              color: Color(0xFF1C1C1E),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Total Squad Members',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '7',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Active Capacity',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '7/7',
                      style: TextStyle(
                        color: Color(0xFF39FF14),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}