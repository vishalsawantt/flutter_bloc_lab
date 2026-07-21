import 'package:flutter/material.dart';

class AppColors {
  // private constructor — no one can create instance
  AppColors._();

  // Primary
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryDark = Color(0xFF4B44CC);

  // Background
  static const Color background = Color(0xFF1A1A2E);
  static const Color surface = Color(0xFF16213E);
  static const Color card = Color(0xFF0F3460);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color textHint = Color(0xFF6B6B6B);

  // Status
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFF9800);

  // Expense Categories
  static const Color food = Color(0xFFFF6B6B);
  static const Color travel = Color(0xFF4ECDC4);
  static const Color bills = Color(0xFFFFE66D);
  static const Color shopping = Color(0xFFA8E6CF);
  static const Color other = Color(0xFFB0B0B0);
}