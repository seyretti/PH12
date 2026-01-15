import 'package:flutter/material.dart';
import 'package:gelir_gider_uygulamasi/themes/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ------------------------------------------------------------
  // LIGHT THEME
  // ------------------------------------------------------------
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Color.fromARGB(255, 49, 184, 242),
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Roboto',

      // ---------------------------
      // TEXT THEME
      // ---------------------------
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.textPrimary, fontSize: 16),
        bodyMedium: TextStyle(color: AppColors.textSecondary, fontSize: 14),
        titleLarge: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),

      // ---------------------------
      // APP BAR
      // ---------------------------
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF50AFE4), // yeni renk
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      // ---------------------------
      // CARD
      // ---------------------------
      cardColor: AppColors.cardBackground,
      cardTheme: CardThemeData(
        color: AppColors.cardBackground,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // ---------------------------
      // DIVIDER
      // ---------------------------
      dividerColor: AppColors.dividerBackground,

      // ---------------------------
      // INPUT DECORATION
      // ---------------------------
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.cardBackground,
        hintStyle: const TextStyle(color: AppColors.textTextHint),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.dividerBackground),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color.fromARGB(255, 49, 184, 242)),
        ),
      ),

      // ---------------------------
      // BUTTONS
      // ---------------------------
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF50AFE4),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.hotPink,
        foregroundColor: Colors.white,
      ),

      // ---------------------------
      // BOTTOM NAVIGATION BAR
      // ---------------------------
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.background,
        selectedItemColor: Color.fromARGB(255, 49, 184, 242),
        unselectedItemColor: AppColors.textSecondary,
        showUnselectedLabels: true,
      ),

      // ---------------------------
      // COLOR SCHEME
      // ---------------------------
      colorScheme: const ColorScheme.light(
        primary: Color.fromARGB(255, 49, 184, 242),
        secondary: AppColors.mint,
        surface: AppColors.cardBackground,
      ),
    );
  }

  // ------------------------------------------------------------
  // DARK THEME
  // ------------------------------------------------------------
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.darkTiffanyBlue,
      scaffoldBackgroundColor: AppColors.darkBackground,
      fontFamily: 'Roboto',

      // ---------------------------
      // TEXT THEME
      // ---------------------------
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.darkTextPrimary, fontSize: 16),
        bodyMedium: TextStyle(color: AppColors.darkTextSecondary, fontSize: 14),
        titleLarge: TextStyle(
          color: AppColors.darkTextPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: AppColors.darkTextPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      // ---------------------------
      // NAVIGATION BAR THEME
      // ---------------------------
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.hotPink,
        elevation: 0,
        indicatorColor: Colors.white,
        labelTextStyle: MaterialStateProperty.all(
          GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // ---------------------------
      // APP BAR
      // ---------------------------
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF50AFE4), // koyu fıstık yeşili
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white), // ikonlar beyaz
        titleTextStyle: TextStyle(
          color: Colors.white, // başlık beyaz
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      // ---------------------------
      // CARD
      // ---------------------------
      cardColor: AppColors.darkCardBackground,
      cardTheme: CardThemeData(
        color: AppColors.darkCardBackground,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // ---------------------------
      // DIVIDER
      // ---------------------------
      dividerTheme: const DividerThemeData(
        color: Color(0xFF50AFE4),
        thickness: 1,
      ),

      // ---------------------------
      // INPUT DECORATION
      // ---------------------------
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkCardBackground,
        hintStyle: const TextStyle(color: AppColors.darkTextHint),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.darkDivider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.darkTiffanyBlue),
        ),
      ),

      // ---------------------------
      // BUTTONS
      // ---------------------------
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF50AFE4),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.darkHotPink,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // ---------------------------
      // BOTTOM NAVIGATION BAR
      // ---------------------------
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkBackground,
        selectedItemColor: Color(0xFF50AFE4),
        unselectedItemColor: AppColors.darkTextSecondary,
        showUnselectedLabels: true,
      ),

      // ---------------------------
      // COLOR SCHEME
      // ---------------------------
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF50AFE4),
        secondary: AppColors.darkMint,
        surface: AppColors.darkCardBackground,
      ),
    );
  }
}
