// lib/screens/add_repair_screen.dart
import 'package:flutter/material.dart';

import '../core/widgets/delete_confirmation_dialog.dart';
import '../core/widgets/custom_button.dart';

class AddRepairScreen extends StatelessWidget {
  final Map<String, String>? initialData;

  const AddRepairScreen({super.key, this.initialData});

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
          isEditing ? 'Update Repair' : 'Add Repair',
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
                label: 'Repair Type',
                hint: 'e.g. Chain Replacement',
                initialValue: initialData?['title'],
                prefixIcon: Icons.build_outlined,
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Cost (\$)',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF424242),
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildSimpleTextField(
                          hint: 'e.g. 45.00',
                          initialValue: initialData?['cost']?.replaceAll(
                            '\$',
                            '',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mileage (km)',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF424242),
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildSimpleTextField(
                          hint: 'e.g. 1,250',
                          initialValue: initialData?['mileage'],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                'Upload Receipt / Part Photo',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF424242),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1576435728678-68ce0f6eb293?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black.withOpacity(0.4),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 36,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Change Photo',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
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
                    (isEditing ? 'Some notes about repair' : null),
                decoration: InputDecoration(
                  hintText: 'Write any extra maintenance notes...',
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
                text: isEditing ? 'Update Repair' : 'Save Repair',
                onPressed: () => Navigator.pop(context),
              ),

              // Кнопка видалення для режиму редагування
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

  Widget _buildSimpleTextField({required String hint, String? initialValue}) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
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
