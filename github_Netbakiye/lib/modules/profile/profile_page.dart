import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gelir_gider_uygulamasi/modules/profile/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      body: Obx(() {
        if (controller.isGuest) {
          return _buildGuestView(context, controller);
        } else {
          return _buildMemberView(context, controller);
        }
      }),
    );
  }

  Widget _buildGuestView(BuildContext context, ProfileController controller) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? const Color(0xFF121212) : const Color(0xFFF5F7FA);
    final cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF2D3142);

    return Container(
      color: bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.cloud_off_rounded,
                  size: 70,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Verilerinizi Güvenceye Alın",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Misafir modundasınız. Telefonunuz bozulursa veya uygulama silinirse verileriniz kaybolabilir.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildFeatureRow(
                      icon: Icons.sync_rounded,
                      color: Colors.blueAccent,
                      text: "Otomatik Bulut Yedekleme",
                      isDark: isDark,
                    ),
                    const SizedBox(height: 16),
                    _buildFeatureRow(
                      icon: Icons.verified_user_rounded,
                      color: Colors.green,
                      text: "Tamamen Ücretsiz Üyelik",
                      isDark: isDark,
                    ),
                    const SizedBox(height: 16),
                    _buildFeatureRow(
                      icon: Icons.block_flipped,
                      color: Colors.purpleAccent,
                      text: "%100 Reklamsız Deneyim",
                      isDark: isDark,
                    ),
                    const SizedBox(height: 16),
                    _buildFeatureRow(
                      icon: Icons.privacy_tip_rounded,
                      color: Colors.teal,
                      text: "%100 Veri Gizliliği ve Güvenliği",
                      isDark: isDark,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: controller.goToLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2C5070),
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.login_rounded),
                      SizedBox(width: 12),
                      Text(
                        "Ücretsiz Üye Ol / Giriş Yap",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Tema Değiştirme Butonu
              TextButton.icon(
                onPressed: () {
                  try {
                    controller.themeService.toggleTheme();
                  } catch (e) {
                    Get.changeThemeMode(
                        Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                  }
                },
                icon:
                    Icon(isDark ? Icons.light_mode : Icons.dark_mode, size: 18),
                label: Text(isDark ? "Açık Moda Geç" : "Koyu Moda Geç"),
                style: TextButton.styleFrom(foregroundColor: Colors.grey),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureRow({
    required IconData icon,
    required Color color,
    required String text,
    required bool isDark,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.grey[300] : Colors.grey[800],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMemberView(BuildContext context, ProfileController controller) {
    const navyBlue = Color(0xFF2C5070);

    final user = controller.user.value;

    final String firstName = user?.firstName ?? 'Kullanıcı';
    final String lastName = user?.lastName ?? '';
    final String? profilePhoto = user?.profilePhoto;
    final String email = user?.email ?? '-';

    final isDark = Theme.of(context).brightness == Brightness.dark;

    final pageBackgroundColor =
        isDark ? const Color(0xFF121212) : const Color(0xFFF5F7FA);
    final cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF2D3142);
    final subTextColor = isDark ? Colors.grey[400] : Colors.grey[600];
    final dividerColor = isDark ? Colors.white24 : Colors.grey[200];

    final bool hasProfilePhoto =
        profilePhoto != null && profilePhoto.isNotEmpty;

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: pageBackgroundColor,
      child: Center(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 120),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
                  blurRadius: 20,
                  spreadRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ],
              border: Border.all(
                color: isDark ? Colors.white10 : Colors.white,
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withOpacity(0.8)
                          : navyBlue.withOpacity(0.8),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: (isDark ? Colors.white : navyBlue)
                            .withOpacity(0.15),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    backgroundImage:
                        hasProfilePhoto ? NetworkImage(profilePhoto!) : null,
                    child: hasProfilePhoto
                        ? null
                        : Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Image.asset('assets/images/logo.png',
                                fit: BoxFit.contain,
                                errorBuilder: (_, __, ___) => const Icon(
                                    Icons.person,
                                    size: 50,
                                    color: navyBlue)),
                          ),
                  ),
                ),

                const SizedBox(height: 16),
                Text(
                  "$firstName $lastName",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                ),
                const SizedBox(height: 4),

                // --- EMAIL ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      email,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: subTextColor),
                    ),
                  ),
                ),

                const SizedBox(height: 24),
                Divider(color: dividerColor, thickness: 1),
                const SizedBox(height: 24),

                _buildInfoRow(
                    icon: Icons.person,
                    label: "Adı",
                    value: firstName,
                    isDark: isDark,
                    textColor: textColor),
                _buildInfoRow(
                    icon: Icons.person_outline,
                    label: "Soyadı",
                    value: lastName,
                    isDark: isDark,
                    textColor: textColor),
                _buildInfoRow(
                    icon: Icons.alternate_email,
                    label: "E-Posta",
                    value: email,
                    isDark: isDark,
                    textColor: textColor),

                const SizedBox(height: 10),
                Divider(color: dividerColor, thickness: 1),
                const SizedBox(height: 10),
                _buildThemeSwitch(
                  onToggle: () {
                    try {
                      controller.themeService.toggleTheme();
                    } catch (e) {
                      Get.changeThemeMode(
                          Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                    }
                  },
                  isDark: isDark,
                  textColor: textColor,
                  cardColor: cardColor,
                ),

                const SizedBox(height: 20),
                Divider(color: dividerColor, thickness: 1),
                const SizedBox(height: 3),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.defaultDialog(
                        title: "Hesabı Sil",
                        titleStyle: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                        middleText:
                            "Bütün verileriniz kalıcı olarak silinecek. Bu işlem geri alınamaz! Emin misiniz?",
                        middleTextStyle:
                            TextStyle(fontSize: 16, color: textColor),
                        radius: 12,
                        backgroundColor: cardColor,
                        cancel: OutlinedButton(
                          onPressed: () => Get.back(),
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  color: subTextColor ?? Colors.grey)),
                          child: Text("Vazgeç",
                              style: TextStyle(color: textColor)),
                        ),
                        confirm: ElevatedButton(
                          onPressed: () async {
                            Get.back();
                            controller.deleteAccount();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          child: const Text("Evet, Sil",
                              style: TextStyle(color: Colors.white)),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    icon: const Icon(Icons.delete_forever, size: 24),
                    label: const Text("Hesabımı ve Verilerimi Sil",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    required bool isDark,
    required Color textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isDark ? Colors.white10 : Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon,
                color: isDark ? Colors.white70 : const Color(0xFF2D3142),
                size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: TextStyle(
                        fontSize: 12,
                        color: isDark ? Colors.grey[400] : Colors.grey[500],
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 2),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(value,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: textColor)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeSwitch({
    required VoidCallback onToggle,
    required bool isDark,
    required Color textColor,
    required Color cardColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: (isDark ? Colors.white : Colors.indigo).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
                isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                color: isDark ? Colors.white : Colors.indigo,
                size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(isDark ? "Açık Mod" : "Koyu Mod",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor)),
          ),
          Switch(
            value: isDark,
            activeColor: Colors.white,
            activeTrackColor: Colors.indigo,
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey.shade300,
            onChanged: (_) {
              onToggle();
            },
          ),
        ],
      ),
    );
  }
}
