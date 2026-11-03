// lib/screens/add_ride_screen.dart
import 'package:flutter/material.dart';

import '../core/widgets/delete_confirmation_dialog.dart';
import '../core/widgets/custom_button.dart';

class AddRideScreen extends StatelessWidget {
  final Map<String, String>? initialData;

  const AddRideScreen({super.key, this.initialData});

  bool get isEditing => initialData != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E1E1E)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          isEditing ? 'Update Ride' : 'Add Ride',
          style: const TextStyle(
            color: Color(0xFF1E1E1E),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabeledTextField(
                label: 'Date',
                hint: 'Sep 29, 2026',
                initialValue: initialData?['date'],
                prefixIcon: Icons.calendar_today_outlined,
              ),
              const SizedBox(height: 20),

              _buildLabeledTextField(
                label: 'Distance',
                hint: 'e.g. 45 km',
                initialValue: initialData?['distance'],
                prefixIcon: Icons.route_outlined,
              ),
              const SizedBox(height: 20),

              const Text(
                'Duration',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF424242),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _buildSimpleTextField(
                      hint: 'h',
                      initialValue:
                          initialData?['hours'] ?? (isEditing ? '2 h' : null),
                      prefixIcon: Icons.access_time,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildSimpleTextField(
                      hint: 'min',
                      initialValue:
                          initialData?['minutes'] ??
                          (isEditing ? '27 min' : null),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                'Notes',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF424242),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                maxLines: 4,
                initialValue:
                    initialData?['notes'] ??
                    (isEditing ? 'Some notes about ride' : null),
                decoration: InputDecoration(
                  hintText: 'Add ride notes...',
                  hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFFF6B00)),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Головна кнопка дії
              CustomButton(
                text: isEditing ? 'Update Ride' : 'Save Ride',
                onPressed: () => Navigator.pop(context),
              ),

              // Кнопка видалення (з'являється лише в режимі редагування)
              if (isEditing) ...[
                const SizedBox(height: 12),
                CustomButton(
                  text: 'Delete',
                  backgroundColor: const Color(0xFFBEBEBE),
                  textColor: Colors.white,
                  onPressed: () async {
                    final confirmed = await showDeleteConfirmationDialog(
                      context,
                    );
                    if (confirmed == true && context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabeledTextField({
    required String label,
    required String hint,
    String? initialValue,
    IconData? prefixIcon,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: const Color(0xFF757575))
            : null,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFFF6B00)),
        ),
      ),
    );
  }

  Widget _buildSimpleTextField({
    required String hint,
    String? initialValue,
    IconData? prefixIcon,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: const Color(0xFF757575))
            : null,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFFF6B00)),
        ),
      ),
    );
  }
}
