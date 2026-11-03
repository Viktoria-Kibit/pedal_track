// lib/screens/repairs_screen.dart
import 'package:flutter/material.dart';

import 'add_repair_screen.dart';

class RepairsScreen extends StatefulWidget {
  const RepairsScreen({super.key});

  @override
  State<RepairsScreen> createState() => _RepairsScreenState();
}

class _RepairsScreenState extends State<RepairsScreen> {
  // Статичні дані про ремонти з розширеними полями для редагування
  static const List<Map<String, String>> _mockRepairs = [
    {
      'title': 'Chain Replacement',
      'date': 'Sep 29, 2026',
      'cost': '\$45.00',
      'mileage': '1,250 km',
      'notes': 'Replaced old chain with KMC X10',
    },
    {
      'title': 'New Brake Pads',
      'date': 'Sep 22, 2026',
      'cost': '\$28.00',
      'mileage': '1,180 km',
      'notes': 'Front and rear brake pads replaced',
    },
    {
      'title': 'Rear Tire Replacement',
      'date': 'Sep 15, 2026',
      'cost': '\$52.00',
      'mileage': '1,095 km',
      'notes': 'Installed Continental Grand Prix 5000',
    },
    {
      'title': 'Drivetrain Tune-Up',
      'date': 'Sep 8, 2026',
      'cost': '\$35.00',
      'mileage': '980 km',
      'notes': 'Cleaned cassette, derailleurs, and lubricated chain',
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
          'Repairs',
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
                    _buildFilterChip('Drivetrain'),
                    const SizedBox(width: 8),
                    _buildFilterChip('Tires'),
                    const SizedBox(width: 8),
                    _buildFilterChip('Brakes'),
                  ],
                ),
              ),
            ),

            // Список ремонтів із відкриттям редагування за тап-івентом
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: _mockRepairs.length,
                itemBuilder: (context, index) {
                  final repair = _mockRepairs[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      // Перехід на екран у режимі редагування з передачею даних
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddRepairScreen(initialData: repair),
                        ),
                      );
                    },
                    child: _buildRepairCard(
                      title: repair['title']!,
                      date: repair['date']!,
                      cost: repair['cost']!,
                      mileage: repair['mileage']!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Помаранчева плаваюча кнопка для створення нового запису
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddRepairScreen()),
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

  Widget _buildRepairCard({
    required String title,
    required String date,
    required String cost,
    required String mileage,
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
              Icons.build_outlined,
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
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1E1E),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF757575),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      cost,
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
                      mileage,
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
