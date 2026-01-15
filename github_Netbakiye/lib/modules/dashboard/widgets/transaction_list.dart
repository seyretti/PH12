import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:gelir_gider_uygulamasi/models/gelir_gider.dart';
import 'package:gelir_gider_uygulamasi/modules/home/home_controller.dart';
import 'package:gelir_gider_uygulamasi/utils/icon_helper.dart';

class TransactionList extends StatelessWidget {
  final List<Islem> transactions;
  const TransactionList({super.key, required this.transactions});

  Color _getSubTitleColor(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return isDarkMode ? Colors.grey[400]! : const Color(0xFF9C9C9C);
  }

  // --- İKON GÖSTERİCİ ---
  Widget _buildSmartIcon(
      String categoryName, String? iconName, Color color, double size) {
    final String searchString = (iconName ?? categoryName).toLowerCase();
    final String cName = categoryName.toLowerCase();

    // Özel Resim (Kızılay/Sağlık) Kontrolü
    if (searchString.contains('kizilay') ||
        searchString.contains('kızılay') ||
        searchString.contains('hastane') ||
        searchString.contains('doktor') ||
        searchString.contains('sağlık') ||
        searchString.contains('saglik') ||
        cName.contains('sağlık') || // Garanti olsun diye isme de bak
        searchString.contains('hilal')) {
      return Image.asset(
        'assets/images/kizilay.png',
        width: size + 8,
        height: size + 8,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.favorite, color: color, size: size);
        },
      );
    }

    return Icon(getAppIcon(iconName ?? categoryName), color: color, size: size);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final subTitleColor = _getSubTitleColor(context);

    final incomeList =
        transactions.where((t) => t.tur == IslemTuru.gelir).toList();
    final expenseList =
        transactions.where((t) => t.tur == IslemTuru.gider).toList();

    final Color incomeMain =
        isDarkMode ? const Color(0xFF00BFA5) : const Color(0xFF00897B);
    final Color expenseMain =
        isDarkMode ? const Color(0xFFFF5252) : const Color(0xFFD32F2F);

    if (transactions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.receipt_long_rounded,
                size: 48, color: Colors.grey.withOpacity(0.5)),
            const SizedBox(height: 16),
            Text("Henüz bir işlem yok",
                style: TextStyle(fontSize: 16, color: subTitleColor)),
          ],
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      children: [
        if (incomeList.isNotEmpty) ...[
          _buildSectionHeader("GELİRLER", incomeMain),
          ...incomeList.map((t) => _buildTransactionCard(t, context)),
          const SizedBox(height: 12),
        ],
        if (expenseList.isNotEmpty) ...[
          _buildSectionHeader("GİDERLER", expenseMain),
          ...expenseList.map((t) => _buildTransactionCard(t, context)),
        ],
        const SizedBox(height: 50),
      ],
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, left: 4),
      child: Text(title,
          style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 13,
              letterSpacing: 1.0)),
    );
  }

  Widget _buildTransactionCard(Islem transaction, BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardBgColor = isDarkMode ? const Color(0xFF383838) : Colors.white;
    final titleColor = isDarkMode ? Colors.white : const Color(0xFF2D3142);
    final subTitleColor = _getSubTitleColor(context);

    final double amountVal = transaction.tutar ?? 0.0;
    final bool isIncome = transaction.tur == IslemTuru.gelir;

    String formattedDate = "";
    if (transaction.tarih != null) {
      formattedDate =
          DateFormat('d MMMM yyyy', 'tr').format(transaction.tarih!);
    }

    final displayCategory =
        transaction.kategori ?? (isIncome ? "Gelir" : "Gider");

    final bool isAlacak = displayCategory.toLowerCase().contains('alacak');
    final bool isExcluded = transaction.isExcluded;

    Color themeColor;
    Color amountColor;

    if (isDarkMode) {
      amountColor =
          isIncome ? const Color(0xFF4ADE80) : const Color(0xFFF87171);
      themeColor = isIncome ? const Color(0xFF4ADE80) : const Color(0xFFF87171);
    } else {
      amountColor =
          isIncome ? const Color(0xFF10B981) : const Color(0xFFEF4444);
      themeColor = isIncome ? const Color(0xFF10B981) : const Color(0xFFEF4444);
    }

    if (isExcluded) {
      amountColor = Colors.grey;
      themeColor = Colors.grey;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Dismissible(
        key: Key(transaction.id.toString()),
        direction: DismissDirection.endToStart,
        background: _buildDeleteBackground(),
        confirmDismiss: (direction) => _confirmDelete(context),
        onDismissed: (_) {
          Get.find<HomeController>().islemSil(transaction.id);
        },
        child: Opacity(
          opacity: isExcluded ? 0.6 : 1.0,
          child: Container(
            decoration: BoxDecoration(
              color: cardBgColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: isDarkMode
                  ? []
                  : [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.06),
                          blurRadius: 4,
                          offset: const Offset(0, 2))
                    ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(6, 8, 6, 8),
              child: Row(
                children: [
                  // --- CHECKBOX ALANI ---
                  if (isAlacak)
                    Padding(
                      padding: const EdgeInsets.only(right: 2.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 20,
                            width: 24,
                            child: Transform.scale(
                              scale: 0.8,
                              child: Checkbox(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                visualDensity: const VisualDensity(
                                    horizontal: -4, vertical: -4),
                                value: isExcluded,
                                activeColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                onChanged: (bool? value) {
                                  Get.find<HomeController>().toggleExclusion(
                                      transaction, value ?? false);
                                },
                              ),
                            ),
                          ),
                          Text(
                            "Hesaba\nKatma",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 7,
                                height: 1.0,
                                color: subTitleColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),

                  // 1. İKON ALANI
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: themeColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: _buildSmartIcon(
                          displayCategory, transaction.ikon, themeColor, 22),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // 2. AÇIKLAMA VE KATEGORİ
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            transaction.aciklama ?? displayCategory,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: titleColor,
                              decoration: isExcluded
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          displayCategory,
                          style: TextStyle(
                              color: subTitleColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),

                  // 3. SAĞ TARAF
                  const SizedBox(width: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${isIncome ? '+' : '-'}${NumberFormat.currency(locale: 'tr_TR', symbol: '₺').format(amountVal).replaceAll('₺', '')}",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: amountColor,
                              decoration: isExcluded
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: isDarkMode
                                      ? Colors.white24
                                      : Colors.grey[300]!),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(formattedDate,
                                style: TextStyle(
                                    color: subTitleColor,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const SizedBox(width: 4),
                      Container(
                          height: 24,
                          width: 1,
                          color:
                              isDarkMode ? Colors.white12 : Colors.grey[200]),
                      _buildVerticalAction(
                        icon: Icons.edit,
                        label: "Düzenle",
                        color: Colors.blueAccent,
                        textColor: subTitleColor,
                        onTap: () {
                          Get.toNamed('/transaction', arguments: transaction);
                        },
                      ),
                      _buildVerticalAction(
                        icon: Icons.delete_outline,
                        label: "Sil",
                        color: Colors.redAccent,
                        textColor: subTitleColor,
                        onTap: () async {
                          bool? confirm = await _confirmDelete(context);
                          if (confirm == true) {
                            Get.find<HomeController>().islemSil(transaction.id);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalAction(
      {required IconData icon,
      required String label,
      required Color color,
      required VoidCallback onTap,
      required Color textColor}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(height: 1),
            Text(label,
                style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    color: textColor)),
          ],
        ),
      ),
    );
  }

  Widget _buildDeleteBackground() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          color: const Color(0xFFFF4D4D),
          borderRadius: BorderRadius.circular(12)),
      child: const Icon(Icons.delete_forever, color: Colors.white, size: 30),
    );
  }

  Future<bool?> _confirmDelete(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text("İşlemi Sil"),
          content: const Text("Bu işlemi silmek istediğinizden emin misiniz?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("İptal",
                  style: TextStyle(
                      color: isDarkMode ? Colors.grey : Colors.black54)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text("Sil", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
