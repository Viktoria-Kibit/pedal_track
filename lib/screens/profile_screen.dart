import 'package:flutter/material.dart';

import '../core/widgets/custom_button.dart';
import '../core/widgets/custom_textfield.dart';
import 'home_screen.dart';
import 'rides_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xFF1E1E1E),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFFF6B00), width: 2),
                ),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFFE0E0E0),
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Alex Mercer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E1E1E),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'alex@pedaltrack.com',
                style: TextStyle(fontSize: 14, color: Color(0xFF757575)),
              ),
              const SizedBox(height: 32),

              // Використовуємо твій CustomTextField з параметром hint
              const CustomTextField(
                label: 'Full Name',
                hint: 'Alex Mercer',
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 16),

              const CustomTextField(
                label: 'Email Address',
                hint: 'alex@pedaltrack.com',
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 32),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'CHANGE PASSWORD',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF6B00),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const CustomTextField(
                label: 'Old Password',
                hint: '••••••••',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 16),

              const CustomTextField(
                label: 'New Password',
                hint: '••••••••',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 32),

              CustomButton(
                text: 'Save Changes',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Profile updated successfully!'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
