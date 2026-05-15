import 'package:flutter/material.dart';

class PacerMemberTile extends StatelessWidget {
  final String name;
  final String role;
  final bool isActive;

  const PacerMemberTile({
    super.key,
    required this.name,
    required this.role,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = isActive ? const Color(0xFF39FF14) : Colors.grey;
    final statusText = isActive ? 'Active' : 'Inactive';

    return Card(
      color: const Color(0xFF1C1C1E),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF2C2C2E),
          child: Text(
            name.isNotEmpty ? name[0].toUpperCase() : '',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          role,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2E),
            border: Border.all(color: statusColor.withOpacity(0.3), width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                statusText,
                style: TextStyle(color: statusColor, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}