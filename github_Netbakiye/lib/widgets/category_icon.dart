import 'package:flutter/material.dart';
import 'package:gelir_gider_uygulamasi/utils/icon_helper.dart';

class CategoryIcon extends StatelessWidget {
  final String? categoryName;
  final String? iconName;
  final Color color;
  final double size;

  const CategoryIcon({
    super.key,
    this.categoryName,
    this.iconName,
    required this.color,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    final String cName = (categoryName ?? "").toLowerCase();
    final String iName = (iconName ?? "").toLowerCase();
    final String fullText = "$cName $iName";

    // Resim Kontrolü
    if (fullText.contains('saglik') ||
        fullText.contains('sağlık') ||
        fullText.contains('kizilay') ||
        fullText.contains('kızılay') ||
        fullText.contains('hastane') ||
        fullText.contains('doktor') ||
        fullText.contains('hilal')) {
      return Image.asset(
        'assets/images/kizilay.png',
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.local_hospital, color: color, size: size);
        },
      );
    }

    // Standart İkon
    return Icon(getAppIcon(iconName ?? categoryName), color: color, size: size);
  }
}
