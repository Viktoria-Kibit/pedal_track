// lib/screens/rides_screen.dart
import 'package:flutter/material.dart';

import 'add_ride_screen.dart';

class RidesScreen extends StatefulWidget {
  const RidesScreen({super.key});

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
  // Статичні дані про поїздки з розширеними полями для редагування
  static const List<Map<String, String>> _mockRides = [
    {
      'date': 'Sep 28, 2026',
      'distance': '45.2 km',
      'duration': '2h 15m',
      'hours': '2 h',
      'minutes': '15 min',
      'notes': 'Great morning ride along the river side',
    },
    {
      'date': 'Sep 25, 2026',
      'distance': '32.1 km',
      'duration': '1h 38m',
      'hours': '1 h',
      'minutes': '38 min',
      'notes': 'Evening sprint with friends',
    },
    {
      'date': 'Sep 22, 2026',
      'distance': '18.5 km',
      'duration': '55m',
      'hours': '0 h',
      'minutes': '55 min',
      'notes': 'Short commute to university',
    },
    {
      'date': 'Sep 19, 2026',
      'distance': '50.0 km',
      'duration': '2h 40m',
      'hours': '2 h',
      'minutes': '40 min',
      'notes': 'Weekend long distance ride',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Ride Log',
          style: TextStyle(
            color: Color(0xFF1E1E1E),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Фільтри (Horizontal Scrollable Chips)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip('All', isSelected: true),
                    const SizedBox(width: 8),
                    _buildFilterChip('This Week'),
                    const SizedBox(width: 8),
                    _buildFilterChip('This Month'),
                  ],
                ),
              ),
            ),

            // Список поїздок із можливістю кліку для редагування
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: _mockRides.length,
                itemBuilder: (context, index) {
                  final ride = _mockRides[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      // Перехід на екран у режимі редагування з передачею даних
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddRideScreen(initialData: ride),
                        ),
                      );
                    },
                    child: _buildRideCard(
                      date: ride['date']!,
                      distance: ride['distance']!,
                      duration: ride['duration']!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Кнопка для додавання нової поїздки (без initialData)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddRideScreen()),
          );
        },
        backgroundColor: const Color(0xFFFF6B00),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFF6B00) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xFFFF6B00) : const Color(0xFFE0E0E0),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF757575),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildRideCard({
    required String date,
    required String distance,
    required String duration,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: const Color(0xFFF1F1F1)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEECC),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.directions_bike,
              color: Color(0xFFFF6B00),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1E1E),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      distance,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E1E1E),
                      ),
                    ),
                    const Text(
                      ' • ',
                      style: TextStyle(color: Color(0xFF9E9E9E)),
                    ),
                    Text(
                      duration,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF757575),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFF9E9E9E)),
        ],
      ),
    );
  }
}
