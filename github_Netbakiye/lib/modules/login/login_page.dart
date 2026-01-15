import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gelir_gider_uygulamasi/modules/login/login_controller.dart';
import 'package:gelir_gider_uygulamasi/modules/login/register_page.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color anaRenk = Colors.blue;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.7,
              child: Image.asset(
                'assets/images/arkaplan.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.white.withOpacity(0.9),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset('assets/images/logo.png', height: 220),
                      const SizedBox(height: 10),
                      Text(
                        "Gelir Gider Takibi",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(height: 20),
                      const SizedBox(height: 30),
                      // E-Posta Alanı
                      TextField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "E-Posta",
                          labelStyle: const TextStyle(color: Colors.black54),
                          prefixIcon: const Icon(Icons.email_outlined,
                              color: Colors.black54),
                          // --- DÜZELTME BURADA ---
                          filled: true,
                          fillColor: Colors.white,
                          // -----------------------
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.black26),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Şifre Alanı
                      Obx(
                        () => TextField(
                          controller: controller.passwordController,
                          obscureText: controller.isPasswordHidden.value,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Şifre",
                            labelStyle: const TextStyle(color: Colors.black54),
                            prefixIcon: const Icon(Icons.lock_outline,
                                color: Colors.black54),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordHidden.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black54,
                              ),
                              onPressed: () =>
                                  controller.isPasswordHidden.toggle(),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: Colors.black26),
                            ),
                          ),
                        ),
                      ),
                      // Beni Hatırla
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              value: controller.isRememberMe.value,
                              onChanged: (val) =>
                                  controller.isRememberMe.value = val!,
                              activeColor: anaRenk,
                              checkColor: Colors.white,
                              side: const BorderSide(
                                  color: Colors.black54, width: 2),
                            ),
                          ),
                          const Text(
                            "Beni Hatırla",
                            style: TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Giriş Yap Butonu
                      Obx(
                        () => controller.isLoading.value
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: anaRenk,
                                ),
                              )
                            : ElevatedButton(
                                onPressed: () => controller.emailIleGirisYap(),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  backgroundColor: anaRenk,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 5,
                                ),
                                child: const Text(
                                  "Giriş Yap",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                      ),

                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey[600])),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "VEYA",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.grey[600])),
                        ],
                      ),
                      const SizedBox(height: 20),
                      OutlinedButton.icon(
                        onPressed: () => controller.googleIleGirisYap(),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: const BorderSide(color: Colors.grey),
                          backgroundColor: Colors.white,
                        ),
                        icon: Image.asset(
                          'assets/images/google_logo.png',
                          height: 24,
                          color: anaRenk,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.login, color: anaRenk),
                        ),
                        label: const Text(
                          "Google ile Devam Et",
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),

                      const SizedBox(height: 30),
                      // Kayıt Ol Alanı
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Hesabınız yok mu?",
                            style: TextStyle(color: Colors.black87),
                          ),
                          TextButton(
                            onPressed: () => Get.to(() => const RegisterPage()),
                            child: Text(
                              "Hemen Kayıt Ol",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: anaRenk,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
