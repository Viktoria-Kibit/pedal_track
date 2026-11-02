import 'package:flutter/material.dart';

import '../core/widgets/custom_button.dart';
import '../core/widgets/custom_textfield.dart';

import 'register_screen.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Логотип
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6D00),
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
                  color: Color(0xFF1C1B1F),
                ),
              ),
              const SizedBox(height: 8),
              // Підзаголовок
              const Text(
                'Your ultimate cycling companion',
                style: TextStyle(fontSize: 14, color: Color(0xFF49454F)),
              ),
              const SizedBox(height: 48),

              // Поле Email
              const CustomTextField(
                label: 'Email Address',
                hint: 'alex@example.com',
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 20),

              // Поле Password
              const CustomTextField(
                label: 'Password',
                hint: '••••••••',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 32),

              // Кнопка Логіну
              CustomButton(
                text: 'Login',
                onPressed: () {
                  // Перехід на головний екран
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
              const SizedBox(height: 24),

              // Текстові посилання
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Color(0xFFFF6B00),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Відновлення пароля
                },
                child: const Text(
                  "Forgot password?",
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
