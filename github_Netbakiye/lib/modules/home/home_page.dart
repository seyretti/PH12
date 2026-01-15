import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:gelir_gider_uygulamasi/modules/home/home_controller.dart';
import 'package:gelir_gider_uygulamasi/modules/dashboard/widgets/transaction_list.dart';
import 'package:gelir_gider_uygulamasi/modules/profile/profile_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF2C2C2C) : Colors.white;
    const double containerSize = 50.0;
    const double sideMargin = 12.0;
    const double totalSideWidth = containerSize + sideMargin;

    return Scaffold(
      backgroundColor: backgroundColor,

      // APP BAR
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/arkaplan.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        leadingWidth: totalSideWidth,
        leading: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: sideMargin),
          child: Container(
            width: containerSize,
            height: containerSize,
            padding: const EdgeInsets.all(1),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
                errorBuilder: (c, o, s) =>
                    const Icon(Icons.account_balance, color: Colors.orange),
              ),
            ),
          ),
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withOpacity(0.9),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.25),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: const Text(
              'Gelir Gider Takibi',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
                color: Colors.white,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ),
        actions: [
          Container(
            width: totalSideWidth,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: sideMargin),
            child: Obx(() {
              if (controller.isGuest) {
                return InkWell(
                  onTap: controller.goToLogin,
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: containerSize,
                    height: containerSize,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_add_alt_1_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(height: 1),
                        Text(
                          "Giriş Yap",
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                // ÜYE MODU: ÇIKIŞ BUTONU
                return Container(
                  width: containerSize,
                  height: containerSize,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.logout,
                      size: 24,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            blurRadius: 1.0,
                            color: Colors.white,
                            offset: Offset(0, 0)),
                      ],
                    ),
                    onPressed: () {
                      Get.defaultDialog(
                        title: "Çıkış Yap",
                        titleStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                        middleText: "Çıkmak istediğinizden emin misiniz?",
                        middleTextStyle: TextStyle(
                          color: isDark ? Colors.white70 : Colors.black87,
                        ),
                        textCancel: "Vazgeç",
                        textConfirm: "Evet, Çık",
                        confirmTextColor: Colors.white,
                        buttonColor: Colors.redAccent,
                        cancelTextColor: isDark ? Colors.white : Colors.black,
                        backgroundColor:
                            isDark ? const Color(0xFF333333) : Colors.white,
                        // -----------------------

                        radius: 12,
                        onConfirm: () {
                          Get.back();
                          controller.cikisYap();
                        },
                      );
                    },
                  ),
                );
              }
            }),
          ),
        ],
      ),

      body: Obx(() {
        if (controller.currentIndex.value == 0) {
          return _buildDashboard(context, isDark);
        } else {
          return const ProfilePage();
        }
      }),
      floatingActionButton: SizedBox(
        width: 72,
        height: 72,
        child: FloatingActionButton(
          onPressed: controller.goToTransaction,
          backgroundColor: const Color.fromARGB(255, 254, 136, 10),
          elevation: 6,
          shape: const CircleBorder(
            side: BorderSide(color: Colors.white, width: 2.5),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_rounded, size: 38, color: Colors.white, shadows: [
                Shadow(
                    blurRadius: 10.0,
                    color: Colors.white,
                    offset: Offset(0, 0)),
                Shadow(
                    blurRadius: 2.0,
                    color: Colors.black26,
                    offset: Offset(1, 1)),
              ]),
              Text("İşlem\nEkle",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 10,
                      height: 1.0)),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // --- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.zero,
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: backgroundColor,
            image: const DecorationImage(
              image: AssetImage('assets/images/arkaplan.jpg'),
              fit: BoxFit.cover,
              opacity: 0.95,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Obx(() {
                  final isActive = controller.currentIndex.value == 0;
                  return InkWell(
                    onTap: () => controller.changePage(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildIconBox(Icons.dashboard_outlined, isActive),
                        const SizedBox(height: 6),
                        _buildLabelBox("Anasayfa", isActive),
                      ],
                    ),
                  );
                }),
              ),
              const SizedBox(width: 80),
              Expanded(
                child: Obx(() {
                  final isActive = controller.currentIndex.value == 1;
                  return InkWell(
                    onTap: () => controller.changePage(1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildIconBox(Icons.person, isActive),
                        const SizedBox(height: 6),
                        _buildLabelBox("Profil", isActive),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconBox(IconData icon, bool isActive) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive ? Colors.white : Colors.white.withOpacity(0.3),
          width: isActive ? 1.5 : 1,
        ),
        boxShadow: isActive
            ? [
                BoxShadow(
                    color: Colors.white.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 1)
              ]
            : [],
      ),
      child: Icon(
        icon,
        size: 24,
        color: isActive ? Colors.white : Colors.white.withOpacity(0.6),
        shadows: [
          Shadow(
              blurRadius: isActive ? 4.0 : 0,
              color: Colors.white,
              offset: const Offset(0, 0))
        ],
      ),
    );
  }

  Widget _buildLabelBox(String text, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isActive
              ? Colors.white.withOpacity(0.6)
              : Colors.white.withOpacity(0.2),
          width: 0.8,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.white.withOpacity(0.7),
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDashboard(BuildContext context, bool isDark) {
    final Color incomeMain =
        isDark ? const Color(0xFF00BFA5) : const Color(0xFF00897B);
    final Color expenseMain =
        isDark ? const Color(0xFFFF5252) : const Color(0xFFD32F2F);
    final Color balanceMain =
        isDark ? const Color(0xFF448AFF) : const Color(0xFF1565C0);
    final sheetColor = isDark ? const Color(0xFF2C2C2C) : Colors.white;

    final double gelir = controller.toplamGelir.value;
    final double gider = controller.toplamGider.value;

    return controller.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
                child: SizedBox(
                  height: 90,
                  child: Row(
                    children: [
                      Expanded(
                          child: _buildCompactCard(
                              title: "GELİR",
                              amount: gelir,
                              icon: Icons.arrow_upward_rounded,
                              baseColor: incomeMain,
                              isDark: isDark)),
                      const SizedBox(width: 12),
                      Expanded(
                          child: _buildCompactCard(
                              title: "GİDER",
                              amount: gider,
                              icon: Icons.arrow_downward_rounded,
                              baseColor: expenseMain,
                              isDark: isDark)),
                      const SizedBox(width: 12),
                      Expanded(
                          child: _buildCompactCard(
                              title: "BAKİYE",
                              amount: (gelir - gider),
                              icon: Icons.account_balance_wallet_rounded,
                              baseColor: balanceMain,
                              isDark: isDark)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: sheetColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, -5))
                    ],
                  ),
                  child: Obx(() => TransactionList(
                      transactions: controller.islemler.toList())),
                ),
              ),
            ],
          );
  }

  Widget _buildCompactCard(
      {required String title,
      required double amount,
      required IconData icon,
      required Color baseColor,
      required bool isDark}) {
    final currencyFormat = NumberFormat.currency(locale: 'tr_TR', symbol: '');
    final bool isBalance = title == "BAKİYE";
    final Color amountColor = isBalance
        ? (isDark ? Colors.white : Colors.black87)
        : (isDark ? baseColor.withOpacity(0.95) : baseColor);

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: baseColor.withOpacity(isDark ? 0.15 : 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: baseColor.withOpacity(0.8), width: 1.5),
      ),
      child: Stack(
        children: [
          Positioned(
              right: -10,
              top: -10,
              child: Icon(icon, size: 60, color: baseColor.withOpacity(0.15))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: baseColor.withOpacity(0.2),
                            shape: BoxShape.circle),
                        child: Icon(icon, size: 14, color: baseColor)),
                    const SizedBox(width: 4),
                    Flexible(
                        child: Text(title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                                color: baseColor.withOpacity(0.9),
                                letterSpacing: 0.5))),
                  ],
                ),
                const SizedBox(height: 6),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text("${currencyFormat.format(amount)}₺",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: amountColor,
                          letterSpacing: -0.5)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
