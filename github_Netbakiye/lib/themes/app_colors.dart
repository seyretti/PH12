import 'package:flutter/material.dart';

class AppColors {
  // Ana renkler - Light mode
  static const Color yellow = Color(0xFFFBE7C6);
  static const Color mint = Color(0xFFB8EBDC);
  static const Color tiffanyBlue = Color(0xFF0ABAB5);
  static const Color hotPink = Color(0xFFFF69B4);
  // Ana renkler - Dark mode
  static const Color darkYellow = Color(0xFF8B6F4E);
  static const Color darkMint = Color(0xFF4A7C7B);
  static const Color darkTiffanyBlue = Color(0xFF056B6A);
  static const Color darkHotPink = Color(0xFFB23A7A);
  // Gölgeler
  static const Color tiffanyBlue80 = Color(0xCCA0E7E5);
  static const Color tiffanyBlue60 = Color(0x99A0E7E5);
  static const Color tiffanyBlue40 = Color(0x66A0E7E5);
  static const Color tiffanyBlue20 = Color(0x33A0E7E5);
  // İşlem renkleri - Light mode
  static const Color income = Color(0xFFB4F8C8);
  static const Color expense = Color(0xFFFFAEBC);
  static const Color balance = Color(0xFF50AFE4);
  // İşlem renkleri - Dark mode
  static const Color darkIncome = Color(0xFF7AC99A);
  static const Color darkExpense = Color(0xFFCC8A96);
  static const Color darkBalance = Color.fromARGB(255, 73, 171, 224);
  // Arka plan renkleri
  static const Color background = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color dividerBackground = Color(0xFFF5F5F5);
  // Arka plan renkleri - Dark mode
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkCardBackground = Color(0xFF1E1E1E);
  static const Color darkDivider = Color(0xFF404040);
  // Metin renkleri - Light mode
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textTextHint = Color(0xFF999999);
  // Metin renkleri - Dark mode
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFE0E0E0);
  static const Color darkTextHint = Color(0xFFB0B0B0);
  // Gradiant renkler - Light mode
  static const List<Color> incomeGradient = [
    Color(0xFFB4F8C8),
    Color(0xFF95E3A9),
  ];
  static const List<Color> expenseGradient = [
    Color(0xFFFFAEBC),
    Color(0xFFFF8A9E),
  ];
  static const List<Color> balanceGradient = [
    Color.fromARGB(255, 114, 185, 224),
    Color.fromARGB(255, 114, 185, 224),
  ];
  // Gradiant renkler - Dark mode
  static const List<Color> darkIncomeGradient = [
    Color(0xFF7AC99A),
    Color(0xFF5FA67A),
  ];
  static const List<Color> darkExpenseGradient = [
    Color(0xFFCC8A96),
    Color(0xFFB55F6A),
  ];
  static const List<Color> darkBalanceGradient = [
    Color(0xFF50AFE4),
    Color(0xFF50AFE4),
  ];
}
