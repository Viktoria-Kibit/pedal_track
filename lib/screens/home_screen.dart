// lib/screens/home_screen.dart
import 'package:flutter/material.dart';

import 'profile_screen.dart';
import 'rides_screen.dart';
import 'add_ride_screen.dart';
import 'add_repair_screen.dart';
import 'repairs_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Hardcoded дані згідно з вимогою методички
  static const String _totalDistance = '1,250 km';
  static const String _ridesCompleted = '86 rides';
  static const String _avgSpeed = '22.4 km/h';
  static const String _thisWeek = '78 km';
  static const String _longestRide = '62 km';

  bool _isDialOpen = false; // Стан для відкриття/закриття меню кнопок

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'PedalTrack',
          style: TextStyle(
            color: Color(0xFFFF6B00),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      // Використовуємо Stack, щоб можна було накласти темний фон поверх вмісту
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'TOTAL DISTANCE',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF757575),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFEECC),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'LIFETIME',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFF6B00),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 24,
                          thickness: 1,
                          color: Color(0xFFEEEEEE),
                        ),
                        const Text(
                          _totalDistance,
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E1E1E),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildSubStat(
                                'Rides Completed',
                                _ridesCompleted,
                              ),
                            ),
                            Expanded(
                              child: _buildSubStat('Avg Speed', _avgSpeed),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: _buildSmallCard('This Week', _thisWeek)),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildSmallCard('Longest Ride', _longestRide),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Темний шар, який з'являється при натисканні на FAB
          if (_isDialOpen)
            GestureDetector(
              onTap: () {
                setState(() {
                  _isDialOpen = false;
                });
              },
              child: Container(color: Colors.black.withValues(alpha: 0.5)),
            ),
        ],
      ),

      // Кастомне Speed Dial меню
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (_isDialOpen) ...[
            _buildDialOption(
              icon: Icons.build,
              label: 'Add Repair',
              onTap: () {
                setState(() {
                  _isDialOpen = false;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddRepairScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildDialOption(
              icon: Icons.directions_bike,
              label: 'Add Ride',
              onTap: () {
                setState(() {
                  _isDialOpen = false;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddRideScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
          ],

          // Головна кнопка
          FloatingActionButton(
            heroTag: 'main_fab',
            onPressed: () {
              setState(() {
                _isDialOpen = !_isDialOpen;
              });
            },
            backgroundColor: const Color(0xFFFF6B00),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              _isDialOpen ? Icons.close : Icons.add,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  // Допоміжний метод для малих кнопок у меню
  Widget _buildDialOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 16),
        FloatingActionButton(
          heroTag: label,
          mini: true,
          onPressed: onTap,
          backgroundColor: const Color(0xFFFF6B00),
          shape: const CircleBorder(),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
      ],
    );
  }

  Widget _buildSubStat(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF9E9E9E)),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E1E1E),
          ),
        ),
      ],
    );
  }

  Widget _buildSmallCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Color(0xFF9E9E9E)),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E1E1E),
            ),
          ),
        ],
      ),
    );
  }
}
