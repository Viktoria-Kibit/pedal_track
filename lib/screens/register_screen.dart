import 'package:flutter/material.dart';

import '../core/widgets/custom_button.dart';
import '../core/widgets/custom_textfield.dart';
import 'main_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          // Дозволяє скролити вміст
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              // Логотип
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B00),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.directions_bike,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              const SizedBox(height: 24),
              // Заголовок
              const Text(
                'PedalTrack',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E1E1E),
                ),
              ),
              const SizedBox(height: 8),
              // Підзаголовок
              const Text(
                'Your ultimate cycling companion',
                style: TextStyle(fontSize: 14, color: Color(0xFF757575)),
              ),
              const SizedBox(height: 32),

              // Поле Full Name
              const CustomTextField(
                label: 'Full Name',
                hint: 'Alex Mercer',
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 16),

              // Поле Email
              const CustomTextField(
                label: 'Email Address',
                hint: 'alex@example.com',
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),

              // Поле Password
              const CustomTextField(
                label: 'Password',
                hint: '••••••••',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 16),

              // Поле Confirm Password
              const CustomTextField(
                label: 'Confirm Password',
                hint: '••••••••',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 32),

              // Кнопка Register
              CustomButton(
                text: 'Register',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    ), // Замість HomeScreen
                  );
                },
              ),
              const SizedBox(height: 16),

              // Посилання для повернення на екран логіну
              TextButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                  ); // Закриває цей екран і повертає на Login
                },
                child: const Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Color(0xFFFF6B00),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
