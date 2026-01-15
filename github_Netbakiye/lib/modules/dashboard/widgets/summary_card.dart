import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final double amount;
  final IconData icon;
  final Color color;
  final List<Color> gradientColors;
  final bool isaretGoserilsinMi;

  const SummaryCard({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    required this.color,
    this.isaretGoserilsinMi = false,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    final amountFormat = NumberFormat.currency(
      locale: "tr_TR",
      symbol: '₺',
      decimalDigits: 2,
    );

    final Color contentColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: gradientColors.last.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 20,
                    color: contentColor,
                    shadows: [
                      Shadow(
                        blurRadius: 1.0,
                        color: contentColor,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: contentColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '${isaretGoserilsinMi && amount > 0 ? '+' : ''}${amountFormat.format(amount)}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: contentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
